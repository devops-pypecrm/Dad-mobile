import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../dashboard/domain/sales_target.dart';
import '../../domain/team_target.dart';
import '../../providers/targets_providers.dart';
import '../widgets/target_progress_ring.dart';

/// Roles that see the Team Targets tab. This is UI visibility only — the
/// backend independently enforces who `GET /api/sales-targets/team` scopes
/// data to, this just avoids showing an empty/error tab to reps who have no
/// subordinates.
const _managerRoles = {
  'manager',
  'admin',
  'super_admin',
  'branch_manager',
  'org_admin',
};

class TargetsScreen extends ConsumerWidget {
  const TargetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role =
        ref.watch(sessionControllerProvider).valueOrNull?.role.toLowerCase() ??
        '';
    final isManager = _managerRoles.any(role.contains);

    return DefaultTabController(
      length: isManager ? 2 : 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Targets'),
          bottom: isManager
              ? const TabBar(
                  tabs: [
                    Tab(text: 'My Targets'),
                    Tab(text: 'Team'),
                  ],
                )
              : null,
        ),
        body: isManager
            ? const TabBarView(children: [_MyTargetsTab(), _TeamTargetsTab()])
            : const _MyTargetsTab(),
      ),
    );
  }
}

class _MyTargetsTab extends ConsumerWidget {
  const _MyTargetsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetsAsync = ref.watch(myTargetsProvider);

    return targetsAsync.when(
      data: (targets) {
        if (targets.isEmpty) {
          return const EmptyStateView(
            message: 'No targets assigned yet.',
            icon: Icons.flag_outlined,
          );
        }
        return RefreshIndicator(
          onRefresh: () => ref.refresh(myTargetsProvider.future),
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              safeBottomInset(context) + 16,
            ),
            itemCount: targets.length,
            itemBuilder: (context, index) =>
                _MyTargetCard(target: targets[index]),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorStateView(
        error: error,
        onRetry: () => ref.invalidate(myTargetsProvider),
      ),
    );
  }
}

class _MyTargetCard extends StatelessWidget {
  const _MyTargetCard({required this.target});

  final SalesTarget target;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${target.metric[0].toUpperCase()}${target.metric.substring(1)} · ${target.period}',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Chip(
                  label: Text(target.status),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TargetProgressRing(percent: target.achievementPercent),
            const SizedBox(height: 16),
            Text(
              '${target.achievedValue.toStringAsFixed(0)} / ${target.targetValue.toStringAsFixed(0)}',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${target.endDate.difference(DateTime.now()).inDays.clamp(0, 99999)} days left',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamTargetsTab extends ConsumerWidget {
  const _TeamTargetsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetsAsync = ref.watch(teamTargetsProvider);

    return targetsAsync.when(
      data: (targets) {
        if (targets.isEmpty) {
          return const EmptyStateView(
            message: 'No team targets found.',
            icon: Icons.groups_outlined,
          );
        }
        final sorted = [
          ...targets,
        ]..sort((a, b) => b.achievementPercent.compareTo(a.achievementPercent));
        return RefreshIndicator(
          onRefresh: () => ref.refresh(teamTargetsProvider.future),
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 8, 0, safeBottomInset(context) + 8),
            itemCount: sorted.length,
            itemBuilder: (context, index) =>
                _TeamTargetTile(rank: index + 1, target: sorted[index]),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorStateView(
        error: error,
        onRetry: () => ref.invalidate(teamTargetsProvider),
      ),
    );
  }
}

class _TeamTargetTile extends StatelessWidget {
  const _TeamTargetTile({required this.rank, required this.target});

  final int rank;
  final TeamTarget target;

  @override
  Widget build(BuildContext context) {
    final name = [
      target.assignedTo?.firstName,
      target.assignedTo?.lastName,
    ].where((p) => p != null && p.isNotEmpty).join(' ');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(child: Text('$rank')),
        title: Text(name.isEmpty ? 'Unknown' : name),
        subtitle: LinearProgressIndicator(
          value: (target.achievementPercent / 100).clamp(0, 1),
        ),
        trailing: Text('${target.achievementPercent.toStringAsFixed(0)}%'),
      ),
    );
  }
}
