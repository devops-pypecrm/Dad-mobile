import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_theme_color_provider.dart';
import 'core/theme/theme_mode_provider.dart';
import 'core/widgets/keyboard_metrics_resync.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final seedColor = ref.watch(appSeedColorProvider);

    return MaterialApp.router(
      title: 'PypeCRM',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(seedColor: seedColor),
      darkTheme: AppTheme.dark(seedColor: seedColor),
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) => KeyboardMetricsResync(child: child ?? const SizedBox.shrink()),
    );
  }
}
