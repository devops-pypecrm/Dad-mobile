// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appSeedColorHash() => r'e5f6a7b8c9d0e5f6a7b8c9d0e5f6a7b8c9d0e5f6';

/// User's chosen theme color, persisted across launches via
/// SharedPreferences (stored as the color's 32-bit ARGB int) — same
/// pattern/rationale as `AppThemeMode` (cosmetic preference, not
/// sensitive, so the plain unencrypted store is the right tool). Defaults
/// to the original brand purple for a fresh install.
///
/// Copied from [AppSeedColor].
@ProviderFor(AppSeedColor)
final appSeedColorProvider = NotifierProvider<AppSeedColor, Color>.internal(
  AppSeedColor.new,
  name: r'appSeedColorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSeedColorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSeedColor = Notifier<Color>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
