// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'9b90d080b0f8ced4b1ebf21b0ebd87bd024f9884';

/// Search Bar -> Debouncer -> API Call, per .claude/skills/search.md. A
/// 1-character query fetches lightweight string suggestions (200ms
/// debounce, too broad for a full search); 2+ characters fetches real
/// matching `SearchResult`s live as the user types (300ms debounce) —
/// `submit()` (Enter, or tapping a suggestion/recent query) just fetches
/// immediately without waiting out the debounce. Never filters a
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
