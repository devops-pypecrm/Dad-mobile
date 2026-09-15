// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$devicesHash() => r'166020043d2932d6d53b602c1752e846990cd09a';

/// Backs the Settings > Devices screen.
///
/// Copied from [Devices].
@ProviderFor(Devices)
final devicesProvider =
    AutoDisposeAsyncNotifierProvider<Devices, List<UserDeviceSession>>.internal(
      Devices.new,
      name: r'devicesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$devicesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Devices = AutoDisposeAsyncNotifier<List<UserDeviceSession>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
