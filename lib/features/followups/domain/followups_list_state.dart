import 'package:freezed_annotation/freezed_annotation.dart';

import 'followup.dart';
import 'followups_page.dart';

part 'followups_list_state.freezed.dart';

/// One of the 4 status-bar cards — mirrors the `filter` URL param on
/// Dad-frontend's `/follow-ups` page (`overdue`/`today`/`upcoming`; "Active"
/// has no equivalent card-click filter on web, it's just "no filter, status
/// != completed").
enum FollowUpQuickFilter { overdue, today, upcoming }

@freezed
class FollowUpsListState with _$FollowUpsListState {
  const factory FollowUpsListState({
    @Default(<FollowUp>[]) List<FollowUp> allTasks,
    @Default(FollowUpCounts()) FollowUpCounts counts,
    String? search,
    String? status,
    String? branchId,
    String? userId,
    FollowUpQuickFilter? quickFilter,
    // Custom due-date filter — mutually exclusive with [quickFilter] (picking
    // one clears the other, same as web's single `filter`/date concept).
    DateTime? dueDateSingle,
    DateTime? dueDateFrom,
    DateTime? dueDateTo,
    @Default('dueDate') String sortBy,
    @Default('asc') String sortOrder,
  }) = _FollowUpsListState;

  const FollowUpsListState._();

  bool get hasDueDateFilter => dueDateSingle != null || dueDateFrom != null || dueDateTo != null;

  /// `status == 'all'` counts as active too — it's a deliberate departure
  /// from the default active-only view, not the same as "no filter".
  bool get hasActiveFilters =>
      quickFilter != null ||
      hasDueDateFilter ||
      status != null ||
      (branchId?.isNotEmpty ?? false) ||
      (userId?.isNotEmpty ?? false) ||
      sortBy != 'dueDate' ||
      sortOrder != 'asc';

  /// Same filtering + sorting logic as `filteredFollowUps` in
  /// Dad-frontend/src/pages/follow-ups/index.tsx:252-300, applied
  /// client-side because the backend doesn't support either operation as a
  /// query param (see `FollowUpsRepository`'s doc comment).
  List<FollowUp> get displayedTasks {
    Iterable<FollowUp> result = allTasks;

    if (quickFilter != null) {
      final now = DateTime.now();
      final startOfToday = DateTime(now.year, now.month, now.day);
      final startOfTomorrow = startOfToday.add(const Duration(days: 1));
      result = result.where((t) {
        if (t.isCompleted) return false;
        switch (quickFilter!) {
          case FollowUpQuickFilter.overdue:
            return t.dueDate.isBefore(startOfToday);
          case FollowUpQuickFilter.today:
            return !t.dueDate.isBefore(startOfToday) && t.dueDate.isBefore(startOfTomorrow);
          case FollowUpQuickFilter.upcoming:
            return !t.dueDate.isBefore(startOfTomorrow);
        }
      });
    } else if (hasDueDateFilter) {
      result = result.where((t) {
        final due = DateTime(t.dueDate.year, t.dueDate.month, t.dueDate.day);
        if (dueDateSingle != null) {
          final single = DateTime(dueDateSingle!.year, dueDateSingle!.month, dueDateSingle!.day);
          return due == single;
        }
        if (dueDateFrom != null && due.isBefore(DateTime(dueDateFrom!.year, dueDateFrom!.month, dueDateFrom!.day))) {
          return false;
        }
        if (dueDateTo != null && due.isAfter(DateTime(dueDateTo!.year, dueDateTo!.month, dueDateTo!.day))) {
          return false;
        }
        return true;
      });
    } else if (status == null) {
      // No explicit status choice — default to the same "active only" view
      // the backend itself defaults to when `status` is omitted. Once the
      // user explicitly picks `status: 'all'` (see `showAll()`), every
      // status the server returned — including completed/deferred — is
      // shown as-is; this branch must NOT re-filter that back out.
      result = result.where((t) => !t.isCompleted);
    }

    final sorted = result.toList()
      ..sort((a, b) {
        int cmp;
        switch (sortBy) {
          case 'priority':
            const order = {'high': 0, 'medium': 1, 'low': 2};
            cmp = (order[a.priority] ?? 1).compareTo(order[b.priority] ?? 1);
          case 'assignedTo':
            cmp = (a.assignedTo?.fullName ?? '').compareTo(b.assignedTo?.fullName ?? '');
          case 'status':
            cmp = a.status.compareTo(b.status);
          case 'subject':
            cmp = a.subject.toLowerCase().compareTo(b.subject.toLowerCase());
          default:
            cmp = a.dueDate.compareTo(b.dueDate);
        }
        return sortOrder == 'desc' ? -cmp : cmp;
      });
    return sorted;
  }
}
