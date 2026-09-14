import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

/// Flips to `true` once the splash screen's opening logo animation has
/// played through. The router redirect (`app_router.dart`) keeps the app on
/// `/splash` until this AND the real session restore are both done, so a
/// fast device where the session resolves in a few milliseconds doesn't cut
/// the animation short. Never resets back to `false` once set — a later
/// forced-logout-triggered restore shouldn't replay the full intro.
@Riverpod(keepAlive: true)
class SplashAnimationDone extends _$SplashAnimationDone {
  @override
  bool build() => false;

  void complete() => state = true;
}
