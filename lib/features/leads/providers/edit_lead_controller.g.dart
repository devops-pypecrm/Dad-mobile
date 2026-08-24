// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_lead_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editLeadControllerHash() =>
    r'e7088f45c59f0616c083c7395009dbf8c8ce78fa';

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

abstract class _$EditLeadController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// Backs the Edit Lead screen — same field set as Dad-frontend's
/// `EditLeadDialog` (firstName*/phone* required, everything else optional).
///
/// Copied from [EditLeadController].
@ProviderFor(EditLeadController)
const editLeadControllerProvider = EditLeadControllerFamily();

/// Backs the Edit Lead screen — same field set as Dad-frontend's
/// `EditLeadDialog` (firstName*/phone* required, everything else optional).
///
/// Copied from [EditLeadController].
class EditLeadControllerFamily extends Family<AsyncValue<void>> {
  /// Backs the Edit Lead screen — same field set as Dad-frontend's
  /// `EditLeadDialog` (firstName*/phone* required, everything else optional).
  ///
  /// Copied from [EditLeadController].
  const EditLeadControllerFamily();

  /// Backs the Edit Lead screen — same field set as Dad-frontend's
  /// `EditLeadDialog` (firstName*/phone* required, everything else optional).
  ///
  /// Copied from [EditLeadController].
  EditLeadControllerProvider call(String leadId) {
    return EditLeadControllerProvider(leadId);
  }

  @override
  EditLeadControllerProvider getProviderOverride(
    covariant EditLeadControllerProvider provider,
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
  String? get name => r'editLeadControllerProvider';
}

/// Backs the Edit Lead screen — same field set as Dad-frontend's
/// `EditLeadDialog` (firstName*/phone* required, everything else optional).
///
/// Copied from [EditLeadController].
class EditLeadControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EditLeadController, void> {
  /// Backs the Edit Lead screen — same field set as Dad-frontend's
  /// `EditLeadDialog` (firstName*/phone* required, everything else optional).
  ///
  /// Copied from [EditLeadController].
  EditLeadControllerProvider(String leadId)
    : this._internal(
        () => EditLeadController()..leadId = leadId,
        from: editLeadControllerProvider,
        name: r'editLeadControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$editLeadControllerHash,
        dependencies: EditLeadControllerFamily._dependencies,
        allTransitiveDependencies:
            EditLeadControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  EditLeadControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(covariant EditLeadController notifier) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(EditLeadController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditLeadControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<EditLeadController, void>
  createElement() {
    return _EditLeadControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditLeadControllerProvider && other.leadId == leadId;
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
mixin EditLeadControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _EditLeadControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EditLeadController, void>
    with EditLeadControllerRef {
  _EditLeadControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as EditLeadControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
