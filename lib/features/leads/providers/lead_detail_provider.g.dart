// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadDetailHash() => r'7a6fc6f4d5d1de5a130c128f62847825b0b21f4e';

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

/// See also [leadDetail].
@ProviderFor(leadDetail)
const leadDetailProvider = LeadDetailFamily();

/// See also [leadDetail].
class LeadDetailFamily extends Family<AsyncValue<Lead>> {
  /// See also [leadDetail].
  const LeadDetailFamily();

  /// See also [leadDetail].
  LeadDetailProvider call(String id) {
    return LeadDetailProvider(id);
  }

  @override
  LeadDetailProvider getProviderOverride(
    covariant LeadDetailProvider provider,
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
  String? get name => r'leadDetailProvider';
}

/// See also [leadDetail].
class LeadDetailProvider extends AutoDisposeFutureProvider<Lead> {
  /// See also [leadDetail].
  LeadDetailProvider(String id)
    : this._internal(
        (ref) => leadDetail(ref as LeadDetailRef, id),
        from: leadDetailProvider,
        name: r'leadDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadDetailHash,
        dependencies: LeadDetailFamily._dependencies,
        allTransitiveDependencies: LeadDetailFamily._allTransitiveDependencies,
        id: id,
      );

  LeadDetailProvider._internal(
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
    FutureOr<Lead> Function(LeadDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeadDetailProvider._internal(
        (ref) => create(ref as LeadDetailRef),
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
  AutoDisposeFutureProviderElement<Lead> createElement() {
    return _LeadDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadDetailProvider && other.id == id;
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
mixin LeadDetailRef on AutoDisposeFutureProviderRef<Lead> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LeadDetailProviderElement extends AutoDisposeFutureProviderElement<Lead>
    with LeadDetailRef {
  _LeadDetailProviderElement(super.provider);

  @override
  String get id => (origin as LeadDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
