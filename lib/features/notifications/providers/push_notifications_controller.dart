import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/router/app_router.dart';
import '../../app_updates/providers/app_update_provider.dart';
import '../data/local_notifications_service.dart';
import '../data/notifications_repository.dart';
import 'notifications_controller.dart';

part 'push_notifications_controller.g.dart';

/// Wires FCM end to end: requests permission, registers/refreshes the
/// device token against `POST /api/users/device-token`, shows a local
/// notification when a message arrives in the foreground, and deep-links to
/// the relevant screen on tap. Started once from the Dashboard (see
/// DashboardScreen) so it only runs once the user is authenticated — device
/// registration needs a valid JWT.
@Riverpod(keepAlive: true)
class PushNotificationsController extends _$PushNotificationsController {
  void hardReset() => state = const AsyncValue.loading();

  StreamSubscription<String>? _tokenRefreshSub;
  StreamSubscription<RemoteMessage>? _foregroundSub;
  StreamSubscription<RemoteMessage>? _openedAppSub;

  @override
  Future<void> build() async {
    // Firebase is only configured for Android/iOS (see main_dev.dart) —
    // never initialized on web, so touching FirebaseMessaging.instance
    // there would throw. Push is meaningless in a desktop browser anyway.
    if (kIsWeb) return;

    ref.onDispose(() {
      _tokenRefreshSub?.cancel();
      _foregroundSub?.cancel();
      _openedAppSub?.cancel();
    });

    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(alert: true, badge: true, sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      // User declined — respect it, don't nag. Push is a nice-to-have on
      // top of in-app/email notifications, never the only channel.
      return;
    }

    await ref.read(localNotificationsServiceProvider).init(
          onTap: (payload) => _routeFromPayload(_decodePayload(payload)),
        );

    final token = await messaging.getToken();
    if (token != null) await _registerToken(token);

    _tokenRefreshSub = messaging.onTokenRefresh.listen(_registerToken);

    _foregroundSub = FirebaseMessaging.onMessage.listen((message) {
      ref.read(localNotificationsServiceProvider).showForegroundMessage(message);
      // Most pushes originate from `NotificationService.send()` creating an
      // in-app `Notification` row server-side too, so a push arriving is
      // also a reliable signal to refresh the bell/list now rather than
      // waiting up to 30s for the next poll — this is the mobile
      // equivalent of the web app's Socket.io `notification` listener
      // triggering the same query invalidation, without needing a
      // separate socket client.
      ref.read(notificationsControllerProvider.notifier).refresh();

      // `notifyAppUpdate.ts` (run by `publish_release.sh` right after every
      // publish, or by hand via `notify_app_update.sh`) sends this exact
      // `type` so a newly-published release surfaces the update dialog
      // immediately in an already-open app — not just on the next cold
      // launch's version check. Invalidating here is enough: `UpdateChecker`
      // is always mounted and reactively watches the same provider chain,
      // so it shows the dialog the moment this recomputes.
      if (message.data['type'] == 'app_update') {
        ref.invalidate(latestMobileReleaseProvider);
      }
    });

    _openedAppSub = FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _routeFromPayload(message.data);
    });

    // App was cold-started by tapping a notification (was fully terminated).
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _routeFromPayload(initialMessage.data);
    }
  }

  /// Re-POSTs this device's current FCM token against whichever account is
  /// now authenticated. Must be called after every successful `login()`,
  /// `switchToAccount()`, and `addAccount()` in `session_provider.dart` —
  /// `build()` above only ever runs ONCE per app process (this provider is
  /// `keepAlive`, and it's only watched by `DashboardScreen`, which doesn't
  /// remount when switching between already-logged-in accounts or when
  /// logging out and back in within the same running app). Without this,
  /// re-registration for the newly active user never happens until the
  /// next full app restart — meaning switching accounts (or logging out and
  /// back into a different one) silently leaves push notifications
  /// pointed at the PREVIOUS account's user row on this device. This is
  /// safe to call even before `build()` has ever run (fresh install, first
  /// login) — worst case it duplicates the registration `build()` is about
  /// to do itself, which is harmless (`POST` is idempotent).
  Future<void> reRegisterCurrentToken() async {
    if (kIsWeb) return;
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) await _registerToken(token);
    } catch (_) {
      // Same best-effort contract as `_registerToken` — never let push
      // re-registration block or fail the login/switch flow it's called from.
    }
  }

  Future<void> _registerToken(String token) async {
    try {
      await ref.read(notificationsRepositoryProvider).registerDeviceToken(token);
    } catch (_) {
      // Best-effort — a failed registration just means this device won't
      // get push until the next successful attempt (app restart, token
      // refresh); it must never crash notification setup.
    }
  }

  Map<String, String> _decodePayload(String? payload) {
    if (payload == null || payload.isEmpty) return {};
    return {
      for (final pair in payload.split('&'))
        if (pair.contains('=')) pair.split('=').first: pair.split('=').skip(1).join('='),
    };
  }

  /// `relatedResource`/`relatedId` come from the backend's `Notification`
  /// model, but `NotificationService.send()` doesn't currently populate them
  /// at most call sites (see Dad-backend/src/services/notificationService.ts)
  /// — so this falls back to the dashboard whenever they're absent, which is
  /// the common case today, rather than pretending to deep-link somewhere
  /// it can't actually resolve.
  void _routeFromPayload(Map<String, dynamic> data) {
    final router = ref.read(goRouterProvider);
    final relatedResource = data['relatedResource'] as String?;
    final relatedId = data['relatedId'] as String?;

    if (data['type'] == 'app_update') {
      // Tapped an update-available notification while backgrounded/killed
      // (the foreground case is handled directly in `onMessage` above,
      // without needing a tap at all) — go straight to the Updates screen
      // rather than the dashboard, since that's the entire reason this
      // notification exists.
      router.push(AppRoutes.updates);
    } else if (relatedResource == 'Lead' && relatedId != null && relatedId.isNotEmpty) {
      router.push('/leads/$relatedId');
    } else if (relatedResource == 'FollowUp') {
      router.push(AppRoutes.followups);
    } else {
      router.go(AppRoutes.home);
    }
  }
}
