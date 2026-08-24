import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/notifications/firebase_background_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.init(Flavor.prod);
  await Hive.initFlutter();

  // Only Android (google-services.json) and iOS (GoogleService-Info.plist)
  // have been configured for Firebase — there's no Web config (would need
  // `flutterfire configure` + a service worker), and push notifications
  // aren't meaningful in a desktop browser anyway, so skip it entirely
  // there rather than crashing `main()` before `runApp()` ever executes.
  if (!kIsWeb) {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  runApp(const ProviderScope(child: App()));
}
