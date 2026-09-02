// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_activity_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadTimelineHash() => r'520a6971b6955dc94ebc3cfbb281cc0c372c5534';

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

/// Backs the Lead Detail "Timeline" tab.
///
/// Copied from [leadTimeline].
@ProviderFor(leadTimeline)
const leadTimelineProvider = LeadTimelineFamily();

/// Backs the Lead Detail "Timeline" tab.
///
/// Copied from [leadTimeline].
class LeadTimelineFamily extends Family<AsyncValue<List<LeadTimelineItem>>> {
  /// Backs the Lead Detail "Timeline" tab.
  ///
  /// Copied from [leadTimeline].
  const LeadTimelineFamily();

  /// Backs the Lead Detail "Timeline" tab.
  ///
  /// Copied from [leadTimeline].
  LeadTimelineProvider call(String leadId) {
    return LeadTimelineProvider(leadId);
  }

  @override
  LeadTimelineProvider getProviderOverride(
    covariant LeadTimelineProvider provider,
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
  String? get name => r'leadTimelineProvider';
}

/// Backs the Lead Detail "Timeline" tab.
///
/// Copied from [leadTimeline].
class LeadTimelineProvider
    extends AutoDisposeFutureProvider<List<LeadTimelineItem>> {
  /// Backs the Lead Detail "Timeline" tab.
  ///
  /// Copied from [leadTimeline].
  LeadTimelineProvider(String leadId)
    : this._internal(
        (ref) => leadTimeline(ref as LeadTimelineRef, leadId),
        from: leadTimelineProvider,
        name: r'leadTimelineProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadTimelineHash,
        dependencies: LeadTimelineFamily._dependencies,
        allTransitiveDependencies:
            LeadTimelineFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadTimelineProvider._internal(
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
    FutureOr<List<LeadTimelineItem>> Function(LeadTimelineRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeadTimelineProvider._internal(
        (ref) => create(ref as LeadTimelineRef),
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
  AutoDisposeFutureProviderElement<List<LeadTimelineItem>> createElement() {
    return _LeadTimelineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadTimelineProvider && other.leadId == leadId;
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
mixin LeadTimelineRef on AutoDisposeFutureProviderRef<List<LeadTimelineItem>> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadTimelineProviderElement
    extends AutoDisposeFutureProviderElement<List<LeadTimelineItem>>
    with LeadTimelineRef {
  _LeadTimelineProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadTimelineProvider).leadId;
}

String _$leadWhatsAppActivityHash() =>
    r'31693fa07ba7e08b45e121e574b83158027c2845';

/// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
/// split client-side by [isWhatsAppCall] in the widgets that consume it, so
/// switching between those two tabs doesn't refetch.
///
/// Copied from [leadWhatsAppActivity].
@ProviderFor(leadWhatsAppActivity)
const leadWhatsAppActivityProvider = LeadWhatsAppActivityFamily();

/// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
/// split client-side by [isWhatsAppCall] in the widgets that consume it, so
/// switching between those two tabs doesn't refetch.
///
/// Copied from [leadWhatsAppActivity].
class LeadWhatsAppActivityFamily
    extends Family<AsyncValue<List<LeadWhatsAppActivity>>> {
  /// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
  /// split client-side by [isWhatsAppCall] in the widgets that consume it, so
  /// switching between those two tabs doesn't refetch.
  ///
  /// Copied from [leadWhatsAppActivity].
  const LeadWhatsAppActivityFamily();

  /// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
  /// split client-side by [isWhatsAppCall] in the widgets that consume it, so
  /// switching between those two tabs doesn't refetch.
  ///
  /// Copied from [leadWhatsAppActivity].
  LeadWhatsAppActivityProvider call(String leadId) {
    return LeadWhatsAppActivityProvider(leadId);
  }

  @override
  LeadWhatsAppActivityProvider getProviderOverride(
    covariant LeadWhatsAppActivityProvider provider,
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
  String? get name => r'leadWhatsAppActivityProvider';
}

/// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
/// split client-side by [isWhatsAppCall] in the widgets that consume it, so
/// switching between those two tabs doesn't refetch.
///
/// Copied from [leadWhatsAppActivity].
class LeadWhatsAppActivityProvider
    extends AutoDisposeFutureProvider<List<LeadWhatsAppActivity>> {
  /// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
  /// split client-side by [isWhatsAppCall] in the widgets that consume it, so
  /// switching between those two tabs doesn't refetch.
  ///
  /// Copied from [leadWhatsAppActivity].
  LeadWhatsAppActivityProvider(String leadId)
    : this._internal(
        (ref) => leadWhatsAppActivity(ref as LeadWhatsAppActivityRef, leadId),
        from: leadWhatsAppActivityProvider,
        name: r'leadWhatsAppActivityProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadWhatsAppActivityHash,
        dependencies: LeadWhatsAppActivityFamily._dependencies,
        allTransitiveDependencies:
            LeadWhatsAppActivityFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadWhatsAppActivityProvider._internal(
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
    FutureOr<List<LeadWhatsAppActivity>> Function(
      LeadWhatsAppActivityRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeadWhatsAppActivityProvider._internal(
        (ref) => create(ref as LeadWhatsAppActivityRef),
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
  AutoDisposeFutureProviderElement<List<LeadWhatsAppActivity>> createElement() {
    return _LeadWhatsAppActivityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadWhatsAppActivityProvider && other.leadId == leadId;
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
mixin LeadWhatsAppActivityRef
    on AutoDisposeFutureProviderRef<List<LeadWhatsAppActivity>> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadWhatsAppActivityProviderElement
    extends AutoDisposeFutureProviderElement<List<LeadWhatsAppActivity>>
    with LeadWhatsAppActivityRef {
  _LeadWhatsAppActivityProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadWhatsAppActivityProvider).leadId;
}

String _$leadCallHistoryHash() => r'8afc34a2d1afd33f0f00acfff14d6b2e8313b717';

/// Backs the Lead Detail "Call History" tab.
///
/// Copied from [leadCallHistory].
@ProviderFor(leadCallHistory)
const leadCallHistoryProvider = LeadCallHistoryFamily();

/// Backs the Lead Detail "Call History" tab.
///
/// Copied from [leadCallHistory].
class LeadCallHistoryFamily
    extends Family<AsyncValue<List<LeadCallHistoryItem>>> {
  /// Backs the Lead Detail "Call History" tab.
  ///
  /// Copied from [leadCallHistory].
  const LeadCallHistoryFamily();

  /// Backs the Lead Detail "Call History" tab.
  ///
  /// Copied from [leadCallHistory].
  LeadCallHistoryProvider call(String leadId) {
    return LeadCallHistoryProvider(leadId);
  }

  @override
  LeadCallHistoryProvider getProviderOverride(
    covariant LeadCallHistoryProvider provider,
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
  String? get name => r'leadCallHistoryProvider';
}

/// Backs the Lead Detail "Call History" tab.
///
/// Copied from [leadCallHistory].
class LeadCallHistoryProvider
    extends AutoDisposeFutureProvider<List<LeadCallHistoryItem>> {
  /// Backs the Lead Detail "Call History" tab.
  ///
  /// Copied from [leadCallHistory].
  LeadCallHistoryProvider(String leadId)
    : this._internal(
        (ref) => leadCallHistory(ref as LeadCallHistoryRef, leadId),
        from: leadCallHistoryProvider,
        name: r'leadCallHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadCallHistoryHash,
        dependencies: LeadCallHistoryFamily._dependencies,
        allTransitiveDependencies:
            LeadCallHistoryFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadCallHistoryProvider._internal(
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
    FutureOr<List<LeadCallHistoryItem>> Function(LeadCallHistoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeadCallHistoryProvider._internal(
        (ref) => create(ref as LeadCallHistoryRef),
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
  AutoDisposeFutureProviderElement<List<LeadCallHistoryItem>> createElement() {
    return _LeadCallHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadCallHistoryProvider && other.leadId == leadId;
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
mixin LeadCallHistoryRef
    on AutoDisposeFutureProviderRef<List<LeadCallHistoryItem>> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadCallHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<LeadCallHistoryItem>>
    with LeadCallHistoryRef {
  _LeadCallHistoryProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadCallHistoryProvider).leadId;
}

String _$leadOwnershipHistoryHash() =>
    r'0a06f617ab03ad58c1683796c37a7fa411b34b53';

/// Backs the Lead Detail "Ownership History" tab.
///
/// Copied from [leadOwnershipHistory].
@ProviderFor(leadOwnershipHistory)
const leadOwnershipHistoryProvider = LeadOwnershipHistoryFamily();

/// Backs the Lead Detail "Ownership History" tab.
///
/// Copied from [leadOwnershipHistory].
class LeadOwnershipHistoryFamily
    extends Family<AsyncValue<List<LeadOwnershipHistoryItem>>> {
  /// Backs the Lead Detail "Ownership History" tab.
  ///
  /// Copied from [leadOwnershipHistory].
  const LeadOwnershipHistoryFamily();

  /// Backs the Lead Detail "Ownership History" tab.
  ///
  /// Copied from [leadOwnershipHistory].
  LeadOwnershipHistoryProvider call(String leadId) {
    return LeadOwnershipHistoryProvider(leadId);
  }

  @override
  LeadOwnershipHistoryProvider getProviderOverride(
    covariant LeadOwnershipHistoryProvider provider,
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
  String? get name => r'leadOwnershipHistoryProvider';
}

/// Backs the Lead Detail "Ownership History" tab.
///
/// Copied from [leadOwnershipHistory].
class LeadOwnershipHistoryProvider
    extends AutoDisposeFutureProvider<List<LeadOwnershipHistoryItem>> {
  /// Backs the Lead Detail "Ownership History" tab.
  ///
  /// Copied from [leadOwnershipHistory].
  LeadOwnershipHistoryProvider(String leadId)
    : this._internal(
        (ref) => leadOwnershipHistory(ref as LeadOwnershipHistoryRef, leadId),
        from: leadOwnershipHistoryProvider,
        name: r'leadOwnershipHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadOwnershipHistoryHash,
        dependencies: LeadOwnershipHistoryFamily._dependencies,
        allTransitiveDependencies:
            LeadOwnershipHistoryFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadOwnershipHistoryProvider._internal(
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
    FutureOr<List<LeadOwnershipHistoryItem>> Function(
      LeadOwnershipHistoryRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeadOwnershipHistoryProvider._internal(
        (ref) => create(ref as LeadOwnershipHistoryRef),
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
  AutoDisposeFutureProviderElement<List<LeadOwnershipHistoryItem>>
  createElement() {
    return _LeadOwnershipHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadOwnershipHistoryProvider && other.leadId == leadId;
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
mixin LeadOwnershipHistoryRef
    on AutoDisposeFutureProviderRef<List<LeadOwnershipHistoryItem>> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadOwnershipHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<LeadOwnershipHistoryItem>>
    with LeadOwnershipHistoryRef {
  _LeadOwnershipHistoryProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadOwnershipHistoryProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
