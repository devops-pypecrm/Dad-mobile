import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/secure_storage_provider.dart';
import '../../checkins/providers/checkins_feed_provider.dart';
import '../../followups/providers/followups_list_controller.dart';
import '../../followups/providers/my_day_provider.dart';
import '../../notifications/providers/notifications_controller.dart';
import '../../notifications/providers/push_notifications_controller.dart';
import '../../targets/providers/daily_achievement_controller.dart';
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
  }

  Future<void> logout() async {
    await ref.read(secureStorageServiceProvider).clear();
    state = const AsyncValue.data(null);
    _invalidateAccountScopedCaches();
  }

  /// Invoked by the Dio interceptor on a 401 — must never throw.
  Future<void> forceLogout() async {
    _wasForcedLogout = true;
    await ref.read(secureStorageServiceProvider).clear();
    state = const AsyncValue.data(null);
    _invalidateAccountScopedCaches();
  }

  /// Every other `keepAlive: true` provider in the app that caches data
  /// fetched *for the logged-in user* (as opposed to a stateless repository
  /// wrapper around Dio, which is safe to keep alive forever) must be
  /// invalidated here. `keepAlive` means "never auto-dispose", not "never
  /// changes" — without this, switching accounts on the same device left
  /// the previous account's hierarchy/notifications/follow-ups/check-ins
  /// visible indefinitely, since nothing ever told them the user changed.
  /// If you add a new `@Riverpod(keepAlive: true)` provider that fetches
  /// account-specific data, add it here too.
  void _invalidateAccountScopedCaches() {
    ref.invalidate(hierarchyUsersProvider);
    ref.invalidate(notificationsControllerProvider);
    ref.invalidate(myDayProvider);
    ref.invalidate(followUpsListControllerProvider);
    ref.invalidate(checkInsFeedProvider);
    ref.invalidate(dailyAchievementControllerProvider);
    // Re-registering on next login points this device's push token at the
    // new account instead of leaving it bound to whoever logged in first.
    ref.invalidate(pushNotificationsControllerProvider);
  }
}
