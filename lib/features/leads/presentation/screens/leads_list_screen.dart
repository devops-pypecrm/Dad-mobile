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
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(leadsListProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/leads/new'),
        child: const Icon(Icons.add),
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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
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
                IconButton(
                  tooltip: 'Sort',
                  icon: const Icon(Icons.sort),
                  onPressed: () async {
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
                IconButton(
                  tooltip: 'Filters',
                  icon: Badge(
                    isLabelVisible: data?.hasActiveFilters ?? false,
                    label: const Text(''),
                    child: const Icon(Icons.filter_list),
                  ),
                  onPressed: () => showLeadsFilterSheet(context, ref),
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
                    padding: const EdgeInsets.only(top: 8, bottom: 88),
                    itemCount: data.leads.length + (data.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= data.leads.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
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
