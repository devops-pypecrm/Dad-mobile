import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/router/app_router.dart';
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

    if (relatedResource == 'Lead' && relatedId != null && relatedId.isNotEmpty) {
      router.push('/leads/$relatedId');
    } else if (relatedResource == 'FollowUp') {
      router.push(AppRoutes.followups);
    } else {
      router.go(AppRoutes.home);
    }
  }
}
