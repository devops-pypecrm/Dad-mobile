import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead.dart';
import '../domain/leads_page.dart';

part 'lead_health_list_provider.g.dart';
part 'lead_health_list_provider.freezed.dart';

/// Which Dashboard "Lead Health" tile this list is for — see
/// `LeadsRepository.getUnattendedLeads`/`.getNoActivityLeads` for the exact
/// business-rule definitions (enforced entirely server-side).
enum LeadHealthKind { unattended, noActivity }

@freezed
class LeadHealthListState with _$LeadHealthListState {
  const factory LeadHealthListState({
    @Default(<Lead>[]) List<Lead> leads,
    @Default(1) int page,
    @Default(1) int pages,
    @Default(0) int total,
    @Default(false) bool isLoadingMore,
  }) = _LeadHealthListState;

  const LeadHealthListState._();

  bool get hasMore => page < pages;
}

/// Infinite-scroll list backing `LeadHealthListScreen` — a family keyed by
/// [kind] plus every active filter (branch/date carried over from the
/// Dashboard's own filter when opened from its tile, plus user/source now
/// pickable in-screen). Changing any filter value re-keys the family to a
/// fresh (auto-disposed-when-unwatched) instance rather than mutating one
/// shared notifier — same pattern as `CallReportScreen`'s `_period`/
/// `_customRange` driving `dailyCallReportProvider` — so there's no
/// "fetch unfiltered, then reapply" step for a later fetch to race.
@riverpod
class LeadHealthList extends _$LeadHealthList {
  late LeadHealthKind _kind;
  String? _branchId;
  String? _assignedTo;
  String? _source;
  DateTime? _startDate;
  DateTime? _endDate;

  Future<LeadsPage> _fetch(int page) {
    final repository = ref.read(leadsRepositoryProvider);
    return _kind == LeadHealthKind.unattended
        ? repository.getUnattendedLeads(
            page: page,
            branchId: _branchId,
            assignedTo: _assignedTo,
            source: _source,
            startDate: _startDate,
            endDate: _endDate,
          )
        : repository.getNoActivityLeads(
            page: page,
            branchId: _branchId,
            assignedTo: _assignedTo,
            source: _source,
            startDate: _startDate,
            endDate: _endDate,
          );
  }

  @override
  Future<LeadHealthListState> build(
    LeadHealthKind kind, {
    String? branchId,
    String? assignedTo,
    String? source,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    _kind = kind;
    _branchId = branchId;
    _assignedTo = assignedTo;
    _source = source;
    _startDate = startDate;
    _endDate = endDate;
    final result = await _fetch(1);
    return LeadHealthListState(
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
      final result = await _fetch(current.page + 1);
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
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() async {
      final result = await _fetch(1);
      return LeadHealthListState(
        leads: result.leads,
        page: result.page,
        pages: result.pages,
        total: result.total,
      );
    });
  }
}
