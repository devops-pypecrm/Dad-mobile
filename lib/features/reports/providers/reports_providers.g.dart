// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myPerformanceHash() => r'14903b64c9056420dedc54f9ba6de449981d0625';

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
String _$teamPerformanceHash() => r'd7529c0ba69c80e9193a09c9e71b955d90970229';

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
String _$myLeadsFunnelHash() => r'692f63c9696e1b7de5c741fe5e8e1f56fcc286d3';

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
String _$reportsSalesBookHash() => r'6b8d19ff930f472e6c404e4dd8ad6b000e8c77dd';

/// Dashboard's own Sales Book card is a *separate*, always-"This Month"
/// provider (`salesBookThisMonthProvider`, unchanged) — this one instead
/// follows [reportsDateRangeProvider], since the Reports screen's whole
/// point here is letting that filter actually apply to what it shows.
///
/// Copied from [reportsSalesBook].
@ProviderFor(reportsSalesBook)
final reportsSalesBookProvider =
    AutoDisposeFutureProvider<SalesBookSummary>.internal(
      reportsSalesBook,
      name: r'reportsSalesBookProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reportsSalesBookHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportsSalesBookRef = AutoDisposeFutureProviderRef<SalesBookSummary>;
String _$salesBookThisMonthHash() =>
    r'219842b0e099e5dd96338387d1d65bd303fe0c10';

/// Dashboard's own always-"This Month" Sales Book card — unaffected by
/// [reportsDateRangeProvider], deliberately kept separate from
/// [reportsSalesBookProvider] above.
///
/// Copied from [salesBookThisMonth].
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
String _$callReportHash() => r'5e509aabfea400cef925875031fc053ae9c8946b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Backs the Call Report screen. `period`/`direction` are family params so
/// switching either just re-fetches instead of needing separate providers.
///
/// Copied from [callReport].
@ProviderFor(callReport)
const callReportProvider = CallReportFamily();

/// Backs the Call Report screen. `period`/`direction` are family params so
/// switching either just re-fetches instead of needing separate providers.
///
/// Copied from [callReport].
class CallReportFamily extends Family<AsyncValue<CallReport>> {
  /// Backs the Call Report screen. `period`/`direction` are family params so
  /// switching either just re-fetches instead of needing separate providers.
  ///
  /// Copied from [callReport].
  const CallReportFamily();

  /// Backs the Call Report screen. `period`/`direction` are family params so
  /// switching either just re-fetches instead of needing separate providers.
  ///
  /// Copied from [callReport].
  CallReportProvider call({required String period, required String direction}) {
    return CallReportProvider(period: period, direction: direction);
  }

  @override
  CallReportProvider getProviderOverride(
    covariant CallReportProvider provider,
  ) {
    return call(period: provider.period, direction: provider.direction);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'callReportProvider';
}

/// Backs the Call Report screen. `period`/`direction` are family params so
/// switching either just re-fetches instead of needing separate providers.
///
/// Copied from [callReport].
class CallReportProvider extends AutoDisposeFutureProvider<CallReport> {
  /// Backs the Call Report screen. `period`/`direction` are family params so
  /// switching either just re-fetches instead of needing separate providers.
  ///
  /// Copied from [callReport].
  CallReportProvider({required String period, required String direction})
    : this._internal(
        (ref) => callReport(
          ref as CallReportRef,
          period: period,
          direction: direction,
        ),
        from: callReportProvider,
        name: r'callReportProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$callReportHash,
        dependencies: CallReportFamily._dependencies,
        allTransitiveDependencies: CallReportFamily._allTransitiveDependencies,
        period: period,
        direction: direction,
      );

  CallReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
    required this.direction,
  }) : super.internal();

  final String period;
  final String direction;

  @override
  Override overrideWith(
    FutureOr<CallReport> Function(CallReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CallReportProvider._internal(
        (ref) => create(ref as CallReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
        direction: direction,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CallReport> createElement() {
    return _CallReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CallReportProvider &&
        other.period == period &&
        other.direction == direction;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);
    hash = _SystemHash.combine(hash, direction.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CallReportRef on AutoDisposeFutureProviderRef<CallReport> {
  /// The parameter `period` of this provider.
  String get period;

  /// The parameter `direction` of this provider.
  String get direction;
}

class _CallReportProviderElement
    extends AutoDisposeFutureProviderElement<CallReport>
    with CallReportRef {
  _CallReportProviderElement(super.provider);

  @override
  String get period => (origin as CallReportProvider).period;
  @override
  String get direction => (origin as CallReportProvider).direction;
}

String _$dailyCallReportHash() => r'0a0585332f8505add3ce5c168d8a7c48764349b4';

/// Backs the Call Report screen's per-user table + summary cards. Keyed by
/// the resolved `startDate`/`endDate` (not the period label itself) so a
/// custom range or a differently-computed "today" still cache/refetch
/// correctly, plus an optional branch filter.
///
/// Copied from [dailyCallReport].
@ProviderFor(dailyCallReport)
const dailyCallReportProvider = DailyCallReportFamily();

/// Backs the Call Report screen's per-user table + summary cards. Keyed by
/// the resolved `startDate`/`endDate` (not the period label itself) so a
/// custom range or a differently-computed "today" still cache/refetch
/// correctly, plus an optional branch filter.
///
/// Copied from [dailyCallReport].
class DailyCallReportFamily extends Family<AsyncValue<DailyReport>> {
  /// Backs the Call Report screen's per-user table + summary cards. Keyed by
  /// the resolved `startDate`/`endDate` (not the period label itself) so a
  /// custom range or a differently-computed "today" still cache/refetch
  /// correctly, plus an optional branch filter.
  ///
  /// Copied from [dailyCallReport].
  const DailyCallReportFamily();

  /// Backs the Call Report screen's per-user table + summary cards. Keyed by
  /// the resolved `startDate`/`endDate` (not the period label itself) so a
  /// custom range or a differently-computed "today" still cache/refetch
  /// correctly, plus an optional branch filter.
  ///
  /// Copied from [dailyCallReport].
  DailyCallReportProvider call({
    required String startDate,
    required String endDate,
    String? branchId,
  }) {
    return DailyCallReportProvider(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
    );
  }

  @override
  DailyCallReportProvider getProviderOverride(
    covariant DailyCallReportProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      branchId: provider.branchId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailyCallReportProvider';
}

/// Backs the Call Report screen's per-user table + summary cards. Keyed by
/// the resolved `startDate`/`endDate` (not the period label itself) so a
/// custom range or a differently-computed "today" still cache/refetch
/// correctly, plus an optional branch filter.
///
/// Copied from [dailyCallReport].
class DailyCallReportProvider extends AutoDisposeFutureProvider<DailyReport> {
  /// Backs the Call Report screen's per-user table + summary cards. Keyed by
  /// the resolved `startDate`/`endDate` (not the period label itself) so a
  /// custom range or a differently-computed "today" still cache/refetch
  /// correctly, plus an optional branch filter.
  ///
  /// Copied from [dailyCallReport].
  DailyCallReportProvider({
    required String startDate,
    required String endDate,
    String? branchId,
  }) : this._internal(
         (ref) => dailyCallReport(
           ref as DailyCallReportRef,
           startDate: startDate,
           endDate: endDate,
           branchId: branchId,
         ),
         from: dailyCallReportProvider,
         name: r'dailyCallReportProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$dailyCallReportHash,
         dependencies: DailyCallReportFamily._dependencies,
         allTransitiveDependencies:
             DailyCallReportFamily._allTransitiveDependencies,
         startDate: startDate,
         endDate: endDate,
         branchId: branchId,
       );

  DailyCallReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.branchId,
  }) : super.internal();

  final String startDate;
  final String endDate;
  final String? branchId;

  @override
  Override overrideWith(
    FutureOr<DailyReport> Function(DailyCallReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DailyCallReportProvider._internal(
        (ref) => create(ref as DailyCallReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DailyReport> createElement() {
    return _DailyCallReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyCallReportProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.branchId == branchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, branchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailyCallReportRef on AutoDisposeFutureProviderRef<DailyReport> {
  /// The parameter `startDate` of this provider.
  String get startDate;

  /// The parameter `endDate` of this provider.
  String get endDate;

  /// The parameter `branchId` of this provider.
  String? get branchId;
}

class _DailyCallReportProviderElement
    extends AutoDisposeFutureProviderElement<DailyReport>
    with DailyCallReportRef {
  _DailyCallReportProviderElement(super.provider);

  @override
  String get startDate => (origin as DailyCallReportProvider).startDate;
  @override
  String get endDate => (origin as DailyCallReportProvider).endDate;
  @override
  String? get branchId => (origin as DailyCallReportProvider).branchId;
}

String _$expectedRevenueReportHash() =>
    r'246bd220d32b10c31d354ebdccb33d3809368a86';

/// Backs the Expected Revenue report screen. `startDate`/`endDate` are
/// optional (backend defaults to the current calendar month when both are
/// omitted) — passing `null` for both is a valid, meaningful "use the
/// default period" call, not an error state, so this isn't `required`
/// like [dailyCallReport]'s.
///
/// Copied from [expectedRevenueReport].
@ProviderFor(expectedRevenueReport)
const expectedRevenueReportProvider = ExpectedRevenueReportFamily();

/// Backs the Expected Revenue report screen. `startDate`/`endDate` are
/// optional (backend defaults to the current calendar month when both are
/// omitted) — passing `null` for both is a valid, meaningful "use the
/// default period" call, not an error state, so this isn't `required`
/// like [dailyCallReport]'s.
///
/// Copied from [expectedRevenueReport].
class ExpectedRevenueReportFamily
    extends Family<AsyncValue<ExpectedRevenueReport>> {
  /// Backs the Expected Revenue report screen. `startDate`/`endDate` are
  /// optional (backend defaults to the current calendar month when both are
  /// omitted) — passing `null` for both is a valid, meaningful "use the
  /// default period" call, not an error state, so this isn't `required`
  /// like [dailyCallReport]'s.
  ///
  /// Copied from [expectedRevenueReport].
  const ExpectedRevenueReportFamily();

  /// Backs the Expected Revenue report screen. `startDate`/`endDate` are
  /// optional (backend defaults to the current calendar month when both are
  /// omitted) — passing `null` for both is a valid, meaningful "use the
  /// default period" call, not an error state, so this isn't `required`
  /// like [dailyCallReport]'s.
  ///
  /// Copied from [expectedRevenueReport].
  ExpectedRevenueReportProvider call({
    String? startDate,
    String? endDate,
    String? branchId,
  }) {
    return ExpectedRevenueReportProvider(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
    );
  }

  @override
  ExpectedRevenueReportProvider getProviderOverride(
    covariant ExpectedRevenueReportProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      branchId: provider.branchId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'expectedRevenueReportProvider';
}

/// Backs the Expected Revenue report screen. `startDate`/`endDate` are
/// optional (backend defaults to the current calendar month when both are
/// omitted) — passing `null` for both is a valid, meaningful "use the
/// default period" call, not an error state, so this isn't `required`
/// like [dailyCallReport]'s.
///
/// Copied from [expectedRevenueReport].
class ExpectedRevenueReportProvider
    extends AutoDisposeFutureProvider<ExpectedRevenueReport> {
  /// Backs the Expected Revenue report screen. `startDate`/`endDate` are
  /// optional (backend defaults to the current calendar month when both are
  /// omitted) — passing `null` for both is a valid, meaningful "use the
  /// default period" call, not an error state, so this isn't `required`
  /// like [dailyCallReport]'s.
  ///
  /// Copied from [expectedRevenueReport].
  ExpectedRevenueReportProvider({
    String? startDate,
    String? endDate,
    String? branchId,
  }) : this._internal(
         (ref) => expectedRevenueReport(
           ref as ExpectedRevenueReportRef,
           startDate: startDate,
           endDate: endDate,
           branchId: branchId,
         ),
         from: expectedRevenueReportProvider,
         name: r'expectedRevenueReportProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$expectedRevenueReportHash,
         dependencies: ExpectedRevenueReportFamily._dependencies,
         allTransitiveDependencies:
             ExpectedRevenueReportFamily._allTransitiveDependencies,
         startDate: startDate,
         endDate: endDate,
         branchId: branchId,
       );

  ExpectedRevenueReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.branchId,
  }) : super.internal();

  final String? startDate;
  final String? endDate;
  final String? branchId;

  @override
  Override overrideWith(
    FutureOr<ExpectedRevenueReport> Function(ExpectedRevenueReportRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExpectedRevenueReportProvider._internal(
        (ref) => create(ref as ExpectedRevenueReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ExpectedRevenueReport> createElement() {
    return _ExpectedRevenueReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpectedRevenueReportProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.branchId == branchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, branchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpectedRevenueReportRef
    on AutoDisposeFutureProviderRef<ExpectedRevenueReport> {
  /// The parameter `startDate` of this provider.
  String? get startDate;

  /// The parameter `endDate` of this provider.
  String? get endDate;

  /// The parameter `branchId` of this provider.
  String? get branchId;
}

class _ExpectedRevenueReportProviderElement
    extends AutoDisposeFutureProviderElement<ExpectedRevenueReport>
    with ExpectedRevenueReportRef {
  _ExpectedRevenueReportProviderElement(super.provider);

  @override
  String? get startDate => (origin as ExpectedRevenueReportProvider).startDate;
  @override
  String? get endDate => (origin as ExpectedRevenueReportProvider).endDate;
  @override
  String? get branchId => (origin as ExpectedRevenueReportProvider).branchId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
