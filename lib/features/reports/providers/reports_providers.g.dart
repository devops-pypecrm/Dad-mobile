// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myPerformanceHash() => r'f526aa6e8d7f2c561a334bdd4f2943d56db841b7';

/// See also [myPerformance].
@ProviderFor(myPerformance)
final myPerformanceProvider =
    AutoDisposeFutureProvider<List<PerformanceEntry>>.internal(
      myPerformance,
      name: r'myPerformanceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myPerformanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyPerformanceRef = AutoDisposeFutureProviderRef<List<PerformanceEntry>>;
String _$teamPerformanceHash() => r'86f574979d75d506b6c46fe54e89cfaa6cefd727';

/// Manager view — omitting `userId` makes the backend return the caller's
/// visible subordinates automatically (see ReportsRepository).
///
/// Copied from [teamPerformance].
@ProviderFor(teamPerformance)
final teamPerformanceProvider =
    AutoDisposeFutureProvider<List<PerformanceEntry>>.internal(
      teamPerformance,
      name: r'teamPerformanceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$teamPerformanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TeamPerformanceRef =
    AutoDisposeFutureProviderRef<List<PerformanceEntry>>;
String _$myLeadsFunnelHash() => r'3372072346efba1b189c61a7ef55922fdbb203c0';

/// See also [myLeadsFunnel].
@ProviderFor(myLeadsFunnel)
final myLeadsFunnelProvider =
    AutoDisposeFutureProvider<LeadsReportSummary>.internal(
      myLeadsFunnel,
      name: r'myLeadsFunnelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myLeadsFunnelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyLeadsFunnelRef = AutoDisposeFutureProviderRef<LeadsReportSummary>;
String _$salesBookThisMonthHash() =>
    r'219842b0e099e5dd96338387d1d65bd303fe0c10';

/// See also [salesBookThisMonth].
@ProviderFor(salesBookThisMonth)
final salesBookThisMonthProvider =
    AutoDisposeFutureProvider<SalesBookSummary>.internal(
      salesBookThisMonth,
      name: r'salesBookThisMonthProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$salesBookThisMonthHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesBookThisMonthRef = AutoDisposeFutureProviderRef<SalesBookSummary>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
