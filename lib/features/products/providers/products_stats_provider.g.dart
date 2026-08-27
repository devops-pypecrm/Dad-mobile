// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsStatsHash() => r'02d90df5877c7a7d21cf9956b14a0182b4c277e3';

/// Backs the 3 stat cards at the top of the Products page. Deliberately a
/// separate fetch from the paginated/infinite-scroll list
/// (`ProductsListProvider`) — that one loads 20 at a time and would give
/// wildly wrong totals if used for this instead.
///
/// Copied from [productsStats].
@ProviderFor(productsStats)
final productsStatsProvider = AutoDisposeFutureProvider<ProductsStats>.internal(
  productsStats,
  name: r'productsStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductsStatsRef = AutoDisposeFutureProviderRef<ProductsStats>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
