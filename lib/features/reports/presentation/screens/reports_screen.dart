import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/two_column_grid.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/user_performance.dart';
import '../../providers/reports_providers.dart';
import '../widgets/lead_funnel_chart.dart';

const _managerRoles = {'manager', 'admin', 'super_admin', 'branch_manager', 'org_admin'};

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(sessionControllerProvider).valueOrNull?.role.toLowerCase() ?? '';
    final isManager = _managerRoles.any(role.contains);

    return DefaultTabController(
      length: isManager ? 2 : 1,
      child: Scaffold(
        appBar: const GlobalAppBar(title: 'Reports'),
        // The Me/Team tab bar used to live in the AppBar's `bottom` slot;
        // now a plain section at the top of the body, since the AppBar is
        // shared across every tab and carries no screen-specific controls.
        body: isManager
            ? const Column(
                children: [
                  Material(
                    child: TabBar(tabs: [Tab(text: 'Me'), Tab(text: 'Team')]),
                  ),
                  Expanded(child: TabBarView(children: [_MyPerformanceTab(), _TeamTab()])),
                ],
              )
            : const _MyPerformanceTab(),
      ),
    );
  }
}

class _MyPerformanceTab extends ConsumerWidget {
  const _MyPerformanceTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final performanceAsync = ref.watch(myPerformanceProvider);
    final funnelAsync = ref.watch(myLeadsFunnelProvider);
    final salesBookAsync = ref.watch(salesBookThisMonthProvider);

    return RefreshIndicator(
      onRefresh: () => Future.wait([
        ref.refresh(myPerformanceProvider.future),
        ref.refresh(myLeadsFunnelProvider.future),
        ref.refresh(salesBookThisMonthProvider.future),
      ]),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('My Performance', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          performanceAsync.when(
            data: (entries) {
              final metrics = entries.isEmpty ? null : entries.first.metrics;
              if (metrics == null) {
                return const EmptyStateView(
                  message: 'No performance data yet.',
                  icon: Icons.insights_outlined,
                );
              }
              return TwoColumnGrid(
                children: [
                  _StatCard(label: 'Leads Assigned', value: '${metrics.leadsAssigned}'),
                  _StatCard(label: 'Leads Converted', value: '${metrics.leadsConverted}'),
                  _StatCard(label: 'Conversion Rate', value: '${metrics.conversionRate.toStringAsFixed(1)}%'),
                  _StatCard(label: 'Calls Made', value: '${metrics.callsMade}'),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => ErrorStateView(
              error: error,
              onRetry: () => ref.invalidate(myPerformanceProvider),
            ),
          ),
          const SizedBox(height: 24),
          Text('Lead Funnel', style: Theme.of(context).textTheme.titleLarge),
          Card(
            child: funnelAsync.when(
              data: (summary) => LeadFunnelChart(byStage: summary.summary.byStage),
              loading: () => const SizedBox(height: 220, child: Center(child: CircularProgressIndicator())),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(8),
                child: ErrorStateView(
                  error: error,
                  onRetry: () => ref.invalidate(myLeadsFunnelProvider),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Sales Book (This Month)', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          salesBookAsync.when(
            data: (summary) => Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: _SalesBookMetric(label: 'Deals', value: '${summary.summary.totalDeals}'),
                    ),
                    Expanded(
                      child: _SalesBookMetric(
                        label: 'Total Value',
                        value: summary.summary.totalValue.toStringAsFixed(0),
                      ),
                    ),
                    Expanded(
                      child: _SalesBookMetric(
                        label: 'Avg Deal',
                        value: summary.summary.averageDealSize.toStringAsFixed(0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => ErrorStateView(
              error: error,
              onRetry: () => ref.invalidate(salesBookThisMonthProvider),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamTab extends ConsumerWidget {
  const _TeamTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamAsync = ref.watch(teamPerformanceProvider);

    return teamAsync.when(
      data: (entries) {
        if (entries.isEmpty) {
          return const EmptyStateView(message: 'No team data found.', icon: Icons.groups_outlined);
        }
        final sorted = [...entries]
          ..sort((a, b) => b.metrics.conversionRate.compareTo(a.metrics.conversionRate));
        return RefreshIndicator(
          onRefresh: () => ref.refresh(teamPerformanceProvider.future),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: sorted.length,
            itemBuilder: (context, index) => _TeamPerformanceTile(rank: index + 1, entry: sorted[index]),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorStateView(
        error: error,
        onRetry: () => ref.invalidate(teamPerformanceProvider),
      ),
    );
  }
}

class _TeamPerformanceTile extends StatelessWidget {
  const _TeamPerformanceTile({required this.rank, required this.entry});

  final int rank;
  final PerformanceEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(child: Text('$rank')),
        title: Text(entry.user.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('${entry.metrics.leadsConverted}/${entry.metrics.leadsAssigned} converted'),
        trailing: Text('${entry.metrics.conversionRate.toStringAsFixed(0)}%'),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesBookMetric extends StatelessWidget {
  const _SalesBookMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
