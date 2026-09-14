// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunityTimelineHash() =>
    r'bf2372269340dfe3edfcbe2f6b6e5c40685ee1ea';

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

/// Backs the "Timeline & Files" tab on the Opportunity detail screen.
///
/// Copied from [opportunityTimeline].
@ProviderFor(opportunityTimeline)
const opportunityTimelineProvider = OpportunityTimelineFamily();

/// Backs the "Timeline & Files" tab on the Opportunity detail screen.
///
/// Copied from [opportunityTimeline].
class OpportunityTimelineFamily
    extends Family<AsyncValue<List<OpportunityTimelineItem>>> {
  /// Backs the "Timeline & Files" tab on the Opportunity detail screen.
  ///
  /// Copied from [opportunityTimeline].
  const OpportunityTimelineFamily();

  /// Backs the "Timeline & Files" tab on the Opportunity detail screen.
  ///
  /// Copied from [opportunityTimeline].
  OpportunityTimelineProvider call(String opportunityId) {
    return OpportunityTimelineProvider(opportunityId);
  }

  @override
  OpportunityTimelineProvider getProviderOverride(
    covariant OpportunityTimelineProvider provider,
  ) {
    return call(provider.opportunityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'opportunityTimelineProvider';
}

/// Backs the "Timeline & Files" tab on the Opportunity detail screen.
///
/// Copied from [opportunityTimeline].
class OpportunityTimelineProvider
    extends AutoDisposeFutureProvider<List<OpportunityTimelineItem>> {
  /// Backs the "Timeline & Files" tab on the Opportunity detail screen.
  ///
  /// Copied from [opportunityTimeline].
  OpportunityTimelineProvider(String opportunityId)
    : this._internal(
        (ref) =>
            opportunityTimeline(ref as OpportunityTimelineRef, opportunityId),
        from: opportunityTimelineProvider,
        name: r'opportunityTimelineProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$opportunityTimelineHash,
        dependencies: OpportunityTimelineFamily._dependencies,
        allTransitiveDependencies:
            OpportunityTimelineFamily._allTransitiveDependencies,
        opportunityId: opportunityId,
      );

  OpportunityTimelineProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.opportunityId,
  }) : super.internal();

  final String opportunityId;

  @override
  Override overrideWith(
    FutureOr<List<OpportunityTimelineItem>> Function(
      OpportunityTimelineRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpportunityTimelineProvider._internal(
        (ref) => create(ref as OpportunityTimelineRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        opportunityId: opportunityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<OpportunityTimelineItem>>
  createElement() {
    return _OpportunityTimelineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpportunityTimelineProvider &&
        other.opportunityId == opportunityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, opportunityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OpportunityTimelineRef
    on AutoDisposeFutureProviderRef<List<OpportunityTimelineItem>> {
  /// The parameter `opportunityId` of this provider.
  String get opportunityId;
}

class _OpportunityTimelineProviderElement
    extends AutoDisposeFutureProviderElement<List<OpportunityTimelineItem>>
    with OpportunityTimelineRef {
  _OpportunityTimelineProviderElement(super.provider);

  @override
  String get opportunityId =>
      (origin as OpportunityTimelineProvider).opportunityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
