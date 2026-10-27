// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_re_enquiry_split_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadReEnquirySplitControllerHash() =>
    r'6dd5528e71c7466137d45085694b152f3d9818ff';

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

abstract class _$LeadReEnquirySplitController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String leadId;

  FutureOr<void> build(String leadId);
}

/// "Create as separate lead" from the Re-Enquiry History tab — wraps
/// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
/// phone number as the original, possible future mix-ups) is shown by the
/// caller before this is ever invoked; this controller just tracks
/// loading/error state and refreshes the history list on success so the
/// split event shows as already split.
///
/// Copied from [LeadReEnquirySplitController].
@ProviderFor(LeadReEnquirySplitController)
const leadReEnquirySplitControllerProvider =
    LeadReEnquirySplitControllerFamily();

/// "Create as separate lead" from the Re-Enquiry History tab — wraps
/// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
/// phone number as the original, possible future mix-ups) is shown by the
/// caller before this is ever invoked; this controller just tracks
/// loading/error state and refreshes the history list on success so the
/// split event shows as already split.
///
/// Copied from [LeadReEnquirySplitController].
class LeadReEnquirySplitControllerFamily extends Family<AsyncValue<void>> {
  /// "Create as separate lead" from the Re-Enquiry History tab — wraps
  /// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
  /// phone number as the original, possible future mix-ups) is shown by the
  /// caller before this is ever invoked; this controller just tracks
  /// loading/error state and refreshes the history list on success so the
  /// split event shows as already split.
  ///
  /// Copied from [LeadReEnquirySplitController].
  const LeadReEnquirySplitControllerFamily();

  /// "Create as separate lead" from the Re-Enquiry History tab — wraps
  /// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
  /// phone number as the original, possible future mix-ups) is shown by the
  /// caller before this is ever invoked; this controller just tracks
  /// loading/error state and refreshes the history list on success so the
  /// split event shows as already split.
  ///
  /// Copied from [LeadReEnquirySplitController].
  LeadReEnquirySplitControllerProvider call(String leadId) {
    return LeadReEnquirySplitControllerProvider(leadId);
  }

  @override
  LeadReEnquirySplitControllerProvider getProviderOverride(
    covariant LeadReEnquirySplitControllerProvider provider,
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
  String? get name => r'leadReEnquirySplitControllerProvider';
}

/// "Create as separate lead" from the Re-Enquiry History tab — wraps
/// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
/// phone number as the original, possible future mix-ups) is shown by the
/// caller before this is ever invoked; this controller just tracks
/// loading/error state and refreshes the history list on success so the
/// split event shows as already split.
///
/// Copied from [LeadReEnquirySplitController].
class LeadReEnquirySplitControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          LeadReEnquirySplitController,
          void
        > {
  /// "Create as separate lead" from the Re-Enquiry History tab — wraps
  /// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
  /// phone number as the original, possible future mix-ups) is shown by the
  /// caller before this is ever invoked; this controller just tracks
  /// loading/error state and refreshes the history list on success so the
  /// split event shows as already split.
  ///
  /// Copied from [LeadReEnquirySplitController].
  LeadReEnquirySplitControllerProvider(String leadId)
    : this._internal(
        () => LeadReEnquirySplitController()..leadId = leadId,
        from: leadReEnquirySplitControllerProvider,
        name: r'leadReEnquirySplitControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leadReEnquirySplitControllerHash,
        dependencies: LeadReEnquirySplitControllerFamily._dependencies,
        allTransitiveDependencies:
            LeadReEnquirySplitControllerFamily._allTransitiveDependencies,
        leadId: leadId,
      );

  LeadReEnquirySplitControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant LeadReEnquirySplitController notifier,
  ) {
    return notifier.build(leadId);
  }

  @override
  Override overrideWith(LeadReEnquirySplitController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeadReEnquirySplitControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LeadReEnquirySplitController, void>
  createElement() {
    return _LeadReEnquirySplitControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeadReEnquirySplitControllerProvider &&
        other.leadId == leadId;
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
mixin LeadReEnquirySplitControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `leadId` of this provider.
  String get leadId;
}

class _LeadReEnquirySplitControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          LeadReEnquirySplitController,
          void
        >
    with LeadReEnquirySplitControllerRef {
  _LeadReEnquirySplitControllerProviderElement(super.provider);

  @override
  String get leadId => (origin as LeadReEnquirySplitControllerProvider).leadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
