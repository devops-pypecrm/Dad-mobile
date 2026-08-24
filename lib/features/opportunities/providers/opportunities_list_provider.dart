import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/opportunities_repository.dart';
import '../domain/opportunity.dart';

part 'opportunities_list_provider.g.dart';
part 'opportunities_list_provider.freezed.dart';

@freezed
class OpportunitiesListState with _$OpportunitiesListState {
  const factory OpportunitiesListState({
    @Default(<Opportunity>[]) List<Opportunity> opportunities,
    @Default(1) int page,
    @Default(1) int totalPages,
    @Default(false) bool isLoadingMore,
    String? stage,
  }) = _OpportunitiesListState;

  const OpportunitiesListState._();

  bool get hasMore => page < totalPages;
}

/// Infinite-scroll Opportunities list. The backend already scopes results
/// to what the logged-in user can see (ownership hierarchy) — no
/// client-side visibility filtering happens here.
@riverpod
class OpportunitiesList extends _$OpportunitiesList {
  @override
  Future<OpportunitiesListState> build() async {
    final repository = ref.watch(opportunitiesRepositoryProvider);
    final result = await repository.getOpportunities(page: 1);
    return OpportunitiesListState(
      opportunities: result.opportunities,
      page: result.page,
      totalPages: result.totalPages,
    );
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));
    try {
      final repository = ref.read(opportunitiesRepositoryProvider);
      final result = await repository.getOpportunities(page: current.page + 1, stage: current.stage);
      state = AsyncValue.data(
        current.copyWith(
          opportunities: [...current.opportunities, ...result.opportunities],
          page: result.page,
          totalPages: result.totalPages,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> filterByStage(String? stage) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      final result = await repository.getOpportunities(page: 1, stage: stage);
      return OpportunitiesListState(
        opportunities: result.opportunities,
        page: result.page,
        totalPages: result.totalPages,
        stage: stage,
      );
    });
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      final result = await repository.getOpportunities(page: 1, stage: current?.stage);
      return OpportunitiesListState(
        opportunities: result.opportunities,
        page: result.page,
        totalPages: result.totalPages,
        stage: current?.stage,
      );
    });
  }
}
