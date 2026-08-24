// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardBranchesHash() => r'697531f00b6f7ac2a33630c4a2f406271993c170';

/// Branch list for the filter dropdown. Mirrors `Dashboard.tsx`'s
/// `fetchBranches`: admins/super_admins get the full org branch list
/// (`GET /api/branches`); everyone else gets only the branches they
/// manage (`GET /api/users/my-team`'s `managedBranches`, which may be
/// empty). An empty result means the dropdown itself should be hidden,
/// same as the web app's `branches.length > 0` gate.
///
/// Copied from [dashboardBranches].
@ProviderFor(dashboardBranches)
final dashboardBranchesProvider =
    AutoDisposeFutureProvider<List<Branch>>.internal(
      dashboardBranches,
      name: r'dashboardBranchesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dashboardBranchesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardBranchesRef = AutoDisposeFutureProviderRef<List<Branch>>;
String _$dashboardSummaryHash() => r'41887c04b9fb195d9d3e6e5c9d4907efa93ed953';

/// See also [dashboardSummary].
@ProviderFor(dashboardSummary)
final dashboardSummaryProvider =
    AutoDisposeFutureProvider<DashboardSummary>.internal(
      dashboardSummary,
      name: r'dashboardSummaryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dashboardSummaryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardSummaryRef = AutoDisposeFutureProviderRef<DashboardSummary>;
String _$dashboardForecastHash() => r'cfa9b1d41342d08044f8aa19c73d411162a3c10a';

/// See also [dashboardForecast].
@ProviderFor(dashboardForecast)
final dashboardForecastProvider =
    AutoDisposeFutureProvider<SalesForecast>.internal(
      dashboardForecast,
      name: r'dashboardForecastProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dashboardForecastHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardForecastRef = AutoDisposeFutureProviderRef<SalesForecast>;
String _$leadSourcesHash() => r'34777615148cc4af034a39687f24d97e7efe4097';

/// See also [leadSources].
@ProviderFor(leadSources)
final leadSourcesProvider =
    AutoDisposeFutureProvider<List<LeadSourceStat>>.internal(
      leadSources,
      name: r'leadSourcesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$leadSourcesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeadSourcesRef = AutoDisposeFutureProviderRef<List<LeadSourceStat>>;
String _$topPerformersHash() => r'ee1278f96322cc07e3b4da0cedcd41d3341f6732';

/// See also [topPerformers].
@ProviderFor(topPerformers)
final topPerformersProvider =
    AutoDisposeFutureProvider<List<TopPerformer>>.internal(
      topPerformers,
      name: r'topPerformersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$topPerformersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopPerformersRef = AutoDisposeFutureProviderRef<List<TopPerformer>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
