// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunities_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunitiesListHash() => r'2afccee69df281d29541b8143a3aea34df9b3881';

/// Infinite-scroll Opportunities list. Search/filters are forwarded straight
/// to `GET /api/opportunities` — the backend already scopes results to what
/// the logged-in user can see (ownership hierarchy), this notifier does no
/// client-side visibility filtering of its own. It only ever adds one thing
/// on top: forcing `ownerId` to the caller's own id when [scope] is
/// [OpportunitiesScope.mine].
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
