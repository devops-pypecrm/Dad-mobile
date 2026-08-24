import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Registered via `FirebaseMessaging.onBackgroundMessage` in the flavor
/// entrypoints, before `runApp`. Runs in a separate isolate with no access
/// to the app's Riverpod container, so it re-initializes Firebase itself.
/// No further action needed here — when the app is backgrounded/terminated,
/// FCM auto-displays the system notification from the payload's
/// `notification` block; tapping it is handled by
/// `FirebaseMessaging.onMessageOpenedApp` / `getInitialMessage()` once the
/// app is back in the foreground (see PushNotificationsController).
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
