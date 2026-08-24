// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leadsListHash() => r'f0a176eb8a54e03b2b6d1bf048c91370e96f2940';

/// Infinite-scroll Leads list. Search/filters are forwarded straight to
/// `GET /api/leads` — the backend already scopes results to what the
/// logged-in user can see (see app-pre/business-logic/LEADS_ANALYSIS.MD),
/// this notifier does no client-side filtering of its own.
///
/// Copied from [LeadsList].
@ProviderFor(LeadsList)
final leadsListProvider =
    AutoDisposeAsyncNotifierProvider<LeadsList, LeadsListState>.internal(
      LeadsList.new,
      name: r'leadsListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$leadsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LeadsList = AutoDisposeAsyncNotifier<LeadsListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
