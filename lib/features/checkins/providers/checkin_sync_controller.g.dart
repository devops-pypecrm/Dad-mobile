// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_sync_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkInSyncHash() => r'fd53f8d32ab57596bd12a2b949928d680d369843';

/// Drives the check-in offline-write queue: submits immediately when
/// online, falls back to the local Hive queue when offline or the request
/// fails, and auto-retries the queue whenever connectivity comes back.
/// State is the current pending (unsynced) count, watched by the
/// dashboard/check-ins screens to show a "N pending sync" badge.
///
/// Copied from [CheckInSync].
@ProviderFor(CheckInSync)
final checkInSyncProvider = AsyncNotifierProvider<CheckInSync, int>.internal(
  CheckInSync.new,
  name: r'checkInSyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkInSyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckInSync = AsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
