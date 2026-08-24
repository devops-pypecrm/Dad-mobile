// GENERATED CODE - DO NOT MODIFY BY HAND

part of 're_enquiries_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reEnquiriesHash() => r'a8929700257df23e982c7e7bbcd9baab066568c6';

/// `GET /api/leads/re-enquiries` — no pagination/filters on this endpoint
/// (see `LeadsRepository.getReEnquiryLeads`'s doc comment), so this is
/// just a thin future wrapper, not a list controller like `leadsListProvider`.
///
/// Copied from [reEnquiries].
@ProviderFor(reEnquiries)
final reEnquiriesProvider = AutoDisposeFutureProvider<List<Lead>>.internal(
  reEnquiries,
  name: r'reEnquiriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reEnquiriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReEnquiriesRef = AutoDisposeFutureProviderRef<List<Lead>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
