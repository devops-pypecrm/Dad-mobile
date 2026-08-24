// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_status_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadStatusControllerHash() =>
    r'2d08a882d24dbd8ff816b55436a35c4c95c9cf42';

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

abstract class _$LeadStatusController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// Handles status changes / `nextFollowUp` scheduling for a single Lead.
/// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
/// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
/// mobile app never creates that FollowUp itself.
///
/// Copied from [LeadStatusController].
@ProviderFor(LeadStatusController)
const leadStatusControllerProvider = LeadStatusControllerFamily();

/// Handles status changes / `nextFollowUp` scheduling for a single Lead.
/// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
/// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
/// mobile app never creates that FollowUp itself.
///
/// Copied from [LeadStatusController].
class LeadStatusControllerFamily extends Family<AsyncValue<void>> {
  /// Handles status changes / `nextFollowUp` scheduling for a single Lead.
  /// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
  /// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
  /// mobile app never creates that FollowUp itself.
  ///
  /// Copied from [LeadStatusController].
  const LeadStatusControllerFamily();

  /// Handles status changes / `nextFollowUp` scheduling for a single Lead.
  /// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
  /// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
  /// mobile app never creates that FollowUp itself.
  ///
  /// Copied from [LeadStatusController].
  LeadStatusControllerProvider call(String leadId) {
    return LeadStatusControllerProvider(leadId);
  }

  @override
  LeadStatusControllerProvider getProviderOverride(
    covariant LeadStatusControllerProvider provider,
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
  String? get name => r'leadStatusControllerProvider';
}

/// Handles status changes / `nextFollowUp` scheduling for a single Lead.
/// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
/// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
/// mobile app never creates that FollowUp itself.
///
/// Copied from [LeadStatusController].
class LeadStatusControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LeadStatusController, void> {
  /// Handles status changes / `nextFollowUp` scheduling for a single Lead.
  /// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
  /// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
  /// mobile app never creates that FollowUp itself.
  ///
  /// Copied from [LeadStatusController].
  LeadStatusControllerProvider(String leadId)
    : this._internal(
        () => LeadStatusController()..leadId = leadId,
        from: leadStatusControllerProvider,
        name: r'leadStatusControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadStatusControllerHash,
        dependencies: LeadStatusControllerFamily._dependencies,
        allTransitiveDependencies:
            LeadStatusControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadStatusControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(covariant LeadStatusController notifier) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(LeadStatusController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeadStatusControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LeadStatusController, void>
  createElement() {
    return _LeadStatusControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadStatusControllerProvider && other.leadId == leadId;
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
mixin LeadStatusControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadStatusControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LeadStatusController, void>
    with LeadStatusControllerRef {
  _LeadStatusControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadStatusControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
