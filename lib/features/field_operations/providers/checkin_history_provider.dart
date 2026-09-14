import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../checkins/data/checkins_repository.dart';
import '../../checkins/domain/checkin.dart';

part 'checkin_history_provider.g.dart';
part 'checkin_history_provider.freezed.dart';

@freezed
class CheckInHistoryState with _$CheckInHistoryState {
  const factory CheckInHistoryState({
    @Default(<CheckIn>[]) List<CheckIn> items,
    @Default(1) int page,
    @Default('desc') String sortOrder,
    @Default(false) bool isLoadingPage,
  }) = _CheckInHistoryState;

  const CheckInHistoryState._();

  static const pageSize = 10;

  // The backend returns a raw array with no total count, same as
  // Dad-frontend's `checkInService.ts` — "is there a next page" is
  // inferred the same way the web Field Force page does: a full page came
  // back, so there's probably more.
  bool get hasNextPage => items.length == pageSize;

  bool get hasPrevPage => page > 1;
}

/// Paginated/sortable check-in history — the "Check-in History" table on
/// the Field Operations dashboard, matching Dad-frontend's
/// `recentCheckIns` query on `pages/field-force/index.tsx` (page size 10,
/// sorted by `createdAt`, independent of the "today" date filter the feed
/// screen/`checkInsFeedProvider` uses).
@riverpod
class CheckInHistory extends _$CheckInHistory {
  void hardReset() => state = const AsyncValue.loading();

  @override
  Future<CheckInHistoryState> build() async {
    final repository = ref.watch(checkInsRepositoryProvider);
    final items = await repository.getCheckIns(
      limit: CheckInHistoryState.pageSize,
      offset: 0,
      sortBy: 'createdAt',
      sortOrder: 'desc',
    );
    return CheckInHistoryState(items: items);
  }

  Future<void> nextPage() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasNextPage) return;
    await _load(page: current.page + 1, sortOrder: current.sortOrder);
  }

  Future<void> prevPage() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasPrevPage) return;
    await _load(page: current.page - 1, sortOrder: current.sortOrder);
  }

  Future<void> toggleSort() async {
    final current = state.valueOrNull;
    final next = (current?.sortOrder ?? 'desc') == 'asc' ? 'desc' : 'asc';
    await _load(page: 1, sortOrder: next);
  }

  Future<void> _load({required int page, required String sortOrder}) async {
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncValue.data(current.copyWith(isLoadingPage: true));
    }
    state = await AsyncValue.guard(() async {
      final repository = ref.read(checkInsRepositoryProvider);
      final items = await repository.getCheckIns(
        limit: CheckInHistoryState.pageSize,
        offset: (page - 1) * CheckInHistoryState.pageSize,
        sortBy: 'createdAt',
        sortOrder: sortOrder,
      );
      return CheckInHistoryState(items: items, page: page, sortOrder: sortOrder);
    });
  }
}
