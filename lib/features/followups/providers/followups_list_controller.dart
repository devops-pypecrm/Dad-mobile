import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/followups_repository.dart';
import '../domain/followup.dart';
import '../domain/followups_list_state.dart';

part 'followups_list_controller.g.dart';

/// Backs the Follow Ups tab.
///
/// The backend sorts every `/api/follow-ups` response `dueDate asc` and
/// gives no way to filter or jump directly to a date — the only levers are
/// `page`/`limit` (raw offset pagination) and the always-accurate
/// `counts: { active, overdue, today, upcoming }` on every response
/// (computed independently of pagination — any page, any status filter,
/// same scope, returns the same counts). Combined, that's enough to fetch
/// the *correct* slice for a given "when" bucket without downloading
/// everything:
///
/// - Overdue is items `[0, counts.overdue)` — always first, since it's the
///   earliest due dates.
/// - Today is `[counts.overdue, counts.overdue + counts.today)`.
/// - Upcoming is `[counts.overdue + counts.today, ...)`.
///
/// A flat `fetch the first N, filter client-side` approach (what this used
/// to do) breaks the instant `counts.overdue` alone exceeds N — every
/// fetched row is overdue, so Today/Upcoming silently render as empty even
/// though their server-reported counts are correct and non-zero. This is
/// exactly the bug reported against a real org with a large overdue
/// backlog. [_fetchWindow] fixes it by computing which page(s) actually
/// contain the requested bucket and fetching only those.
@Riverpod(keepAlive: true)
class FollowUpsListController extends _$FollowUpsListController {
  static const _pageSize = 100;
  // Cap on how many rows one bucket ever displays. A bucket larger than
  // this shows its first [_bucketCap] (earliest-due) rows rather than
  // downloading e.g. a multi-thousand-row overdue backlog in one go — a
  // real "load more"/infinite-scroll would be the next step if that cap
  // turns out to matter in practice.
  static const _bucketCap = 200;

  @override
  Future<FollowUpsListState> build() async {
    final page = await ref.watch(followUpsRepositoryProvider).getFollowUps(limit: _pageSize);
    return FollowUpsListState(allTasks: page.tasks, counts: page.counts);
  }

  /// Fetches absolute rows `[skip, skip + take)` from the always-`dueDate
  /// asc`-sorted `/follow-ups` list, using as few page requests as
  /// possible (jumps straight to the right page via `page`/`limit` rather
  /// than walking from page 1). `status` is deliberately not a parameter
  /// here — the server's bucket `counts` this is built to align with are
  /// always computed against the active-only status set regardless of any
  /// `status` filter, so a window computed from those counts is only
  /// correct against that same active-only fetch.
  Future<List<FollowUp>> _fetchWindow({
    required int skip,
    required int take,
    String? branchId,
    String? userId,
    String? search,
  }) async {
    if (take <= 0) return const [];
    final repo = ref.read(followUpsRepositoryProvider);
    final startPage = skip ~/ _pageSize + 1;
    final offsetInPage = skip % _pageSize;
    final pagesNeeded = ((offsetInPage + take) / _pageSize).ceil();

    final collected = <FollowUp>[];
    for (var i = 0; i < pagesNeeded; i++) {
      final page = await repo.getFollowUps(
        page: startPage + i,
        limit: _pageSize,
        branchId: branchId,
        userId: userId,
        search: search,
      );
      collected.addAll(page.tasks);
      if (page.tasks.length < _pageSize) break; // ran out of data
    }
    if (offsetInPage >= collected.length) return const [];
    return collected.sublist(offsetInPage, (offsetInPage + take).clamp(0, collected.length));
  }

  /// The single entry point for changing filters/sort — deliberately one
  /// method rather than several independent setters, so every field is
  /// applied together in one state transition (see the doc comment history
  /// on this method for the race that splitting it caused previously).
  ///
  /// Internally: gets fresh `counts` for the requested search/branch/user
  /// scope first (any single fetch returns them, page/status don't
  /// matter), then — if a quick-filter or due-date view is requested —
  /// fetches that bucket's actual window via [_fetchWindow] instead of
  /// just taking page 1.
  Future<void> applyFilters({
    required String? search,
    required String? status,
    required String? branchId,
    required String? userId,
    required FollowUpQuickFilter? quickFilter,
    required DateTime? dueDateSingle,
    required DateTime? dueDateFrom,
    required DateTime? dueDateTo,
    required String sortBy,
    required String sortOrder,
  }) async {
    // `.copyWithPrevious` keeps `state.valueOrNull` returning the *old*
    // list/counts while this fetch is in flight (and if it fails) instead
    // of wiping to a bare loading/error with nothing to show — otherwise
    // every keystroke in the search box tore down the whole screen
    // (search bar included) into a full-page skeleton, since the UI reads
    // this same state to decide what to render at all.
    state = const AsyncValue<FollowUpsListState>.loading().copyWithPrevious(state);
    final result = await AsyncValue.guard(() async {
      final repo = ref.read(followUpsRepositoryProvider);

      // Baseline fetch: also the source of truth for `counts` in this
      // search/branch/user scope, and — when no quick-filter/due-date view
      // is active — the actual data to display.
      final basePage = await repo.getFollowUps(
        limit: _pageSize,
        search: search,
        status: status,
        branchId: branchId,
        userId: userId,
      );
      final counts = basePage.counts;

      List<FollowUp> tasks;
      final hasDueDateFilter = dueDateSingle != null || dueDateFrom != null || dueDateTo != null;

      if (quickFilter != null) {
        final (skip, bucketCount) = switch (quickFilter) {
          FollowUpQuickFilter.overdue => (0, counts.overdue),
          FollowUpQuickFilter.today => (counts.overdue, counts.today),
          FollowUpQuickFilter.upcoming => (counts.overdue + counts.today, counts.upcoming),
        };
        tasks = await _fetchWindow(
          skip: skip,
          take: bucketCount.clamp(0, _bucketCap),
          branchId: branchId,
          userId: userId,
          search: search,
        );
      } else if (hasDueDateFilter) {
        // No server count exists for an arbitrary date/range, so this is a
        // heuristic, not exact: a date on/after today is almost certainly
        // in the today+upcoming window, a date before today in the
        // overdue window — skip straight to that neighborhood, fetch a
        // generous slice of it, then let `displayedTasks`'s exact-date
        // check narrow it down. On an org with a very large backlog, a
        // specific *past* date many pages deep into "overdue" can still
        // be missed by the cap — same known limitation noted in
        // `FollowUpsRepository`'s doc comment; a real fix needs the
        // backend to accept a date filter directly.
        final probeDate = dueDateSingle ?? dueDateFrom ?? dueDateTo!;
        final today = DateTime.now();
        final isFutureOrToday = !probeDate.isBefore(DateTime(today.year, today.month, today.day));
        final skip = isFutureOrToday ? counts.overdue : 0;
        final take = isFutureOrToday ? counts.today + counts.upcoming : counts.overdue;
        tasks = await _fetchWindow(
          skip: skip,
          take: take.clamp(0, _bucketCap),
          branchId: branchId,
          userId: userId,
          search: search,
        );
      } else {
        tasks = basePage.tasks;
      }

      return FollowUpsListState(
        allTasks: tasks,
        counts: counts,
        search: search,
        status: status,
        branchId: branchId,
        userId: userId,
        quickFilter: quickFilter,
        dueDateSingle: dueDateSingle,
        dueDateFrom: dueDateFrom,
        dueDateTo: dueDateTo,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
    });
    // A failed search/filter fetch keeps showing the last-good list rather
    // than blanking the screen — `AsyncValue.guard` alone would replace
    // `state` with a bare `AsyncError` (no previous value attached).
    state = result.hasError ? result.copyWithPrevious(state) : result;
  }

  Future<void> refresh() async {
    final current = state.valueOrNull ?? const FollowUpsListState();
    await applyFilters(
      search: current.search,
      status: current.status,
      branchId: current.branchId,
      userId: current.userId,
      quickFilter: current.quickFilter,
      dueDateSingle: current.dueDateSingle,
      dueDateFrom: current.dueDateFrom,
      dueDateTo: current.dueDateTo,
      sortBy: current.sortBy,
      sortOrder: current.sortOrder,
    );
  }

  /// Status-bar card tap. Routes through [applyFilters] like everything
  /// else — a real refetch is required now (see class doc comment), not a
  /// client-side-only filter. Selecting a card clears any custom due-date
  /// filter (the two are alternate "when" views, same as web's single
  /// `filter` URL param). Tapping the already-active card clears it.
  Future<void> setQuickFilter(FollowUpQuickFilter? filter) {
    final current = state.valueOrNull;
    if (current == null) return Future.value();
    final next = current.quickFilter == filter ? null : filter;
    return applyFilters(
      search: current.search,
      status: current.status,
      branchId: current.branchId,
      userId: current.userId,
      quickFilter: next,
      dueDateSingle: null,
      dueDateFrom: null,
      dueDateTo: null,
      sortBy: current.sortBy,
      sortOrder: current.sortOrder,
    );
  }

  /// One tap to see every follow-up regardless of status — sends the
  /// backend's literal `status: 'all'` (see `FollowUpsRepository`'s doc
  /// comment: the web app never actually does this due to a mapping quirk,
  /// so this is a deliberate mobile-only improvement, not a port of
  /// existing behavior) and clears every other filter/quick-filter.
  Future<void> showAll() {
    return applyFilters(
      search: null,
      status: 'all',
      branchId: null,
      userId: null,
      quickFilter: null,
      dueDateSingle: null,
      dueDateFrom: null,
      dueDateTo: null,
      sortBy: 'dueDate',
      sortOrder: 'asc',
    );
  }

  /// Resets everything — server-side filters, the quick-filter/due-date
  /// "when" view, and sort — back to the default active-only view.
  Future<void> clearAllFilters() {
    return applyFilters(
      search: null,
      status: null,
      branchId: null,
      userId: null,
      quickFilter: null,
      dueDateSingle: null,
      dueDateFrom: null,
      dueDateTo: null,
      sortBy: 'dueDate',
      sortOrder: 'asc',
    );
  }

  /// Optimistic status change, same "Quick Status" menu as
  /// `FollowUpMobileCard.tsx`. Rolls back on failure.
  Future<void> updateStatus(String id, String status) async {
    final current = state.valueOrNull;
    if (current == null) return;

    state = AsyncValue.data(current.copyWith(
      allTasks: [
        for (final t in current.allTasks)
          if (t.id == id) t.copyWith(status: status) else t,
      ],
    ));

    try {
      await ref.read(followUpsRepositoryProvider).updateStatus(id, status);
      await refresh();
    } catch (e) {
      state = AsyncValue.data(current);
      rethrow;
    }
  }

  Future<void> reschedule(String id, DateTime dueDate) async {
    await ref.read(followUpsRepositoryProvider).reschedule(id, dueDate);
    await refresh();
  }
}
