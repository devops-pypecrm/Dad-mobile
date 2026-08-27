// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_notes_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunityNotesHash() => r'4efc72e25d0a4438e71b34012a095e24cca9c01b';

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

/// See also [opportunityNotes].
@ProviderFor(opportunityNotes)
const opportunityNotesProvider = OpportunityNotesFamily();

/// See also [opportunityNotes].
class OpportunityNotesFamily extends Family<AsyncValue<List<OpportunityNote>>> {
  /// See also [opportunityNotes].
  const OpportunityNotesFamily();

  /// See also [opportunityNotes].
  OpportunityNotesProvider call(String opportunityId) {
    return OpportunityNotesProvider(opportunityId);
  }

  @override
  OpportunityNotesProvider getProviderOverride(
    covariant OpportunityNotesProvider provider,
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
  String? get name => r'opportunityNotesProvider';
}

/// See also [opportunityNotes].
class OpportunityNotesProvider
    extends AutoDisposeFutureProvider<List<OpportunityNote>> {
  /// See also [opportunityNotes].
  OpportunityNotesProvider(String opportunityId)
    : this._internal(
        (ref) => opportunityNotes(ref as OpportunityNotesRef, opportunityId),
        from: opportunityNotesProvider,
        name: r'opportunityNotesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$opportunityNotesHash,
        dependencies: OpportunityNotesFamily._dependencies,
        allTransitiveDependencies:
            OpportunityNotesFamily._allTransitiveDependencies,
        opportunityId: opportunityId,
      );

  OpportunityNotesProvider._internal(
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
    FutureOr<List<OpportunityNote>> Function(OpportunityNotesRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpportunityNotesProvider._internal(
        (ref) => create(ref as OpportunityNotesRef),
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
  AutoDisposeFutureProviderElement<List<OpportunityNote>> createElement() {
    return _OpportunityNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpportunityNotesProvider &&
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
mixin OpportunityNotesRef
    on AutoDisposeFutureProviderRef<List<OpportunityNote>> {
  /// The parameter `opportunityId` of this provider.
  String get opportunityId;
}

class _OpportunityNotesProviderElement
    extends AutoDisposeFutureProviderElement<List<OpportunityNote>>
    with OpportunityNotesRef {
  _OpportunityNotesProviderElement(super.provider);

  @override
  String get opportunityId =>
      (origin as OpportunityNotesProvider).opportunityId;
}

String _$opportunityNotesControllerHash() =>
    r'578ac48926847aade5e4d7ac7b18e4c62f135f6b';

abstract class _$OpportunityNotesController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String opportunityId;

  FutureOr<void> build(String opportunityId);
}

/// See also [OpportunityNotesController].
@ProviderFor(OpportunityNotesController)
const opportunityNotesControllerProvider = OpportunityNotesControllerFamily();

/// See also [OpportunityNotesController].
class OpportunityNotesControllerFamily extends Family<AsyncValue<void>> {
  /// See also [OpportunityNotesController].
  const OpportunityNotesControllerFamily();

  /// See also [OpportunityNotesController].
  OpportunityNotesControllerProvider call(String opportunityId) {
    return OpportunityNotesControllerProvider(opportunityId);
  }

  @override
  OpportunityNotesControllerProvider getProviderOverride(
    covariant OpportunityNotesControllerProvider provider,
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
  String? get name => r'opportunityNotesControllerProvider';
}

/// See also [OpportunityNotesController].
class OpportunityNotesControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<OpportunityNotesController, void> {
  /// See also [OpportunityNotesController].
  OpportunityNotesControllerProvider(String opportunityId)
    : this._internal(
        () => OpportunityNotesController()..opportunityId = opportunityId,
        from: opportunityNotesControllerProvider,
        name: r'opportunityNotesControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$opportunityNotesControllerHash,
        dependencies: OpportunityNotesControllerFamily._dependencies,
        allTransitiveDependencies:
            OpportunityNotesControllerFamily._allTransitiveDependencies,
        opportunityId: opportunityId,
      );

  OpportunityNotesControllerProvider._internal(
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
    covariant OpportunityNotesController notifier,
  ) {
    return notifier.build(opportunityId);
  }

  @override
  Override overrideWith(OpportunityNotesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OpportunityNotesControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<OpportunityNotesController, void>
  createElement() {
    return _OpportunityNotesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpportunityNotesControllerProvider &&
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
mixin OpportunityNotesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `opportunityId` of this provider.
  String get opportunityId;
}

class _OpportunityNotesControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          OpportunityNotesController,
          void
        >
    with OpportunityNotesControllerRef {
  _OpportunityNotesControllerProviderElement(super.provider);

  @override
  String get opportunityId =>
      (origin as OpportunityNotesControllerProvider).opportunityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
