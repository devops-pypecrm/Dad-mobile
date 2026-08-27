// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_convert_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadConvertControllerHash() =>
    r'a968fe15d52eb3ec42b40f388d6c3807077dafeb';

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

abstract class _$LeadConvertController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
/// account/contact/opportunity creation is a server-side transaction (see
/// that method's doc comment); this controller just tracks loading/error
/// state around the call and returns the new opportunity id on success so
/// the UI can navigate there.
///
/// Copied from [LeadConvertController].
@ProviderFor(LeadConvertController)
const leadConvertControllerProvider = LeadConvertControllerFamily();

/// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
/// account/contact/opportunity creation is a server-side transaction (see
/// that method's doc comment); this controller just tracks loading/error
/// state around the call and returns the new opportunity id on success so
/// the UI can navigate there.
///
/// Copied from [LeadConvertController].
class LeadConvertControllerFamily extends Family<AsyncValue<void>> {
  /// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
  /// account/contact/opportunity creation is a server-side transaction (see
  /// that method's doc comment); this controller just tracks loading/error
  /// state around the call and returns the new opportunity id on success so
  /// the UI can navigate there.
  ///
  /// Copied from [LeadConvertController].
  const LeadConvertControllerFamily();

  /// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
  /// account/contact/opportunity creation is a server-side transaction (see
  /// that method's doc comment); this controller just tracks loading/error
  /// state around the call and returns the new opportunity id on success so
  /// the UI can navigate there.
  ///
  /// Copied from [LeadConvertController].
  LeadConvertControllerProvider call(String leadId) {
    return LeadConvertControllerProvider(leadId);
  }

  @override
  LeadConvertControllerProvider getProviderOverride(
    covariant LeadConvertControllerProvider provider,
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
  String? get name => r'leadConvertControllerProvider';
}

/// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
/// account/contact/opportunity creation is a server-side transaction (see
/// that method's doc comment); this controller just tracks loading/error
/// state around the call and returns the new opportunity id on success so
/// the UI can navigate there.
///
/// Copied from [LeadConvertController].
class LeadConvertControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LeadConvertController, void> {
  /// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
  /// account/contact/opportunity creation is a server-side transaction (see
  /// that method's doc comment); this controller just tracks loading/error
  /// state around the call and returns the new opportunity id on success so
  /// the UI can navigate there.
  ///
  /// Copied from [LeadConvertController].
  LeadConvertControllerProvider(String leadId)
    : this._internal(
        () => LeadConvertController()..leadId = leadId,
        from: leadConvertControllerProvider,
        name: r'leadConvertControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadConvertControllerHash,
        dependencies: LeadConvertControllerFamily._dependencies,
        allTransitiveDependencies:
            LeadConvertControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadConvertControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(covariant LeadConvertController notifier) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(LeadConvertController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeadConvertControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LeadConvertController, void>
  createElement() {
    return _LeadConvertControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadConvertControllerProvider && other.leadId == leadId;
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
mixin LeadConvertControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadConvertControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LeadConvertController, void>
    with LeadConvertControllerRef {
  _LeadConvertControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadConvertControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
