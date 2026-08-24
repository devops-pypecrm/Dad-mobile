import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/search_repository.dart';
import '../domain/search_result.dart';

part 'search_controller.g.dart';
part 'search_controller.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(<String>[]) List<String> recent,
    @Default(<String>[]) List<String> suggestions,
    List<SearchResult>? results,
    @Default(false) bool isSearching,
    /// A failed `submit()` — kept in state (not rethrown) since callers
    /// like `onSubmitted: (q) => ...submit(q)` don't await/catch it; a
    /// rethrow there was an unhandled Future rejection with no user-facing
    /// effect at all.
    Object? searchError,
  }) = _SearchState;
}

/// Search Bar -> Debouncer (300ms) -> API Call, per .claude/skills/search.md.
/// Typing fetches lightweight string suggestions; submitting (or tapping a
/// suggestion/recent query) fetches full `SearchResult`s. Never filters a
/// locally-held dataset — every keystroke that reaches the network goes
/// straight to the backend.
@riverpod
class SearchController extends _$SearchController {
  Timer? _debounce;

  @override
  Future<SearchState> build() async {
    ref.onDispose(() => _debounce?.cancel());
    final recent = await ref.watch(searchRepositoryProvider).recentSearches();
    return SearchState(recent: recent);
  }

  void onQueryChanged(String query) {
    _debounce?.cancel();
    final current = state.valueOrNull ?? const SearchState();
    state = AsyncValue.data(current.copyWith(query: query, results: null));

    if (query.trim().length < 2) {
      state = AsyncValue.data(current.copyWith(query: query, suggestions: [], results: null));
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 300), () async {
      try {
        final suggestions = await ref.read(searchRepositoryProvider).suggestions(query.trim());
        final latest = state.valueOrNull;
        if (latest != null && latest.query == query) {
          state = AsyncValue.data(latest.copyWith(suggestions: suggestions));
        }
      } catch (_) {
        // Suggestions are a convenience — silently drop failures rather
        // than surfacing an error for a background type-ahead call.
      }
    });
  }

  Future<void> submit(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;
    _debounce?.cancel();

    final current = state.valueOrNull ?? const SearchState();
    state = AsyncValue.data(
      current.copyWith(query: trimmed, isSearching: true, suggestions: [], searchError: null),
    );

    try {
      final results = await ref.read(searchRepositoryProvider).globalSearch(trimmed);
      final latest = state.valueOrNull ?? current;
      state = AsyncValue.data(latest.copyWith(results: results, isSearching: false, searchError: null));
    } catch (e) {
      final latest = state.valueOrNull ?? current;
      state = AsyncValue.data(latest.copyWith(isSearching: false, results: null, searchError: e));
    }
  }

  void retryLastSearch() {
    final query = state.valueOrNull?.query;
    if (query != null && query.isNotEmpty) submit(query);
  }
}
