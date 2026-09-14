// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_health_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadHealthListHash() => r'bf6e94947ba0317666e2825d4798a8feaf25f704';

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

abstract class _$LeadHealthList
    extends BuildlessAutoDisposeAsyncNotifier<LeadHealthListState> {
  late final LeadHealthKind kind;
  late final String? branchId;
  late final String? assignedTo;
  late final String? source;
  late final DateTime? startDate;
  late final DateTime? endDate;

  FutureOr<LeadHealthListState> build(
    LeadHealthKind kind, {
    String? branchId,
    String? assignedTo,
    String? source,
    DateTime? startDate,
    DateTime? endDate,
  });
}

/// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
/// [kind] plus every active filter (branch/date carried over from the
/// Dashboard's own filter when opened from its tile, plus user/source now
/// pickable in-screen). Changing any filter value re-keys the family to a
/// fresh (auto-disposed-when-unwatched) instance rather than mutating one
/// shared notifier — same pattern as `CallReportScreen`'s `_period`/
/// `_customRange` driving `dailyCallReportProvider` — so there's no
/// "fetch unfiltered, then reapply" step for a later fetch to race.
///
/// Copied from [LeadHealthList].
@ProviderFor(LeadHealthList)
const leadHealthListProvider = LeadHealthListFamily();

/// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
/// [kind] plus every active filter (branch/date carried over from the
/// Dashboard's own filter when opened from its tile, plus user/source now
/// pickable in-screen). Changing any filter value re-keys the family to a
/// fresh (auto-disposed-when-unwatched) instance rather than mutating one
/// shared notifier — same pattern as `CallReportScreen`'s `_period`/
/// `_customRange` driving `dailyCallReportProvider` — so there's no
/// "fetch unfiltered, then reapply" step for a later fetch to race.
///
/// Copied from [LeadHealthList].
class LeadHealthListFamily extends Family<AsyncValue<LeadHealthListState>> {
  /// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
  /// [kind] plus every active filter (branch/date carried over from the
  /// Dashboard's own filter when opened from its tile, plus user/source now
  /// pickable in-screen). Changing any filter value re-keys the family to a
  /// fresh (auto-disposed-when-unwatched) instance rather than mutating one
  /// shared notifier — same pattern as `CallReportScreen`'s `_period`/
  /// `_customRange` driving `dailyCallReportProvider` — so there's no
  /// "fetch unfiltered, then reapply" step for a later fetch to race.
  ///
  /// Copied from [LeadHealthList].
  const LeadHealthListFamily();

  /// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
  /// [kind] plus every active filter (branch/date carried over from the
  /// Dashboard's own filter when opened from its tile, plus user/source now
  /// pickable in-screen). Changing any filter value re-keys the family to a
  /// fresh (auto-disposed-when-unwatched) instance rather than mutating one
  /// shared notifier — same pattern as `CallReportScreen`'s `_period`/
  /// `_customRange` driving `dailyCallReportProvider` — so there's no
  /// "fetch unfiltered, then reapply" step for a later fetch to race.
  ///
  /// Copied from [LeadHealthList].
  LeadHealthListProvider call(
    LeadHealthKind kind, {
    String? branchId,
    String? assignedTo,
    String? source,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return LeadHealthListProvider(
      kind,
      branchId: branchId,
      assignedTo: assignedTo,
      source: source,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  LeadHealthListProvider getProviderOverride(
    covariant LeadHealthListProvider provider,
  ) {
    return call(
      provider.kind,
      branchId: provider.branchId,
      assignedTo: provider.assignedTo,
      source: provider.source,
      startDate: provider.startDate,
      endDate: provider.endDate,
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
  String? get name => r'leadHealthListProvider';
}

/// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
/// [kind] plus every active filter (branch/date carried over from the
/// Dashboard's own filter when opened from its tile, plus user/source now
/// pickable in-screen). Changing any filter value re-keys the family to a
/// fresh (auto-disposed-when-unwatched) instance rather than mutating one
/// shared notifier — same pattern as `CallReportScreen`'s `_period`/
/// `_customRange` driving `dailyCallReportProvider` — so there's no
/// "fetch unfiltered, then reapply" step for a later fetch to race.
///
/// Copied from [LeadHealthList].
class LeadHealthListProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          LeadHealthList,
          LeadHealthListState
        > {
  /// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
  /// [kind] plus every active filter (branch/date carried over from the
  /// Dashboard's own filter when opened from its tile, plus user/source now
  /// pickable in-screen). Changing any filter value re-keys the family to a
  /// fresh (auto-disposed-when-unwatched) instance rather than mutating one
  /// shared notifier — same pattern as `CallReportScreen`'s `_period`/
  /// `_customRange` driving `dailyCallReportProvider` — so there's no
  /// "fetch unfiltered, then reapply" step for a later fetch to race.
  ///
  /// Copied from [LeadHealthList].
  LeadHealthListProvider(
    LeadHealthKind kind, {
    String? branchId,
    String? assignedTo,
    String? source,
    DateTime? startDate,
    DateTime? endDate,
  }) : this._internal(
         () => LeadHealthList()
           ..kind = kind
           ..branchId = branchId
           ..assignedTo = assignedTo
           ..source = source
           ..startDate = startDate
           ..endDate = endDate,
         from: leadHealthListProvider,
         name: r'leadHealthListProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$leadHealthListHash,
         dependencies: LeadHealthListFamily._dependencies,
         allTransitiveDependencies:
             LeadHealthListFamily._allTransitiveDependencies,
         kind: kind,
         branchId: branchId,
         assignedTo: assignedTo,
         source: source,
         startDate: startDate,
         endDate: endDate,
       );

  LeadHealthListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.kind,
    required this.branchId,
    required this.assignedTo,
    required this.source,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final LeadHealthKind kind;
  final String? branchId;
  final String? assignedTo;
  final String? source;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  FutureOr<LeadHealthListState> runNotifierBuild(
    covariant LeadHealthList notifier,
  ) {
    return notifier.build(
      kind,
      branchId: branchId,
      assignedTo: assignedTo,
      source: source,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Override overrideWith(LeadHealthList Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeadHealthListProvider._internal(
        () => create()
          ..kind = kind
          ..branchId = branchId
          ..assignedTo = assignedTo
          ..source = source
          ..startDate = startDate
          ..endDate = endDate,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        kind: kind,
        branchId: branchId,
        assignedTo: assignedTo,
        source: source,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LeadHealthList, LeadHealthListState>
  createElement() {
    return _LeadHealthListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadHealthListProvider &&
        other.kind == kind &&
        other.branchId == branchId &&
        other.assignedTo == assignedTo &&
        other.source == source &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, kind.hashCode);
    hash = _SystemHash.combine(hash, branchId.hashCode);
    hash = _SystemHash.combine(hash, assignedTo.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LeadHealthListRef
    on AutoDisposeAsyncNotifierProviderRef<LeadHealthListState> {
  /// The parameter `kind` of this provider.
  LeadHealthKind get kind;

  /// The parameter `branchId` of this provider.
  String? get branchId;

  /// The parameter `assignedTo` of this provider.
  String? get assignedTo;

  /// The parameter `source` of this provider.
  String? get source;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _LeadHealthListProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          LeadHealthList,
          LeadHealthListState
        >
    with LeadHealthListRef {
  _LeadHealthListProviderElement(super.provider);

  @override
  LeadHealthKind get kind => (origin as LeadHealthListProvider).kind;
  @override
  String? get branchId => (origin as LeadHealthListProvider).branchId;
  @override
  String? get assignedTo => (origin as LeadHealthListProvider).assignedTo;
  @override
  String? get source => (origin as LeadHealthListProvider).source;
  @override
  DateTime? get startDate => (origin as LeadHealthListProvider).startDate;
  @override
  DateTime? get endDate => (origin as LeadHealthListProvider).endDate;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
