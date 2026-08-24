// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkins_feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkInsFeedHash() => r'fae7730addf51fe5f918d3847a6ccf5b22e69ebb';

/// The "Field Activity Feed" — today's check-ins across the visible team
/// (visibility is server-side, via `getVisibleUserIds`, see
/// Dad-backend/src/controllers/checkInController.ts).
///
/// Copied from [CheckInsFeed].
@ProviderFor(CheckInsFeed)
final checkInsFeedProvider =
    AsyncNotifierProvider<CheckInsFeed, List<CheckIn>>.internal(
      CheckInsFeed.new,
      name: r'checkInsFeedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkInsFeedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CheckInsFeed = AsyncNotifier<List<CheckIn>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
