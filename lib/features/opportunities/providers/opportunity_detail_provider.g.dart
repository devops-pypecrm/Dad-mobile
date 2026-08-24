// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunityDetailHash() => r'9e0d3d5750a09f3de3a59de6a16566fa6a989907';

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

/// See also [opportunityDetail].
@ProviderFor(opportunityDetail)
const opportunityDetailProvider = OpportunityDetailFamily();

/// See also [opportunityDetail].
class OpportunityDetailFamily extends Family<AsyncValue<Opportunity>> {
  /// See also [opportunityDetail].
  const OpportunityDetailFamily();

  /// See also [opportunityDetail].
  OpportunityDetailProvider call(String id) {
    return OpportunityDetailProvider(id);
  }

  @override
  OpportunityDetailProvider getProviderOverride(
    covariant OpportunityDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'opportunityDetailProvider';
}

/// See also [opportunityDetail].
class OpportunityDetailProvider extends AutoDisposeFutureProvider<Opportunity> {
  /// See also [opportunityDetail].
  OpportunityDetailProvider(String id)
    : this._internal(
        (ref) => opportunityDetail(ref as OpportunityDetailRef, id),
        from: opportunityDetailProvider,
        name: r'opportunityDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$opportunityDetailHash,
        dependencies: OpportunityDetailFamily._dependencies,
        allTransitiveDependencies:
            OpportunityDetailFamily._allTransitiveDependencies,
        id: id,
      );

  OpportunityDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Opportunity> Function(OpportunityDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpportunityDetailProvider._internal(
        (ref) => create(ref as OpportunityDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Opportunity> createElement() {
    return _OpportunityDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpportunityDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OpportunityDetailRef on AutoDisposeFutureProviderRef<Opportunity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _OpportunityDetailProviderElement
    extends AutoDisposeFutureProviderElement<Opportunity>
    with OpportunityDetailRef {
  _OpportunityDetailProviderElement(super.provider);

  @override
  String get id => (origin as OpportunityDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
