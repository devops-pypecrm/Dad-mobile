// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadProductsControllerHash() =>
    r'57d66e90a995eb725448cb2c65c73e9f158ee89c';

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

abstract class _$LeadProductsController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// Full-replace save of a lead's product list (see
/// `LeadsRepository.updateLead`'s `products` param) — there's no
/// incremental add/remove endpoint, so the editor sheet always sends the
/// complete resulting list.
///
/// Copied from [LeadProductsController].
@ProviderFor(LeadProductsController)
const leadProductsControllerProvider = LeadProductsControllerFamily();

/// Full-replace save of a lead's product list (see
/// `LeadsRepository.updateLead`'s `products` param) — there's no
/// incremental add/remove endpoint, so the editor sheet always sends the
/// complete resulting list.
///
/// Copied from [LeadProductsController].
class LeadProductsControllerFamily extends Family<AsyncValue<void>> {
  /// Full-replace save of a lead's product list (see
  /// `LeadsRepository.updateLead`'s `products` param) — there's no
  /// incremental add/remove endpoint, so the editor sheet always sends the
  /// complete resulting list.
  ///
  /// Copied from [LeadProductsController].
  const LeadProductsControllerFamily();

  /// Full-replace save of a lead's product list (see
  /// `LeadsRepository.updateLead`'s `products` param) — there's no
  /// incremental add/remove endpoint, so the editor sheet always sends the
  /// complete resulting list.
  ///
  /// Copied from [LeadProductsController].
  LeadProductsControllerProvider call(String leadId) {
    return LeadProductsControllerProvider(leadId);
  }

  @override
  LeadProductsControllerProvider getProviderOverride(
    covariant LeadProductsControllerProvider provider,
  ) {
    return call(provider.leadId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leadProductsControllerProvider';
}

/// Full-replace save of a lead's product list (see
/// `LeadsRepository.updateLead`'s `products` param) — there's no
/// incremental add/remove endpoint, so the editor sheet always sends the
/// complete resulting list.
///
/// Copied from [LeadProductsController].
class LeadProductsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LeadProductsController, void> {
  /// Full-replace save of a lead's product list (see
  /// `LeadsRepository.updateLead`'s `products` param) — there's no
  /// incremental add/remove endpoint, so the editor sheet always sends the
  /// complete resulting list.
  ///
  /// Copied from [LeadProductsController].
  LeadProductsControllerProvider(String leadId)
    : this._internal(
        () => LeadProductsController()..leadId = leadId,
        from: leadProductsControllerProvider,
        name: r'leadProductsControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadProductsControllerHash,
        dependencies: LeadProductsControllerFamily._dependencies,
        allTransitiveDependencies:
            LeadProductsControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadProductsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.leadId,
  }) : super.internal();

  final String leadId;

  @override
  FutureOr<void> runNotifierBuild(covariant LeadProductsController notifier) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(LeadProductsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeadProductsControllerProvider._internal(
        () => create()..leadId = leadId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        leadId: leadId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LeadProductsController, void>
  createElement() {
    return _LeadProductsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadProductsControllerProvider && other.leadId == leadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, leadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LeadProductsControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadProductsControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<LeadProductsController, void>
    with LeadProductsControllerRef {
  _LeadProductsControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadProductsControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
