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
  }) = _CallLogsListState;

  const CallLogsListState._();

  bool get hasMore => page < pages;
}

/// Infinite-scroll Call Logs list — same shape as `AccountsList`/`ProductsList`.
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
      final result = await repository.getCalls(page: current.page + 1, search: current.search);
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
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(callsRepositoryProvider);
      final result = await repository.getCalls(page: 1, search: query);
      return CallLogsListState(
        calls: result.calls,
        page: result.pagination.page,
        pages: result.pagination.totalPages,
        search: query,
      );
    });
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(callsRepositoryProvider);
      final result = await repository.getCalls(page: 1, search: current?.search);
      return CallLogsListState(
        calls: result.calls,
        page: result.pagination.page,
        pages: result.pagination.totalPages,
        search: current?.search,
      );
    });
  }
}
