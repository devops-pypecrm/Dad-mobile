// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkInHistoryHash() => r'd29202a239960a2730623706a04c5153994c6aab';

/// Paginated/sortable check-in history — the "Check-in History" table on
/// the Field Operations dashboard, matching Dad-frontend's
/// `recentCheckIns` query on `pages/field-force/index.tsx` (page size 10,
/// sorted by `createdAt`, independent of the "today" date filter the feed
/// screen/`checkInsFeedProvider` uses).
///
/// Copied from [CheckInHistory].
@ProviderFor(CheckInHistory)
final checkInHistoryProvider =
    AutoDisposeAsyncNotifierProvider<
      CheckInHistory,
      CheckInHistoryState
    >.internal(
      CheckInHistory.new,
      name: r'checkInHistoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkInHistoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CheckInHistory = AutoDisposeAsyncNotifier<CheckInHistoryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
