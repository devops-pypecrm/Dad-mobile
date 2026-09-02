import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/providers/session_provider.dart';
import '../data/opportunities_repository.dart';
import '../domain/opportunity.dart';

part 'opportunities_list_provider.g.dart';
part 'opportunities_list_provider.freezed.dart';

/// `'team'`: no forced `ownerId` — the backend's own hierarchy scoping
/// (`getVisibleUserIds`) decides what's visible (self + subordinates, or
/// the whole org for admins). `'mine'`: `ownerId` is force-set to the
/// caller's own id, overriding whatever the Owner filter has selected —
/// same override Dad-frontend/src/pages/opportunities/index.tsx does for
/// its "Mine" tab.
enum OpportunitiesScope { team, mine }

@freezed
class OpportunitiesListState with _$OpportunitiesListState {
  const factory OpportunitiesListState({
    @Default(<Opportunity>[]) List<Opportunity> opportunities,
    @Default(1) int page,
    @Default(1) int totalPages,
    @Default(false) bool isLoadingMore,
    @Default(OpportunitiesScope.team) OpportunitiesScope scope,
    String? search,
    String? stage,
    String? type,
    String? leadSource,
    String? ownerId,
    DateTime? startDate,
    DateTime? endDate,
  }) = _OpportunitiesListState;

  const OpportunitiesListState._();

  bool get hasMore => page < totalPages;

  bool get hasActiveFilters =>
      (stage?.isNotEmpty ?? false) ||
      (type?.isNotEmpty ?? false) ||
      (leadSource?.isNotEmpty ?? false) ||
      (ownerId?.isNotEmpty ?? false) ||
      startDate != null ||
      endDate != null;
}

/// Infinite-scroll Opportunities list. Search/filters are forwarded straight
/// to `GET /api/opportunities` — the backend already scopes results to what
/// the logged-in user can see (ownership hierarchy), this notifier does no
/// client-side visibility filtering of its own. It only ever adds one thing
/// on top: forcing `ownerId` to the caller's own id when [scope] is
/// [OpportunitiesScope.mine].
@riverpod
class OpportunitiesList extends _$OpportunitiesList {
  String? _resolveOwnerId(String? ownerId, OpportunitiesScope scope) {
    if (scope == OpportunitiesScope.mine) {
      return ref.read(sessionControllerProvider).valueOrNull?.id;
    }
    return ownerId;
  }

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
      final result = await repository.getOpportunities(
        page: current.page + 1,
        search: current.search,
        stage: current.stage,
        type: current.type,
        leadSource: current.leadSource,
        ownerId: _resolveOwnerId(current.ownerId, current.scope),
        startDate: current.startDate,
        endDate: current.endDate,
      );
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

  Future<void> applyFilters({
    String? search,
    String? stage,
    String? type,
    String? leadSource,
    String? ownerId,
    DateTime? startDate,
    DateTime? endDate,
    OpportunitiesScope? scope,
  }) async {
    final current = state.valueOrNull;
    final resolvedScope = scope ?? current?.scope ?? OpportunitiesScope.team;
    // `.copyWithPrevious` keeps `state.valueOrNull` returning the *old* list
    // while this fetch is in flight (and if it fails) instead of wiping to a
    // bare loading/error with nothing to show — same fix as
    // `LeadsList.applyFilters`.
    state = const AsyncValue<OpportunitiesListState>.loading().copyWithPrevious(state);
    final result = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      final result = await repository.getOpportunities(
        page: 1,
        search: search,
        stage: stage,
        type: type,
        leadSource: leadSource,
        ownerId: _resolveOwnerId(ownerId, resolvedScope),
        startDate: startDate,
        endDate: endDate,
      );
      return OpportunitiesListState(
        opportunities: result.opportunities,
        page: result.page,
        totalPages: result.totalPages,
        search: search,
        stage: stage,
        type: type,
        leadSource: leadSource,
        ownerId: ownerId,
        startDate: startDate,
        endDate: endDate,
        scope: resolvedScope,
      );
    });
    state = result.hasError ? result.copyWithPrevious(state) : result;
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      final result = await repository.getOpportunities(
        page: 1,
        search: current?.search,
        stage: current?.stage,
        type: current?.type,
        leadSource: current?.leadSource,
        ownerId: _resolveOwnerId(current?.ownerId, current?.scope ?? OpportunitiesScope.team),
        startDate: current?.startDate,
        endDate: current?.endDate,
      );
      return (current ?? const OpportunitiesListState()).copyWith(
        opportunities: result.opportunities,
        page: result.page,
        totalPages: result.totalPages,
      );
    });
  }
}
