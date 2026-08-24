// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'bd52252dd49bc95b3158c328ac2707d8b50260fd';

/// Search Bar -> Debouncer (300ms) -> API Call, per .claude/skills/search.md.
/// Typing fetches lightweight string suggestions; submitting (or tapping a
/// suggestion/recent query) fetches full `SearchResult`s. Never filters a
/// locally-held dataset — every keystroke that reaches the network goes
/// straight to the backend.
///
/// Copied from [SearchController].
@ProviderFor(SearchController)
final searchControllerProvider =
    AutoDisposeAsyncNotifierProvider<SearchController, SearchState>.internal(
      SearchController.new,
      name: r'searchControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchController = AutoDisposeAsyncNotifier<SearchState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
