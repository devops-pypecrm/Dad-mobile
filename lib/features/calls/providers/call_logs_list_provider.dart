import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/calls_repository.dart';
import '../domain/call_log.dart';

part 'call_logs_list_provider.g.dart';
part 'call_logs_list_provider.freezed.dart';

@freezed
class CallLogsListState with _$CallLogsListState {
  const factory CallLogsListState({
    @Default(<CallLog>[]) List<CallLog> calls,
    @Default(1) int page,
    @Default(1) int pages,
    @Default(false) bool isLoadingMore,
    String? search,
    String? direction,
    String? status,
    String? branchId,
    String? userId,
  }) = _CallLogsListState;

  const CallLogsListState._();

  bool get hasMore => page < pages;

  bool get hasActiveFilters =>
      (direction != null && direction != 'all') ||
      (status != null && status != 'all') ||
      branchId != null ||
      userId != null;
}

/// Infinite-scroll Call Logs list — same shape as `AccountsList`/`ProductsList`,
/// extended with the same filter set (direction/status/branch/agent) the
/// web `/calls` page offers (Phase 5 follow-up — this list started as
/// search-only).
@riverpod
class CallLogsList extends _$CallLogsList {
  @override
  Future<CallLogsListState> build() async {
    final repository = ref.watch(callsRepositoryProvider);
    final result = await repository.getCalls(page: 1);
    return CallLogsListState(calls: result.calls, page: result.pagination.page, pages: result.pagination.totalPages);
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));
    try {
      final repository = ref.read(callsRepositoryProvider);
      final result = await repository.getCalls(
        page: current.page + 1,
        search: current.search,
        direction: current.direction,
        status: current.status,
        branchId: current.branchId,
        userId: current.userId,
      );
      state = AsyncValue.data(
        current.copyWith(
          calls: [...current.calls, ...result.calls],
          page: result.pagination.page,
          pages: result.pagination.totalPages,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> search(String? query) async {
    final current = state.valueOrNull;
    await _reload(
      search: query,
      direction: current?.direction,
      status: current?.status,
      branchId: current?.branchId,
      userId: current?.userId,
    );
  }

  Future<void> applyFilters({String? direction, String? status, String? branchId, String? userId}) async {
    final current = state.valueOrNull;
    await _reload(
      search: current?.search,
      direction: direction,
      status: status,
      branchId: branchId,
      userId: userId,
    );
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    await _reload(
      search: current?.search,
      direction: current?.direction,
      status: current?.status,
      branchId: current?.branchId,
      userId: current?.userId,
    );
  }

  /// Removes a call locally once its recording is deleted server-side —
  /// avoids a full list refetch for a single-item change.
  void removeRecordingLocally(String callId) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncValue.data(
      current.copyWith(
        calls: [
          for (final call in current.calls)
            if (call.id == callId) call.copyWith(recordingUrl: null) else call,
        ],
      ),
    );
  }

  Future<void> _reload({
    String? search,
    String? direction,
    String? status,
    String? branchId,
    String? userId,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(callsRepositoryProvider);
      final result = await repository.getCalls(
        page: 1,
        search: search,
        direction: direction,
        status: status,
        branchId: branchId,
        userId: userId,
      );
      return CallLogsListState(
        calls: result.calls,
        page: result.pagination.page,
        pages: result.pagination.totalPages,
        search: search,
        direction: direction,
        status: status,
        branchId: branchId,
        userId: userId,
      );
    });
  }
}
