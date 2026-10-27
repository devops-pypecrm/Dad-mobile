import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/startup/app_bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.init(Flavor.dev);

  // Deliberately not awaited — see ensureBackgroundServicesInitialized's
  // doc comment for why blocking runApp() on Hive/Firebase init was adding
  // visible lag before the splash animation even started.
  unawaited(ensureBackgroundServicesInitialized());

  runApp(const ProviderScope(child: App()));
}
