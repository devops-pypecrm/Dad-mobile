// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_lead_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assignLeadControllerHash() =>
    r'e56fb3cfabbd9ba52f3de08faef85ec4202411d5';

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

abstract class _$AssignLeadController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
/// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
/// not a dedicated assign endpoint).
///
/// Copied from [AssignLeadController].
@ProviderFor(AssignLeadController)
const assignLeadControllerProvider = AssignLeadControllerFamily();

/// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
/// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
/// not a dedicated assign endpoint).
///
/// Copied from [AssignLeadController].
class AssignLeadControllerFamily extends Family<AsyncValue<void>> {
  /// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
  /// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
  /// not a dedicated assign endpoint).
  ///
  /// Copied from [AssignLeadController].
  const AssignLeadControllerFamily();

  /// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
  /// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
  /// not a dedicated assign endpoint).
  ///
  /// Copied from [AssignLeadController].
  AssignLeadControllerProvider call(String leadId) {
    return AssignLeadControllerProvider(leadId);
  }

  @override
  AssignLeadControllerProvider getProviderOverride(
    covariant AssignLeadControllerProvider provider,
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
  String? get name => r'assignLeadControllerProvider';
}

/// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
/// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
/// not a dedicated assign endpoint).
///
/// Copied from [AssignLeadController].
class AssignLeadControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AssignLeadController, void> {
  /// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
  /// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
  /// not a dedicated assign endpoint).
  ///
  /// Copied from [AssignLeadController].
  AssignLeadControllerProvider(String leadId)
    : this._internal(
        () => AssignLeadController()..leadId = leadId,
        from: assignLeadControllerProvider,
        name: r'assignLeadControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$assignLeadControllerHash,
        dependencies: AssignLeadControllerFamily._dependencies,
        allTransitiveDependencies:
            AssignLeadControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  AssignLeadControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(covariant AssignLeadController notifier) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(AssignLeadController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AssignLeadControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AssignLeadController, void>
  createElement() {
    return _AssignLeadControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssignLeadControllerProvider && other.leadId == leadId;
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
mixin AssignLeadControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _AssignLeadControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AssignLeadController, void>
    with AssignLeadControllerRef {
  _AssignLeadControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as AssignLeadControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
