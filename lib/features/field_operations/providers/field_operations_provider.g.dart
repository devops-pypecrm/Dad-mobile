// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_operations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fieldOperationsSnapshotHash() =>
    r'2b4ab7ec2a18b06412eab3cf37f599ad9dcfa6b3';

/// Combines today's check-ins (`checkInsFeedProvider`) with the visible
/// field-role roster (`scopedUsersProvider`) into the stat cards / team
/// roster / map markers the Field Operations dashboard shows — a direct
/// port of the `productivityMetrics`/`teamActivity`/`mapMarkers` `useMemo`
/// blocks in Dad-frontend's `pages/field-force/index.tsx`, including their
/// quirk of counting "Currently Checked In" from `type === 'CHECK_IN'` rows
/// only while a member's live status considers a check-in of ANY type —
/// kept as-is so the two clients report the same numbers for the same data.
///
/// Copied from [fieldOperationsSnapshot].
@ProviderFor(fieldOperationsSnapshot)
final fieldOperationsSnapshotProvider =
    AutoDisposeFutureProvider<FieldOperationsSnapshot>.internal(
      fieldOperationsSnapshot,
      name: r'fieldOperationsSnapshotProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$fieldOperationsSnapshotHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FieldOperationsSnapshotRef =
    AutoDisposeFutureProviderRef<FieldOperationsSnapshot>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
