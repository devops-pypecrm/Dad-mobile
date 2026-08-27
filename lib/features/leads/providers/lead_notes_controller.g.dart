// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_notes_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadInteractionsHash() => r'381677e8f0782229bce89817f6cd19b89647db3a';

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

/// See also [leadInteractions].
@ProviderFor(leadInteractions)
const leadInteractionsProvider = LeadInteractionsFamily();

/// See also [leadInteractions].
class LeadInteractionsFamily extends Family<AsyncValue<List<Interaction>>> {
  /// See also [leadInteractions].
  const LeadInteractionsFamily();

  /// See also [leadInteractions].
  LeadInteractionsProvider call(String leadId) {
    return LeadInteractionsProvider(leadId);
  }

  @override
  LeadInteractionsProvider getProviderOverride(
    covariant LeadInteractionsProvider provider,
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
  String? get name => r'leadInteractionsProvider';
}

/// See also [leadInteractions].
class LeadInteractionsProvider
    extends AutoDisposeFutureProvider<List<Interaction>> {
  /// See also [leadInteractions].
  LeadInteractionsProvider(String leadId)
    : this._internal(
        (ref) => leadInteractions(ref as LeadInteractionsRef, leadId),
        from: leadInteractionsProvider,
        name: r'leadInteractionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadInteractionsHash,
        dependencies: LeadInteractionsFamily._dependencies,
        allTransitiveDependencies:
            LeadInteractionsFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadInteractionsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Interaction>> Function(LeadInteractionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeadInteractionsProvider._internal(
        (ref) => create(ref as LeadInteractionsRef),
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
  AutoDisposeFutureProviderElement<List<Interaction>> createElement() {
    return _LeadInteractionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadInteractionsProvider && other.leadId == leadId;
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
mixin LeadInteractionsRef on AutoDisposeFutureProviderRef<List<Interaction>> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadInteractionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Interaction>>
    with LeadInteractionsRef {
  _LeadInteractionsProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadInteractionsProvider).leadId;
}

String _$leadNotesControllerHash() =>
    r'085119a5604081034f0b4f98f7f8b9f527ce5d1f';

abstract class _$LeadNotesController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// Adding a note only ever needs a loading/error flag — the note list
/// itself lives in [leadInteractionsProvider], invalidated on success.
///
/// Copied from [LeadNotesController].
@ProviderFor(LeadNotesController)
const leadNotesControllerProvider = LeadNotesControllerFamily();

/// Adding a note only ever needs a loading/error flag — the note list
/// itself lives in [leadInteractionsProvider], invalidated on success.
///
/// Copied from [LeadNotesController].
class LeadNotesControllerFamily extends Family<AsyncValue<void>> {
  /// Adding a note only ever needs a loading/error flag — the note list
  /// itself lives in [leadInteractionsProvider], invalidated on success.
  ///
  /// Copied from [LeadNotesController].
  const LeadNotesControllerFamily();

  /// Adding a note only ever needs a loading/error flag — the note list
  /// itself lives in [leadInteractionsProvider], invalidated on success.
  ///
  /// Copied from [LeadNotesController].
  LeadNotesControllerProvider call(String leadId) {
    return LeadNotesControllerProvider(leadId);
  }

  @override
  LeadNotesControllerProvider getProviderOverride(
    covariant LeadNotesControllerProvider provider,
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
  String? get name => r'leadNotesControllerProvider';
}

/// Adding a note only ever needs a loading/error flag — the note list
/// itself lives in [leadInteractionsProvider], invalidated on success.
///
/// Copied from [LeadNotesController].
class LeadNotesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LeadNotesController, void> {
  /// Adding a note only ever needs a loading/error flag — the note list
  /// itself lives in [leadInteractionsProvider], invalidated on success.
  ///
  /// Copied from [LeadNotesController].
  LeadNotesControllerProvider(String leadId)
    : this._internal(
        () => LeadNotesController()..leadId = leadId,
        from: leadNotesControllerProvider,
        name: r'leadNotesControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadNotesControllerHash,
        dependencies: LeadNotesControllerFamily._dependencies,
        allTransitiveDependencies:
            LeadNotesControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadNotesControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(covariant LeadNotesController notifier) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(LeadNotesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeadNotesControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LeadNotesController, void>
  createElement() {
    return _LeadNotesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadNotesControllerProvider && other.leadId == leadId;
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
mixin LeadNotesControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadNotesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LeadNotesController, void>
    with LeadNotesControllerRef {
  _LeadNotesControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadNotesControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
