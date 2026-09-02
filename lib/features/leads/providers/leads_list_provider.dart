import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead.dart';

part 'leads_list_provider.g.dart';
part 'leads_list_provider.freezed.dart';

@freezed
class LeadsListState with _$LeadsListState {
  const factory LeadsListState({
    @Default(<Lead>[]) List<Lead> leads,
    @Default(1) int page,
    @Default(1) int pages,
    @Default(0) int total,
    @Default(false) bool isLoadingMore,
    String? search,
    String? status,
    String? source,
    String? assignedTo,
    String? branchId,
    DateTime? startDate,
    DateTime? endDate,
    @Default('updatedAt') String sortBy,
    @Default('desc') String sortOrder,
  }) = _LeadsListState;

  const LeadsListState._();

  bool get hasMore => page < pages;

  bool get hasActiveFilters =>
      (status?.isNotEmpty ?? false) ||
      (source?.isNotEmpty ?? false) ||
      (assignedTo?.isNotEmpty ?? false) ||
      (branchId?.isNotEmpty ?? false) ||
      startDate != null ||
      endDate != null;
}

/// Infinite-scroll Leads list. Search/filters are forwarded straight to
/// `GET /api/leads` — the backend already scopes results to what the
/// logged-in user can see (see app-pre/business-logic/LEADS_ANALYSIS.MD),
/// this notifier does no client-side filtering of its own.
@riverpod
class LeadsList extends _$LeadsList {
  @override
  Future<LeadsListState> build() async {
    final repository = ref.watch(leadsRepositoryProvider);
    final result = await repository.getLeads(page: 1);
    return LeadsListState(
      leads: result.leads,
      page: result.page,
      pages: result.pages,
      total: result.total,
    );
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));
    try {
      final repository = ref.read(leadsRepositoryProvider);
      final result = await repository.getLeads(
        page: current.page + 1,
        search: current.search,
        status: current.status,
        source: current.source,
        assignedTo: current.assignedTo,
        branchId: current.branchId,
        startDate: current.startDate,
        endDate: current.endDate,
        sortBy: current.sortBy,
        sortOrder: current.sortOrder,
      );
      state = AsyncValue.data(
        current.copyWith(
          leads: [...current.leads, ...result.leads],
          page: result.page,
          pages: result.pages,
          total: result.total,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      // Leave the existing list intact; only clear the loading flag so the
      // user can retry by scrolling again.
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> applyFilters({
    String? search,
    String? status,
    String? source,
    String? assignedTo,
    String? branchId,
    DateTime? startDate,
    DateTime? endDate,
    String? sortBy,
    String? sortOrder,
  }) async {
    final current = state.valueOrNull;
    // `.copyWithPrevious` keeps `state.valueOrNull` returning the *old*
    // list while this fetch is in flight (and if it fails) instead of
    // wiping to a bare loading/error with nothing to show — otherwise a
    // live/dynamic search flashes the whole list to a full skeleton on
    // every keystroke instead of updating in place. See the identical fix
    // on `FollowUpsListController.applyFilters`.
    state = const AsyncValue<LeadsListState>.loading().copyWithPrevious(state);
    final result = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      final result = await repository.getLeads(
        page: 1,
        search: search,
        status: status,
        source: source,
        assignedTo: assignedTo,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
        sortBy: sortBy ?? current?.sortBy ?? 'updatedAt',
        sortOrder: sortOrder ?? current?.sortOrder ?? 'desc',
      );
      return LeadsListState(
        leads: result.leads,
        page: result.page,
        pages: result.pages,
        total: result.total,
        search: search,
        status: status,
        source: source,
        assignedTo: assignedTo,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
        sortBy: sortBy ?? current?.sortBy ?? 'updatedAt',
        sortOrder: sortOrder ?? current?.sortOrder ?? 'desc',
      );
    });
    state = result.hasError ? result.copyWithPrevious(state) : result;
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      final result = await repository.getLeads(
        page: 1,
        search: current?.search,
        status: current?.status,
        source: current?.source,
        assignedTo: current?.assignedTo,
        branchId: current?.branchId,
        startDate: current?.startDate,
        endDate: current?.endDate,
        sortBy: current?.sortBy ?? 'updatedAt',
        sortOrder: current?.sortOrder ?? 'desc',
      );
      return (current ?? const LeadsListState()).copyWith(
        leads: result.leads,
        page: result.page,
        pages: result.pages,
        total: result.total,
      );
    });
  }
}
