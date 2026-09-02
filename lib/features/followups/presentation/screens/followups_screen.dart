import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../domain/followups_list_state.dart';
import '../../domain/followups_page.dart';
import '../../providers/followups_list_controller.dart';
import '../widgets/followup_card.dart';
import '../widgets/followups_filter_sheet.dart';

/// The Follow Ups tab — same shape as Dad-frontend's `/follow-ups` page:
/// a 4-card status bar (Active/Overdue/Today/Upcoming, tap = quick filter),
/// search, a filter/sort sheet (Status/Branch/Owner/Due-date/Sort), active-
/// filter chips, a "Show All" shortcut, and a card list.
/// `FollowUpsListController` does all the real work; this file is pure
/// layout. Every filter/sort change goes through the controller's single
/// `applyFilters(...)` call (never several separate setter calls in a
/// row) — see that method's doc comment for why splitting it caused
/// choices to silently get dropped.
class FollowUpsScreen extends ConsumerStatefulWidget {
  const FollowUpsScreen({super.key});

  @override
  ConsumerState<FollowUpsScreen> createState() => _FollowUpsScreenState();
}

class _FollowUpsScreenState extends ConsumerState<FollowUpsScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _search(FollowUpsListState state, String query) {
    ref
        .read(followUpsListControllerProvider.notifier)
        .applyFilters(
          search: query.trim().isEmpty ? null : query.trim(),
          status: state.status,
          branchId: state.branchId,
          userId: state.userId,
          quickFilter: state.quickFilter,
          dueDateSingle: state.dueDateSingle,
          dueDateFrom: state.dueDateFrom,
          dueDateTo: state.dueDateTo,
          sortBy: state.sortBy,
          sortOrder: state.sortOrder,
        );
  }

  /// Live search-as-you-type — debounced so a fast typist doesn't fire a
  /// network request per keystroke; `onSubmitted` (Enter) still searches
  /// immediately without waiting out the debounce.
  void _onSearchChanged(FollowUpsListState state, String query) {
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => _search(state, query),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(followUpsListControllerProvider);
    // `.copyWithPrevious` in the controller keeps this populated with the
    // *previous* list/counts while a search/filter refetch is in flight —
    // so the stat cards, search bar, and filter row below can stay
    // permanently mounted instead of being torn down into a full-page
    // skeleton on every keystroke (that skeleton swap was what made typing
    // in the search box impossible — the TextField itself got unmounted
    // mid-input). Only the very first load (no data at all yet) falls back
    // to the full skeleton/error views.
    final state = stateAsync.valueOrNull;
    final isRefreshing = stateAsync.isLoading;

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Follow Ups'),
      body: state == null
          ? stateAsync.when(
              data: (_) =>
                  const SizedBox.shrink(), // unreachable: state would be non-null
              loading: () => const ListSkeleton(),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref
                    .read(followUpsListControllerProvider.notifier)
                    .refresh(),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: _StatusGrid(
                    counts: state.counts,
                    quickFilter: state.quickFilter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outlineVariant,
                            ),
                          ),
                          child: TextField(
                            controller: _searchController,
                            textInputAction: TextInputAction.search,
                            decoration: const InputDecoration(
                              hintText: 'Search follow-ups…',
                              prefixIcon: Icon(Icons.search),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (query) =>
                                _onSearchChanged(state, query),
                            onSubmitted: (query) => _search(state, query),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _PillButton(
                        height: 46,
                        onTap: () => ref
                            .read(followUpsListControllerProvider.notifier)
                            .showAll(),
                        child: const Text(
                          'Show All',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _PillButton(
                        height: 46,
                        width: 46,
                        onTap: () => showFollowUpsFilterSheet(context, ref),
                        child: Badge(
                          isLabelVisible: state.hasActiveFilters,
                          label: const Text(''),
                          child: const Icon(Icons.tune, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.hasActiveFilters) _ActiveFilterChips(state: state),
                // A slim inline indicator for an in-flight search/filter
                // refetch — replaces the old full-page skeleton swap so the
                // section above never remounts while the user is typing.
                SizedBox(
                  height: 2,
                  child: isRefreshing
                      ? const LinearProgressIndicator(minHeight: 2)
                      : null,
                ),
                Expanded(child: _FollowUpsListSection(state: state)),
              ],
            ),
    );
  }
}

/// Just the scrollable card list — its own widget so it (and only it)
/// rebuilds on every state change, independently of the persistent header
/// section above.
class _FollowUpsListSection extends ConsumerWidget {
  const _FollowUpsListSection({required this.state});

  final FollowUpsListState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = state.displayedTasks;
    return RefreshIndicator(
      onRefresh: () =>
          ref.read(followUpsListControllerProvider.notifier).refresh(),
      child: ListView(
        // Clears the floating bottom nav bar (see AppShell). A flat 100 fell
        // short in 3-button navigation mode — read the actual merged inset
        // instead (same fix as Dashboard/Leads/Reports/Search).
        padding: EdgeInsets.only(
          top: 8,
          bottom: math.max(MediaQuery.paddingOf(context).bottom + 12, 95),
        ),
        children: [
          if (tasks.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: EmptyStateView(
                message: 'Oh, No results.',
                icon: Icons.sentiment_dissatisfied_outlined,
              ),
            )
          else
            for (final task in tasks) FollowUpCard(followUp: task),
        ],
      ),
    );
  }
}

/// A 2×2 grid of gradient stat tiles (Active/Overdue/Today/Upcoming, tap =
/// quick filter) — icon badge, big number, label, and a faint decorative
/// icon in the corner. Built as two plain `Row`s stacked in a `Column`
/// (each tile sized to its own content), not a `GridView` with a fixed
/// `childAspectRatio` — that approach was tried before and forced every
/// cell to the same height regardless of content, which overflowed on
/// smaller phones or larger text-scale settings.
class _StatusGrid extends ConsumerWidget {
  const _StatusGrid({required this.counts, required this.quickFilter});

  final FollowUpCounts counts;
  final FollowUpQuickFilter? quickFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(followUpsListControllerProvider.notifier);
    // `_StatCard` uses a `Spacer()` internally to push its value/label to
    // the bottom — that needs a genuinely bounded height to work (an
    // unbounded Row/Column throws), which a plain `Row` alone doesn't
    // provide once nothing above imposes a fixed height on the whole grid.
    // `IntrinsicHeight` supplies that bound from each row's own content
    // instead — same fix `TwoColumnGrid` already uses elsewhere.
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Active',
                  value: counts.active,
                  icon: Icons.show_chart,
                  gradient: const [Color(0xFFEFF7E9), Color(0xFFC3E1AC)],
                  iconColor: const Color(0xFF578732),
                  valueColor: const Color(0xFF578732),
                  selected: quickFilter == null,
                  onTap: () => notifier.setQuickFilter(null),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  label: 'Overdue',
                  value: counts.overdue,
                  icon: Icons.access_time_filled,
                  gradient: const [Color(0xFFFFE4E6), Color(0xFFFECDD3)],
                  iconColor: const Color(0xFFDC2626),
                  valueColor: const Color(0xFFDC2626),
                  selected: quickFilter == FollowUpQuickFilter.overdue,
                  onTap: () =>
                      notifier.setQuickFilter(FollowUpQuickFilter.overdue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Today',
                  value: counts.today,
                  icon: Icons.calendar_today,
                  gradient: const [Color(0xFFFFEDD5), Color(0xFFFED7AA)],
                  iconColor: const Color(0xFFEA580C),
                  valueColor: const Color(0xFFEA580C),
                  selected: quickFilter == FollowUpQuickFilter.today,
                  onTap: () =>
                      notifier.setQuickFilter(FollowUpQuickFilter.today),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  label: 'Upcoming',
                  value: counts.upcoming,
                  icon: Icons.event_available,
                  gradient: const [Color(0xFFDBEAFE), Color(0xFFBFDBFE)],
                  iconColor: const Color(0xFF2563EB),
                  valueColor: const Color(0xFF2563EB),
                  selected: quickFilter == FollowUpQuickFilter.upcoming,
                  onTap: () =>
                      notifier.setQuickFilter(FollowUpQuickFilter.upcoming),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.gradient,
    required this.iconColor,
    required this.valueColor,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int value;
  final IconData icon;
  final List<Color> gradient;
  final Color iconColor;
  final Color valueColor;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: selected ? Border.all(color: valueColor, width: 2) : null,
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned(
                right: -8,
                bottom: -8,
                child: Icon(
                  icon,
                  size: 48,
                  color: Colors.white.withValues(alpha: 0.3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, size: 14, color: iconColor),
                    ),
                    const Spacer(),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$value',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: valueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: valueColor,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A white, rounded, thin-bordered box — used for the "Show All" shortcut
/// and the filter icon next to the search field, matching that field's own
/// white/rounded/bordered look instead of a bare `TextButton`/`IconButton`.
class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.onTap,
    required this.child,
    required this.height,
    this.width,
  });

  final VoidCallback onTap;
  final Widget child;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          // A fixed `width` means this is the square icon-only variant (the
          // filter button) — no horizontal padding needed there, unlike the
          // "Show All" text variant which sizes to its content.
          padding: width == null
              ? const EdgeInsets.symmetric(horizontal: 14)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class _ActiveFilterChips extends ConsumerWidget {
  const _ActiveFilterChips({required this.state});

  final FollowUpsListState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(followUpsListControllerProvider.notifier);

    // Every "remove this one filter" chip re-applies the full filter set
    // with just that one field cleared — same atomic `applyFilters` call
    // as everywhere else (see its doc comment), never a partial setter.
    // Each call below is explicit about every field on purpose: `null`
    // means "clear this one", `state.x` means "keep everything else as-is".
    final chips = <Widget>[];

    if (state.quickFilter != null) {
      chips.add(
        _chip(
          'Timeframe: ${state.quickFilter!.name}',
          () => notifier.setQuickFilter(null),
        ),
      );
    }
    if (state.hasDueDateFilter) {
      chips.add(
        _chip(
          'Due Date filter',
          () => notifier.applyFilters(
            search: state.search,
            status: state.status,
            branchId: state.branchId,
            userId: state.userId,
            quickFilter: state.quickFilter,
            dueDateSingle: null,
            dueDateFrom: null,
            dueDateTo: null,
            sortBy: state.sortBy,
            sortOrder: state.sortOrder,
          ),
        ),
      );
    }
    if (state.sortBy != 'dueDate' || state.sortOrder != 'asc') {
      chips.add(
        _chip(
          'Custom sort',
          () => notifier.applyFilters(
            search: state.search,
            status: state.status,
            branchId: state.branchId,
            userId: state.userId,
            quickFilter: state.quickFilter,
            dueDateSingle: state.dueDateSingle,
            dueDateFrom: state.dueDateFrom,
            dueDateTo: state.dueDateTo,
            sortBy: 'dueDate',
            sortOrder: 'asc',
          ),
        ),
      );
    }
    if (state.status != null) {
      chips.add(
        _chip(
          state.status == 'all'
              ? 'Showing all statuses'
              : 'Status: ${state.status!.replaceAll('_', ' ')}',
          () => notifier.applyFilters(
            search: state.search,
            status: null,
            branchId: state.branchId,
            userId: state.userId,
            quickFilter: state.quickFilter,
            dueDateSingle: state.dueDateSingle,
            dueDateFrom: state.dueDateFrom,
            dueDateTo: state.dueDateTo,
            sortBy: state.sortBy,
            sortOrder: state.sortOrder,
          ),
        ),
      );
    }
    if (state.branchId != null && state.branchId!.isNotEmpty) {
      chips.add(
        _chip(
          'Branch filter',
          () => notifier.applyFilters(
            search: state.search,
            status: state.status,
            branchId: null,
            userId: state.userId,
            quickFilter: state.quickFilter,
            dueDateSingle: state.dueDateSingle,
            dueDateFrom: state.dueDateFrom,
            dueDateTo: state.dueDateTo,
            sortBy: state.sortBy,
            sortOrder: state.sortOrder,
          ),
        ),
      );
    }
    if (state.userId != null && state.userId!.isNotEmpty) {
      chips.add(
        _chip(
          'User filter',
          () => notifier.applyFilters(
            search: state.search,
            status: state.status,
            branchId: state.branchId,
            userId: null,
            quickFilter: state.quickFilter,
            dueDateSingle: state.dueDateSingle,
            dueDateFrom: state.dueDateFrom,
            dueDateTo: state.dueDateTo,
            sortBy: state.sortBy,
            sortOrder: state.sortOrder,
          ),
        ),
      );
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: SizedBox(
        height: 32,
        child: ListView(scrollDirection: Axis.horizontal, children: chips),
      ),
    );
  }

  Widget _chip(String label, VoidCallback onDeleted) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: InputChip(
      label: Text(label, overflow: TextOverflow.ellipsis),
      onDeleted: onDeleted,
      visualDensity: VisualDensity.compact,
    ),
  );
}
