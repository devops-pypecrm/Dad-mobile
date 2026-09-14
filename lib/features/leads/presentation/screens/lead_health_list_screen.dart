import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../../dashboard/domain/dashboard_date_range.dart';
import '../../providers/lead_health_list_provider.dart';
import '../widgets/lead_card.dart';
import '../widgets/lead_health_filter_sheet.dart';

/// Destination screen for the Dashboard's "Unattended Leads"/"No Activity
/// Leads" tiles — reached via `/leads/unattended` and `/leads/no-activity`
/// (see `app_router.dart`), which carry the Dashboard's currently-selected
/// branch/date filter through as the *initial* state. Date range/User/
/// Source are then further adjustable in-screen via the AppBar's filter
/// icon (`showLeadHealthFilterSheet`) — branch stays fixed to whatever the
/// Dashboard had selected, since these lists don't have their own branch
/// picker elsewhere either.
class LeadHealthListScreen extends ConsumerStatefulWidget {
  const LeadHealthListScreen({
    super.key,
    required this.kind,
    this.branchId,
    this.startDate,
    this.endDate,
  });

  final LeadHealthKind kind;
  final String? branchId;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  ConsumerState<LeadHealthListScreen> createState() => _LeadHealthListScreenState();
}

class _LeadHealthListScreenState extends ConsumerState<LeadHealthListScreen> {
  final _scrollController = ScrollController();

  // Seeded from whatever the Dashboard's own filter was when its tile was
  // tapped — if it forwarded no dates at all (e.g. it was on "All Time",
  // which isn't a preset offered here), default to "This Month" rather
  // than leaving the date range genuinely unbounded.
  late DashboardDateRange _dateRange = (widget.startDate != null || widget.endDate != null)
      ? DashboardDateRange.custom(widget.startDate ?? DateTime.now(), widget.endDate ?? DateTime.now())
      : DashboardDateRange.thisMonth();
  String? _assignedTo;
  String? _source;

  String get _title =>
      widget.kind == LeadHealthKind.unattended ? 'Unattended Leads' : 'No Activity Leads';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _openFilters() async {
    final result = await showLeadHealthFilterSheet(
      context,
      current: LeadHealthFilters(dateRange: _dateRange, assignedTo: _assignedTo, source: _source),
    );
    setState(() {
      _dateRange = result.dateRange;
      _assignedTo = result.assignedTo;
      _source = result.source;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = leadHealthListProvider(
      widget.kind,
      branchId: widget.branchId,
      assignedTo: _assignedTo,
      source: _source,
      startDate: _dateRange.startDate,
      endDate: _dateRange.endDate,
    );
    final state = ref.watch(provider);
    final hasActiveFilters = _assignedTo != null || _source != null;
    final total = state.valueOrNull?.total;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_title),
            Text(
              // The count is the whole point of this ask — shown right next
              // to the title so "how many match the current filter" is
              // visible without scrolling, no matter how long the list is.
              total == null ? _dateRange.label : '$total ${total == 1 ? 'lead' : 'leads'} · ${_dateRange.label}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Filters',
            onPressed: _openFilters,
            icon: Badge(
              isLabelVisible: hasActiveFilters,
              smallSize: 8,
              child: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          if (data.leads.isEmpty) {
            return EmptyStateView(
              message: widget.kind == LeadHealthKind.unattended
                  ? 'No unattended leads — nice work.'
                  : 'No stale leads — everything has recent activity.',
              icon: Icons.people_outline,
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: data.leads.length + 1,
              itemBuilder: (context, index) {
                if (index >= data.leads.length) {
                  return _LoadMoreFooter(
                    hasMore: data.hasMore,
                    loading: data.isLoadingMore,
                    onLoadMore: () => ref.read(provider.notifier).loadMore(),
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
          onRetry: () => ref.invalidate(provider),
        ),
      ),
    );
  }
}

class _LoadMoreFooter extends StatelessWidget {
  const _LoadMoreFooter({required this.hasMore, required this.loading, required this.onLoadMore});

  final bool hasMore;
  final bool loading;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    if (!hasMore) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Center(
        child: OutlinedButton.icon(
          onPressed: loading ? null : onLoadMore,
          icon: loading
              ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.keyboard_arrow_down, size: 18),
          label: const Text('Load more'),
        ),
      ),
    );
  }
}
