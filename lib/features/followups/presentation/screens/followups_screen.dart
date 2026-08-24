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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search(FollowUpsListState state, String query) {
    ref.read(followUpsListControllerProvider.notifier).applyFilters(
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

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(followUpsListControllerProvider);

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Follow Ups'),
      body: stateAsync.when(
        data: (state) {
          final tasks = state.displayedTasks;
          return RefreshIndicator(
            onRefresh: () => ref.read(followUpsListControllerProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: _StatusGrid(counts: state.counts, quickFilter: state.quickFilter),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: 'Search follow-ups…',
                            prefixIcon: const Icon(Icons.search),
                            isDense: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                          ),
                          onSubmitted: (query) => _search(state, query),
                        ),
                      ),
                      TextButton(
                        onPressed: () => ref.read(followUpsListControllerProvider.notifier).showAll(),
                        child: const Text('Show All'),
                      ),
                      IconButton(
                        tooltip: 'Filters',
                        icon: Badge(
                          isLabelVisible: state.hasActiveFilters,
                          label: const Text(''),
                          child: const Icon(Icons.filter_list),
                        ),
                        onPressed: () => showFollowUpsFilterSheet(context, ref),
                      ),
                    ],
                  ),
                ),
                if (state.hasActiveFilters) _ActiveFilterChips(state: state),
                const SizedBox(height: 8),
                if (tasks.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 48),
                    child: EmptyStateView(
                      message: 'No follow-ups match these filters.',
                      icon: Icons.checklist,
                    ),
                  )
                else
                  for (final task in tasks) FollowUpCard(followUp: task),
              ],
            ),
          );
        },
        loading: () => const ListSkeleton(),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.read(followUpsListControllerProvider.notifier).refresh(),
        ),
      ),
    );
  }
}

/// A single, un-cramped row of 4 stat chips rather than a 2×2 grid — a
/// grid at `childAspectRatio: 2.4` squeezed a value + label + sublabel into
/// ~70px-tall cells, which wrapped/overflowed on smaller phones or larger
/// text-scale settings. One row gives each chip the full column width to
/// work with and drops the redundant sublabel (the label already says
/// "Overdue"/"Today"/etc.).
class _StatusGrid extends ConsumerWidget {
  const _StatusGrid({required this.counts, required this.quickFilter});

  final FollowUpCounts counts;
  final FollowUpQuickFilter? quickFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(followUpsListControllerProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: _StatusChip(
            label: 'Active',
            value: counts.active,
            color: Theme.of(context).colorScheme.primary,
            selected: quickFilter == null,
            onTap: () => notifier.setQuickFilter(null),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: _StatusChip(
            label: 'Overdue',
            value: counts.overdue,
            color: const Color(0xFFDC2626),
            selected: quickFilter == FollowUpQuickFilter.overdue,
            onTap: () => notifier.setQuickFilter(FollowUpQuickFilter.overdue),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: _StatusChip(
            label: 'Today',
            value: counts.today,
            color: const Color(0xFFEA580C),
            selected: quickFilter == FollowUpQuickFilter.today,
            onTap: () => notifier.setQuickFilter(FollowUpQuickFilter.today),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: _StatusChip(
            label: 'Upcoming',
            value: counts.upcoming,
            color: const Color(0xFF2563EB),
            selected: quickFilter == FollowUpQuickFilter.upcoming,
            onTap: () => notifier.setQuickFilter(FollowUpQuickFilter.upcoming),
          ),
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.value,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int value;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Guaranteed contrast in both states instead of relying on alpha
    // blending: selected = solid color fill + white text (unmistakable);
    // unselected = plain surface background + colored text/border. The
    // previous version put colored text on a 7%-alpha tint of that same
    // color, which read as washed-out/invisible on some devices — this
    // removes that dependency entirely.
    final background = selected ? color : theme.colorScheme.surface;
    final foreground = selected ? Colors.white : color;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: selected ? 0 : 0.5)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$value',
                style: theme.textTheme.titleLarge?.copyWith(color: foreground, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(color: foreground, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
      chips.add(_chip('Timeframe: ${state.quickFilter!.name}', () => notifier.setQuickFilter(null)));
    }
    if (state.hasDueDateFilter) {
      chips.add(_chip(
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
      ));
    }
    if (state.sortBy != 'dueDate' || state.sortOrder != 'asc') {
      chips.add(_chip(
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
      ));
    }
    if (state.status != null) {
      chips.add(_chip(
        state.status == 'all' ? 'Showing all statuses' : 'Status: ${state.status!.replaceAll('_', ' ')}',
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
      ));
    }
    if (state.branchId != null && state.branchId!.isNotEmpty) {
      chips.add(_chip(
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
      ));
    }
    if (state.userId != null && state.userId!.isNotEmpty) {
      chips.add(_chip(
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
      ));
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
