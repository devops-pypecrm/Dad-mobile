// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionControllerHash() => r'90fcda82c37cf50ae0e4845e52c385340c17a1d6';

/// Single source of truth for "who is logged in". The router guard, the
/// authenticated shell, and every screen that needs the current user watch
/// this instead of re-reading storage themselves.
///
/// Copied from [SessionController].
@ProviderFor(SessionController)
final sessionControllerProvider =
    AsyncNotifierProvider<SessionController, UserSession?>.internal(
      SessionController.new,
      name: r'sessionControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sessionControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SessionController = AsyncNotifier<UserSession?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
