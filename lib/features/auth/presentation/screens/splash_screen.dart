import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/splash_provider.dart';
import '../widgets/pype_logo_reveal.dart';

/// Shown while [SessionController] is restoring the session from secure
/// storage, and for at least as long as the opening logo animation takes to
/// play — see `splashAnimationDoneProvider` and the router's `redirect`.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PypeLogoReveal(
          onFinished: () => ref.read(splashAnimationDoneProvider.notifier).complete(),
        ),
      ),
    );
  }
}
