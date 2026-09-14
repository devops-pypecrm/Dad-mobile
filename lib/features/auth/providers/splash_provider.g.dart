// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$splashAnimationDoneHash() =>
    r'91f3516a1218132becb582f74babbccad2e6103b';

/// Flips to `true` once the splash screen's opening logo animation has
/// played through. The router redirect (`app_router.dart`) keeps the app on
/// `/splash` until this AND the real session restore are both done, so a
/// fast device where the session resolves in a few milliseconds doesn't cut
/// the animation short. Never resets back to `false` once set — a later
/// forced-logout-triggered restore shouldn't replay the full intro.
///
/// Copied from [SplashAnimationDone].
@ProviderFor(SplashAnimationDone)
final splashAnimationDoneProvider =
    NotifierProvider<SplashAnimationDone, bool>.internal(
      SplashAnimationDone.new,
      name: r'splashAnimationDoneProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$splashAnimationDoneHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SplashAnimationDone = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
