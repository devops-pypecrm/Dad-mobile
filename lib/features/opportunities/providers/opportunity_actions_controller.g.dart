// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_actions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunityActionsControllerHash() =>
    r'e2a676354cfc56ed395ede105cc5e1d1feebd8af';

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

abstract class _$OpportunityActionsController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String opportunityId;

  FutureOr<void> build(String opportunityId);
}

/// Stage change, edit (amount/probability/close date), linked-lead status
/// sync, and amount-sync-to-products — all funnel through
/// `OpportunitiesRepository.updateOpportunity`. See that method's doc
/// comment for the `stage` vs `leadStatus` distinction and the terminal-
/// stage 400 the backend returns.
///
/// Copied from [OpportunityActionsController].
@ProviderFor(OpportunityActionsController)
const opportunityActionsControllerProvider =
    OpportunityActionsControllerFamily();

/// Stage change, edit (amount/probability/close date), linked-lead status
/// sync, and amount-sync-to-products — all funnel through
/// `OpportunitiesRepository.updateOpportunity`. See that method's doc
/// comment for the `stage` vs `leadStatus` distinction and the terminal-
/// stage 400 the backend returns.
///
/// Copied from [OpportunityActionsController].
class OpportunityActionsControllerFamily extends Family<AsyncValue<void>> {
  /// Stage change, edit (amount/probability/close date), linked-lead status
  /// sync, and amount-sync-to-products — all funnel through
  /// `OpportunitiesRepository.updateOpportunity`. See that method's doc
  /// comment for the `stage` vs `leadStatus` distinction and the terminal-
  /// stage 400 the backend returns.
  ///
  /// Copied from [OpportunityActionsController].
  const OpportunityActionsControllerFamily();

  /// Stage change, edit (amount/probability/close date), linked-lead status
  /// sync, and amount-sync-to-products — all funnel through
  /// `OpportunitiesRepository.updateOpportunity`. See that method's doc
  /// comment for the `stage` vs `leadStatus` distinction and the terminal-
  /// stage 400 the backend returns.
  ///
  /// Copied from [OpportunityActionsController].
  OpportunityActionsControllerProvider call(String opportunityId) {
    return OpportunityActionsControllerProvider(opportunityId);
  }

  @override
  OpportunityActionsControllerProvider getProviderOverride(
    covariant OpportunityActionsControllerProvider provider,
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
  String? get name => r'opportunityActionsControllerProvider';
}

/// Stage change, edit (amount/probability/close date), linked-lead status
/// sync, and amount-sync-to-products — all funnel through
/// `OpportunitiesRepository.updateOpportunity`. See that method's doc
/// comment for the `stage` vs `leadStatus` distinction and the terminal-
/// stage 400 the backend returns.
///
/// Copied from [OpportunityActionsController].
class OpportunityActionsControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          OpportunityActionsController,
          void
        > {
  /// Stage change, edit (amount/probability/close date), linked-lead status
  /// sync, and amount-sync-to-products — all funnel through
  /// `OpportunitiesRepository.updateOpportunity`. See that method's doc
  /// comment for the `stage` vs `leadStatus` distinction and the terminal-
  /// stage 400 the backend returns.
  ///
  /// Copied from [OpportunityActionsController].
  OpportunityActionsControllerProvider(String opportunityId)
    : this._internal(
        () => OpportunityActionsController()..opportunityId = opportunityId,
        from: opportunityActionsControllerProvider,
        name: r'opportunityActionsControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$opportunityActionsControllerHash,
        dependencies: OpportunityActionsControllerFamily._dependencies,
        allTransitiveDependencies:
            OpportunityActionsControllerFamily._allTransitiveDependencies,
        opportunityId: opportunityId,
      );

  OpportunityActionsControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant OpportunityActionsController notifier,
  ) {
    return notifier.build(opportunityId);
  }

  @override
  Override overrideWith(OpportunityActionsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OpportunityActionsControllerProvider._internal(
        () => create()..opportunityId = opportunityId,
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
  AutoDisposeAsyncNotifierProviderElement<OpportunityActionsController, void>
  createElement() {
    return _OpportunityActionsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpportunityActionsControllerProvider &&
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
mixin OpportunityActionsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `opportunityId` of this provider.
  String get opportunityId;
}

class _OpportunityActionsControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          OpportunityActionsController,
          void
        >
    with OpportunityActionsControllerRef {
  _OpportunityActionsControllerProviderElement(super.provider);

  @override
  String get opportunityId =>
      (origin as OpportunityActionsControllerProvider).opportunityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
