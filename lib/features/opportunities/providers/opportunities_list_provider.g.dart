// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunities_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunitiesListHash() => r'b174ce28cc671207d2ef5f19064f58bc4ddc645e';

/// Infinite-scroll Opportunities list. The backend already scopes results
/// to what the logged-in user can see (ownership hierarchy) — no
/// client-side visibility filtering happens here.
///
/// Copied from [OpportunitiesList].
@ProviderFor(OpportunitiesList)
final opportunitiesListProvider =
    AutoDisposeAsyncNotifierProvider<
      OpportunitiesList,
      OpportunitiesListState
    >.internal(
      OpportunitiesList.new,
      name: r'opportunitiesListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$opportunitiesListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OpportunitiesList = AutoDisposeAsyncNotifier<OpportunitiesListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
