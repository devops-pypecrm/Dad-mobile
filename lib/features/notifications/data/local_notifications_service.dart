import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_notifications_service.g.dart';

@Riverpod(keepAlive: true)
LocalNotificationsService localNotificationsService(ProviderRef<LocalNotificationsService> ref) =>
    LocalNotificationsService();

const _androidChannel = AndroidNotificationChannel(
  'pypecrm_default',
  'PypeCRM Notifications',
  description: 'New lead assignments, follow-up reminders, and other CRM alerts.',
  importance: Importance.high,
);

/// FCM only auto-displays a system notification when the app is
/// backgrounded/terminated — in the foreground it delivers silently via
/// `onMessage`, so this shows one manually using `flutter_local_notifications`.
class LocalNotificationsService {
  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init({required void Function(String? payload) onTap}) async {
    if (_initialized) return;
    _initialized = true;

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    await _plugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (response) => onTap(response.payload),
    );
  }

  Future<void> showForegroundMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    await _plugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      // Carries the same data payload so tapping this foreground-shown
      // notification routes identically to a background/terminated tap.
      payload: _encodePayload(message.data),
    );
  }

  static String _encodePayload(Map<String, dynamic> data) =>
      data.entries.map((e) => '${e.key}=${e.value}').join('&');
}
