import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/text_format.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../providers/leads_list_provider.dart';
import '../widgets/lead_card.dart';
import '../widgets/leads_filter_sheet.dart';
import 'create_lead_screen.dart';

const _brandPurple = Color(0xFF5B21B6);

const _sortOptions = [
  ('createdAt', 'desc', 'Newest'),
  ('createdAt', 'asc', 'Oldest'),
  ('updatedAt', 'desc', 'Last Updated'),
  ('firstName', 'asc', 'Name A-Z'),
  ('owner', 'asc', 'Owner A-Z'),
];

class LeadsListScreen extends ConsumerStatefulWidget {
  const LeadsListScreen({super.key});

  @override
  ConsumerState<LeadsListScreen> createState() => _LeadsListScreenState();
}

class _LeadsListScreenState extends ConsumerState<LeadsListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _applySort(String sortBy, String sortOrder) {
    final current = ref.read(leadsListProvider).valueOrNull;
    ref.read(leadsListProvider.notifier).applyFilters(
          search: current?.search,
          status: current?.status,
          source: current?.source,
          assignedTo: current?.assignedTo,
          branchId: current?.branchId,
          startDate: current?.startDate,
          endDate: current?.endDate,
          sortBy: sortBy,
          sortOrder: sortOrder,
        );
  }

  void _clearFilter({
    bool status = false,
    bool source = false,
    bool owner = false,
    bool branch = false,
    bool dateRange = false,
  }) {
    final current = ref.read(leadsListProvider).valueOrNull;
    ref.read(leadsListProvider.notifier).applyFilters(
          search: current?.search,
          status: status ? null : current?.status,
          source: source ? null : current?.source,
          assignedTo: owner ? null : current?.assignedTo,
          branchId: branch ? null : current?.branchId,
          startDate: dateRange ? null : current?.startDate,
          endDate: dateRange ? null : current?.endDate,
          sortBy: current?.sortBy,
          sortOrder: current?.sortOrder,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(leadsListProvider);
    final data = state.valueOrNull;

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Leads'),
      // Padding clears the floating bottom nav bar (see AppShell — its
      // ~75px bar + 8px margin isn't accounted for by this screen's own
      // Scaffold, same reason the Dashboard's ListView needed bottom
      // padding added). Placed "just above" the bar, at the right edge, per
      // the reference design.
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
          backgroundColor: _brandPurple,
          onPressed: () => showQuickAddLeadSheet(context),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Search + sort/filter — previously lived in the AppBar's `bottom`
          // slot; now a plain section at the top of the page body since the
          // AppBar itself is shared across every tab and carries no
          // screen-specific controls anymore.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search name, email, phone…',
                      prefixIcon: const Icon(Icons.search),
                      // The app-wide theme sets `filled: true` with no
                      // explicit color (AppTheme's InputDecorationTheme),
                      // which defaults to Material3's grayish
                      // surfaceContainerHighest fill — override to white
                      // just for this field rather than touching the
                      // global theme.
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onSubmitted: (query) => ref.read(leadsListProvider.notifier).applyFilters(
                          search: query.trim().isEmpty ? null : query.trim(),
                          status: data?.status,
                          source: data?.source,
                          assignedTo: data?.assignedTo,
                          branchId: data?.branchId,
                          startDate: data?.startDate,
                          endDate: data?.endDate,
                          sortBy: data?.sortBy,
                          sortOrder: data?.sortOrder,
                        ),
                  ),
                ),
                const SizedBox(width: 8),
                _SquareIconButton(
                  tooltip: 'Filters',
                  icon: Icons.tune,
                  badgeCount: data?.hasActiveFilters ?? false ? 1 : null,
                  onTap: () => showLeadsFilterSheet(context, ref),
                ),
                const SizedBox(width: 8),
                _SquareIconButton(
                  tooltip: 'Sort',
                  icon: Icons.filter_list,
                  onTap: () async {
                    final choice = await showModalBottomSheet<(String, String)>(
                      context: context,
                      builder: (context) => SafeArea(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            for (final (sortBy, sortOrder, label) in _sortOptions)
                              ListTile(
                                title: Text(label),
                                trailing: data?.sortBy == sortBy && data?.sortOrder == sortOrder
                                    ? const Icon(Icons.check)
                                    : null,
                                onTap: () => Navigator.of(context).pop((sortBy, sortOrder)),
                              ),
                          ],
                        ),
                      ),
                    );
                    if (choice != null) _applySort(choice.$1, choice.$2);
                  },
                ),
              ],
            ),
          ),
          if (data?.hasActiveFilters ?? false) _ActiveFilterChips(data: data!, onClear: _clearFilter),
          Expanded(
            child: state.when(
              data: (data) {
                if (data.leads.isEmpty) {
                  return const EmptyStateView(
                    message: 'No leads match these filters.',
                    icon: Icons.people_outline,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () => ref.read(leadsListProvider.notifier).refresh(),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 8, bottom: 100),
                    itemCount: data.leads.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= data.leads.length) {
                        return _LoadMoreFooter(data: data);
                      }
                      final lead = data.leads[index];
                      return LeadCard(lead: lead, onTap: () => context.push('/leads/${lead.id}'));
                    },
                  ),
                );
              },
              loading: () => const ListSkeleton(),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.read(leadsListProvider.notifier).refresh(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SquareIconButton extends StatelessWidget {
  const _SquareIconButton({required this.icon, required this.tooltip, required this.onTap, this.badgeCount});

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(child: Icon(icon, color: theme.colorScheme.onSurfaceVariant)),
              if (badgeCount != null)
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: _brandPurple, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                    child: Text(
                      '$badgeCount',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "Showing 1–N of Total leads" + a manual "Load more" button — replaces
/// the previous auto-load-on-scroll behavior so pagination is an explicit,
/// visible action instead of a silent background fetch.
class _LoadMoreFooter extends ConsumerWidget {
  const _LoadMoreFooter({required this.data});

  final LeadsListState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          Text(
            'Showing 1–${data.leads.length} of ${data.total} leads',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const Spacer(),
          if (data.hasMore)
            OutlinedButton.icon(
              onPressed: data.isLoadingMore ? null : () => ref.read(leadsListProvider.notifier).loadMore(),
              icon: data.isLoadingMore
                  ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.keyboard_arrow_down, size: 18),
              label: const Text('Load more'),
            ),
        ],
      ),
    );
  }
}

class _ActiveFilterChips extends ConsumerWidget {
  const _ActiveFilterChips({required this.data, required this.onClear});

  final LeadsListState data;
  final void Function({bool status, bool source, bool owner, bool branch, bool dateRange}) onClear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leadStatuses = ref.watch(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;
    final users = ref.watch(hierarchyUsersProvider).valueOrNull ?? const [];
    final branches = ref.watch(dashboardBranchesProvider).valueOrNull ?? const [];

    String statusLabel(String id) {
      final match = leadStatuses?.where((o) => o.id == id);
      return (match != null && match.isNotEmpty) ? (match.first.label ?? id) : id;
    }

    String ownerLabel(String id) {
      final match = users.where((u) => u.id == id);
      return match.isEmpty ? id : match.first.fullName;
    }

    String branchLabel(String id) {
      final match = branches.where((b) => b.id == id);
      return match.isEmpty ? id : match.first.name;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: SizedBox(
        height: 32,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            if (data.status != null)
              _FilterChip(label: 'Status: ${statusLabel(data.status!)}', onDeleted: () => onClear(status: true)),
            if (data.source != null)
              _FilterChip(label: 'Source: ${humanizeSnakeCase(data.source!)}', onDeleted: () => onClear(source: true)),
            if (data.assignedTo != null)
              _FilterChip(label: 'Owner: ${ownerLabel(data.assignedTo!)}', onDeleted: () => onClear(owner: true)),
            if (data.branchId != null)
              _FilterChip(label: 'Branch: ${branchLabel(data.branchId!)}', onDeleted: () => onClear(branch: true)),
            if (data.startDate != null || data.endDate != null)
              _FilterChip(label: 'Date Range', onDeleted: () => onClear(dateRange: true)),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.onDeleted});

  final String label;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InputChip(
        label: Text(label, overflow: TextOverflow.ellipsis),
        onDeleted: onDeleted,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
