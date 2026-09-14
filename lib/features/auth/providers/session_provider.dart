import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/secure_storage_provider.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../../accounts/providers/account_detail_provider.dart';
import '../../accounts/providers/accounts_list_provider.dart';
import '../../calls/providers/call_logs_list_provider.dart';
import '../../calls/providers/call_settings_provider.dart';
import '../../calls/providers/call_stats_provider.dart';
import '../../checkins/providers/checkins_feed_provider.dart';
import '../../dashboard/providers/dashboard_provider.dart';
import '../../followups/providers/followups_list_controller.dart';
import '../../followups/providers/my_day_provider.dart';
import '../../leads/providers/lead_detail_provider.dart';
import '../../leads/providers/lead_health_list_provider.dart';
import '../../leads/providers/leads_list_provider.dart';
import '../../leads/providers/re_enquiries_provider.dart';
import '../../notifications/data/notifications_repository.dart';
import '../../notifications/providers/notifications_controller.dart';
import '../../notifications/providers/push_notifications_controller.dart';
import '../../opportunities/providers/opportunities_list_provider.dart';
import '../../opportunities/providers/opportunity_detail_provider.dart';
import '../../opportunities/providers/opportunity_timeline_provider.dart';
import '../../payments/providers/emi_schedules_provider.dart';
import '../../products/providers/products_list_provider.dart';
import '../../products/providers/products_stats_provider.dart';
import '../../reports/providers/reports_providers.dart';
import '../../search/providers/search_controller.dart';
import '../../targets/providers/daily_achievement_controller.dart';
import '../../targets/providers/targets_providers.dart';
import '../../users/providers/users_provider.dart';
import '../data/auth_repository.dart';
import '../domain/user_session.dart';

part 'session_provider.g.dart';

/// Single source of truth for "who is logged in". The router guard, the
/// authenticated shell, and every screen that needs the current user watch
/// this instead of re-reading storage themselves.
@Riverpod(keepAlive: true)
class SessionController extends _$SessionController {
  /// Set right before `forceLogout()` clears the session, so the login
  /// screen can tell "your token expired" apart from a normal manual
  /// logout and explain what happened instead of silently landing on
  /// login with whatever the user was doing (e.g. mid-way through the
  /// check-in form) just gone.
  bool _wasForcedLogout = false;

  /// One-shot read — returns the flag and resets it, so the notice is
  /// shown exactly once, not on every subsequent rebuild of the login screen.
  bool consumeForcedLogoutFlag() {
    final was = _wasForcedLogout;
    _wasForcedLogout = false;
    return was;
  }

  @override
  Future<UserSession?> build() => _restoreSession();

  Future<UserSession?> _restoreSession() async {
    final storage = ref.read(secureStorageServiceProvider);
    final token = await storage.readToken();
    if (token == null) return null;

    try {
      // Validates the token is still accepted server-side and refreshes
      // role/organisation in case they changed since the last login.
      final repository = ref.read(authRepositoryProvider);
      final me = await repository.fetchCurrentUser();
      final session = me.copyWith(token: token);
      await storage.saveUserInfo(jsonEncode(session.toJson()));
      return session;
    } on ApiException catch (e) {
      if (e.statusCode == 401) {
        // The Dio interceptor already cleared storage and will call
        // forceLogout(); returning null here keeps this build in sync.
        return null;
      }
      // Offline or backend unreachable: fall back to the last known
      // session so the field app stays usable without a network hop.
      final cached = await storage.readUserInfo();
      if (cached == null) return null;
      return UserSession.fromJson(jsonDecode(cached) as Map<String, dynamic>);
    }
  }

  /// Re-fetches `/auth/me` and updates the active session in place — for
  /// when the user themself (not a token/account change) edited their own
  /// profile (name/phone/photo) on the new Account screen, so the drawer
  /// header etc. reflect it immediately without needing a re-login. Unlike
  /// [switchToAccount]/[login], this is still the SAME user, so it
  /// deliberately does NOT call `_invalidateAccountScopedCaches()` or touch
  /// push registration — nothing account-scoped changed.
  Future<void> refreshFromServer() async {
    final current = state.valueOrNull;
    if (current == null) return;
    try {
      final repository = ref.read(authRepositoryProvider);
      final refreshed = (await repository.fetchCurrentUser()).copyWith(token: current.token);
      final storage = ref.read(secureStorageServiceProvider);
      await storage.saveUserInfo(jsonEncode(refreshed.toJson()));
      state = AsyncValue.data(refreshed);
    } catch (_) {
      // Best-effort refresh — the caller already has the server's response
      // to update its own local form state from; a failure here just means
      // the drawer/header lag behind until the next natural session
      // refresh (app restart, 401 retry, etc).
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      final session = await repository.login(email: email, password: password);

      final storage = ref.read(secureStorageServiceProvider);
      await storage.saveToken(session.token!);
      await storage.saveUserInfo(jsonEncode(session.toJson()));

      return session;
    });
    // Logging out of one account and into a different one within the same
    // running app never re-runs PushNotificationsController.build() (see
    // its `reRegisterCurrentToken` doc comment) — without this, the newly
    // logged-in account's push notifications would silently stay pointed
    // at whichever account was active before, until the next cold restart.
    if (state.hasValue) {
      unawaited(ref.read(pushNotificationsControllerProvider.notifier).reRegisterCurrentToken());
    }
  }

  /// Logging out of the ACTIVE account should never strand the user on the
  /// login screen if another account is still saved on this device — same
  /// "sign out of one, land on another you're still signed into" behavior
  /// as Gmail's account switcher. Only actually clears everything and
  /// returns to login once no saved account is left (or none of them turn
  /// out to still be valid).
  Future<void> logout() async {
    // Best-effort, before the token that authorizes this call gets wiped
    // below — must never block logout (offline, server hiccup, etc. should
    // still let the user out). See `clearDeviceToken`'s doc comment for why
    // this matters: without it, the departing account keeps this device's
    // push token registered until whoever logs in next overwrites it.
    try {
      await ref.read(notificationsRepositoryProvider).clearDeviceToken();
    } catch (_) {}

    await _dropActiveAndSwitchToNextSavedOrClear(isForced: false);
  }

  /// Invoked by the Dio interceptor on a 401 — must never throw. Same
  /// "fall through to another saved account" behavior as [logout]: the
  /// account that just expired is discarded, but if another saved account
  /// is still valid the user lands there instead of being kicked all the
  /// way out. `_wasForcedLogout` (and its "session expired" messaging on
  /// the login screen) is only set if this ends up with nothing left to
  /// fall back to.
  Future<void> forceLogout() async {
    final landedOnLogin = await _dropActiveAndSwitchToNextSavedOrClear(isForced: true);
    if (landedOnLogin) _wasForcedLogout = true;
  }

  /// Discards the current active session (it's the one being logged out of
  /// / the one whose token just failed), then tries each saved account in
  /// turn — most-recently-used first — until one revalidates successfully
  /// via `/auth/me`, same staleness check [switchToAccount] does. A saved
  /// account that turns out to be stale is dropped rather than retried
  /// later. Returns `true` if nothing was left to fall back to (storage
  /// fully cleared, state set to null — the login screen shows).
  Future<bool> _dropActiveAndSwitchToNextSavedOrClear({required bool isForced}) async {
    final storage = ref.read(secureStorageServiceProvider);
    var remaining = await _readSavedAccounts(storage);

    while (remaining.isNotEmpty) {
      final next = remaining.removeAt(0);
      await storage.saveToken(next.token!);
      await storage.saveUserInfo(jsonEncode(next.toJson()));
      try {
        final repository = ref.read(authRepositoryProvider);
        final refreshed = (await repository.fetchCurrentUser()).copyWith(token: next.token);
        await storage.saveUserInfo(jsonEncode(refreshed.toJson()));
        await _writeSavedAccounts(storage, remaining);
        state = AsyncValue.data(refreshed);
        _invalidateAccountScopedCaches();
        return false;
      } on ApiException {
        // Stale — already removed from `remaining` above, try the next one.
        continue;
      }
    }

    await storage.clear();
    state = const AsyncValue.data(null);
    _invalidateAccountScopedCaches();
    return true;
  }

  Future<List<UserSession>> _readSavedAccounts(SecureStorageService storage) async {
    final json = await storage.readSavedAccountsJson();
    if (json == null || json.isEmpty) return [];
    final list = jsonDecode(json) as List<dynamic>;
    return list
        .map((e) => UserSession.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> _writeSavedAccounts(SecureStorageService storage, List<UserSession> accounts) {
    return storage.saveSavedAccountsJson(
      jsonEncode(accounts.map((s) => s.toJson()).toList()),
    );
  }

  List<UserSession> _upsert(List<UserSession> accounts, UserSession account) {
    return [
      for (final a in accounts)
        if (a.id != account.id) a,
      account,
    ];
  }

  /// Every logged-in-but-not-active account on this device — the "Saved
  /// Accounts" list on the account switcher screen.
  Future<List<UserSession>> loadSavedAccounts() async {
    final storage = ref.read(secureStorageServiceProvider);
    return _readSavedAccounts(storage);
  }

  /// Logs into a second (or further) account WITHOUT signing out of the
  /// current one — the current active session is preserved into the saved
  /// list, and the newly logged-in account becomes active. Deliberately
  /// does not set `state = AsyncValue.loading()` first (unlike [login]):
  /// this runs from a small "Add Account" sheet while the rest of the app
  /// is still showing the current account's data, and clobbering `state`
  /// here would flash the whole logged-in app into a loading state for an
  /// unrelated background action. The sheet tracks its own local
  /// loading/error state instead; any exception here just propagates to it.
  Future<void> addAccount({required String email, required String password}) async {
    final repository = ref.read(authRepositoryProvider);
    final newSession = await repository.login(email: email, password: password);
    final storage = ref.read(secureStorageServiceProvider);
    final current = state.valueOrNull;

    if (current != null && current.id == newSession.id) {
      // Same account, re-entered — just refresh its stored token/info in
      // place rather than duplicating it into the saved list.
      await storage.saveToken(newSession.token!);
      await storage.saveUserInfo(jsonEncode(newSession.toJson()));
      state = AsyncValue.data(newSession);
      return;
    }

    var saved = await _readSavedAccounts(storage);
    if (current != null) saved = _upsert(saved, current);
    saved = saved.where((s) => s.id != newSession.id).toList();
    await _writeSavedAccounts(storage, saved);

    await storage.saveToken(newSession.token!);
    await storage.saveUserInfo(jsonEncode(newSession.toJson()));
    state = AsyncValue.data(newSession);
    _invalidateAccountScopedCaches();
  }

  /// Switches the active account to a previously-saved one, WITHOUT a
  /// logout/login round trip. Re-validates the saved token via `/auth/me`
  /// before committing (same revalidation [_restoreSession] already does
  /// on cold start) — a saved token can go stale (password change,
  /// `tokenVersion` bump, natural JWT expiry) while it sat inactive, and
  /// trusting it blindly would silently switch the active session to a
  /// broken one. On a confirmed-expired (401) saved account, storage is
  /// rolled back to whichever account was active before this call, and the
  /// now-known-stale entry is dropped from the saved list so it doesn't
  /// keep failing the same way on every future attempt.
  Future<void> switchToAccount(String userId) async {
    final storage = ref.read(secureStorageServiceProvider);
    final saved = await _readSavedAccounts(storage);
    final index = saved.indexWhere((s) => s.id == userId);
    if (index == -1) return;
    final target = saved[index];
    final previous = state.valueOrNull;

    // Dio's auth interceptor reads the token fresh from storage on every
    // request, so this alone is enough to make the revalidation call below
    // (and every request after it) act as the target account.
    await storage.saveToken(target.token!);
    await storage.saveUserInfo(jsonEncode(target.toJson()));

    try {
      final repository = ref.read(authRepositoryProvider);
      final refreshed = (await repository.fetchCurrentUser()).copyWith(token: target.token);
      await storage.saveUserInfo(jsonEncode(refreshed.toJson()));

      var remaining = List.of(saved)..removeAt(index);
      if (previous != null) remaining = _upsert(remaining, previous);
      await _writeSavedAccounts(storage, remaining);

      state = AsyncValue.data(refreshed);
      _invalidateAccountScopedCaches();
    } on ApiException catch (e) {
      if (previous != null) {
        await storage.saveToken(previous.token!);
        await storage.saveUserInfo(jsonEncode(previous.toJson()));
      } else {
        await storage.clear();
      }
      if (e.statusCode == 401) {
        final remaining = List.of(saved)..removeAt(index);
        await _writeSavedAccounts(storage, remaining);
      }
      rethrow;
    }
  }

  /// Forgets a saved login on this device — never touches the active
  /// session (there's no "remove the active account" here; that's Logout).
  Future<void> removeSavedAccount(String userId) async {
    final storage = ref.read(secureStorageServiceProvider);
    final saved = await _readSavedAccounts(storage);
    await _writeSavedAccounts(storage, saved.where((s) => s.id != userId).toList());
  }

  /// Every provider in the app that caches data fetched *for the logged-in
  /// user/org* — not just `keepAlive: true` ones. The original version of
  /// this only listed `keepAlive` providers on the theory that plain
  /// `autoDispose` providers "just refetch naturally" — false whenever the
  /// screen that watches one stays mounted underneath the switch (e.g. the
  /// Dashboard sitting in the nav stack below the pushed Account Switcher
  /// screen): its `ref.watch` calls keep those `autoDispose` providers
  /// alive too, so without an explicit invalidate they kept showing the
  /// PREVIOUS account's cached data after a switch. `ref.invalidate(...)`
  /// is always safe to call even on a provider nobody's currently
  /// watching, so being exhaustive here costs nothing. Also resets the
  /// Dashboard's own branch/month filter `StateProvider`s — a branch id
  /// selected under one org is meaningless (or could even collide by
  /// coincidence) under another.
  ///
  /// If you add a new provider anywhere that fetches account/org-scoped
  /// data, add it here too — nothing enforces this automatically.
  void _invalidateAccountScopedCaches() {
    // `ref.invalidate()` alone still isn't enough for a currently-mounted
    // screen (e.g. the Leads tab sitting underneath the pushed Account
    // Switcher screen — a plain `ShellRoute`, not disposed by navigating
    // away to a sibling top-level route): Riverpod's default rebuild-on-
    // invalidate is "seamless" — it keeps the PREVIOUS account's data
    // visible via `state.valueOrNull` for however long the fresh fetch
    // takes, exactly like the deliberate `.copyWithPrevious()` pattern
    // `LeadsList.applyFilters`/etc. use on purpose for a same-user
    // background refresh. That's fine when it's still your own data; it's
    // not fine here — for a moment after switching, the screen would be
    // showing a DIFFERENT PERSON's leads/deals/etc. Confirmed live: opening
    // Leads immediately after switching still showed the previous
    // account's list until the refetch finished.
    //
    // Calling each notifier's own `hardReset()` method (defined alongside
    // its `build()`) forces every listener to see a genuine empty loading
    // state THIS INSTANT (no previous value carried over), for every
    // provider here that's a class-based notifier. It has to be a method on
    // the notifier itself, not something done from out here: Riverpod's
    // `AsyncNotifierBase.state` setter is `@protected`, so this file can't
    // legally assign `.state` on a notifier obtained via
    // `ref.read(provider.notifier)` directly. Plain derived/read-only
    // `@riverpod Future` functions (no notifier class, nothing to call
    // `hardReset()` on) only get `ref.invalidate()` — they still refetch
    // correctly, just via Riverpod's normal seamless transition; lower risk
    // since none of those are per-user list/detail screens a rep would be
    // staring at mid-switch.
    // Users / hierarchy
    ref.invalidate(hierarchyUsersProvider);
    ref.invalidate(scopedUsersProvider);
    // Notifications
    ref.read(notificationsControllerProvider.notifier).hardReset();
    // `hardReset()` alone does NOT re-register push for the new account —
    // it only flips the provider's own AsyncValue to loading, it doesn't
    // re-run `build()` (this provider is `keepAlive` and only watched by
    // DashboardScreen, which doesn't remount on a same-process account
    // switch). `reRegisterCurrentToken()` is the actual fix — see its doc
    // comment on `PushNotificationsController`.
    unawaited(ref.read(pushNotificationsControllerProvider.notifier).reRegisterCurrentToken());
    // Follow-ups / My Day
    ref.read(myDayProvider.notifier).hardReset();
    ref.read(followUpsListControllerProvider.notifier).hardReset();
    // Check-ins
    ref.read(checkInsFeedProvider.notifier).hardReset();
    // Targets
    ref.read(dailyAchievementControllerProvider.notifier).hardReset();
    ref.invalidate(myTargetsProvider);
    ref.invalidate(teamTargetsProvider);
    // Dashboard (including its branch/month filter selections)
    ref.invalidate(dashboardDateRangeProvider);
    ref.invalidate(dashboardBranchProvider);
    ref.invalidate(dashboardBranchesProvider);
    ref.invalidate(dashboardSummaryProvider);
    ref.invalidate(dashboardForecastProvider);
    ref.invalidate(dashboardLeadHealthProvider);
    ref.invalidate(leadSourcesProvider);
    ref.invalidate(topPerformersProvider);
    // Leads
    ref.read(leadsListProvider.notifier).hardReset();
    ref.invalidate(leadDetailProvider);
    ref.invalidate(leadHealthListProvider);
    ref.invalidate(reEnquiriesProvider);
    // Opportunities
    ref.read(opportunitiesListProvider.notifier).hardReset();
    ref.invalidate(opportunityDetailProvider);
    ref.invalidate(opportunityTimelineProvider);
    // Accounts (CRM companies, not login accounts)
    ref.read(accountsListProvider.notifier).hardReset();
    ref.invalidate(accountDetailProvider);
    // Products
    ref.read(productsListProvider.notifier).hardReset();
    ref.invalidate(productsStatsProvider);
    // Payments / EMI
    ref.invalidate(emiSchedulesProvider);
    // Calls
    ref.read(callLogsListProvider.notifier).hardReset();
    ref.invalidate(callStatsProvider);
    ref.read(callSettingsControllerProvider.notifier).hardReset();
    // Reports
    ref.invalidate(reportsDateRangeProvider);
    ref.invalidate(myPerformanceProvider);
    ref.invalidate(teamPerformanceProvider);
    ref.invalidate(myLeadsFunnelProvider);
    ref.invalidate(salesBookThisMonthProvider);
    ref.invalidate(reportsSalesBookProvider);
    ref.invalidate(callReportProvider);
    ref.invalidate(dailyCallReportProvider);
    // Search
    ref.read(searchControllerProvider.notifier).hardReset();
  }
}
