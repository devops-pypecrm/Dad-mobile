import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';

import '../notifications/firebase_background_handler.dart';

/// Hive + Firebase both take real wall-clock time (each is a platform
/// channel round trip) and neither is actually needed until well after the
/// opening splash animation — Hive only once a check-in offline-queue
/// screen is first visited (`checkInsLocalQueueProvider`), Firebase only
/// once `DashboardScreen` mounts post-login
/// (`PushNotificationsController.build()`). `main()` used to `await` both
/// before `runApp()`, blocking the very first frame on work nothing needed
/// yet — the visible lag before the splash animation even starts.
///
/// [ensureBackgroundServicesInitialized] is called once from `main()`
/// WITHOUT being awaited there, so `runApp()` proceeds immediately; the two
/// real consumers await this same memoized [Future] themselves before
/// touching Hive/Firebase, so initialization still only ever runs once (and
/// correctly waits for it if a consumer happens to ask before `main()`'s own
/// call has finished).
Future<void>? _bootstrapFuture;

Future<void> ensureBackgroundServicesInitialized() {
  return _bootstrapFuture ??= _init();
}

Future<void> _init() async {
  await Hive.initFlutter();
  if (!kIsWeb) {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}
