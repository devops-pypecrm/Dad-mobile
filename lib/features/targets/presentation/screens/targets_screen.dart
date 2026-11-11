import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../dashboard/domain/sales_target.dart';
import '../../domain/target_won_deal.dart';
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
        body: Column(
          children: [
            const _MonthFilterBar(),
            Expanded(
              child: isManager
                  ? const TabBarView(children: [_MyTargetsTab(), _TeamTargetsTab()])
                  : const _MyTargetsTab(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyTargetsTab extends ConsumerWidget {
  const _MyTargetsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetsAsync = ref.watch(myTargetsProvider);
    final month = ref.watch(targetMonthFilterProvider);

    return targetsAsync.when(
      data: (targets) {
        if (targets.isEmpty) {
          return EmptyStateView(
            message: month == null ? 'No targets assigned yet.' : 'No targets for this month.',
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

/// "November 2026" / "Q4 2026" / "2026" — which period a target covers.
String _periodName(SalesTarget t) {
  final d = t.startDate;
  if (t.period == 'yearly') return '${d.year}';
  if (t.period == 'quarterly') return 'Q${(d.month - 1) ~/ 3 + 1} ${d.year}';
  return DateFormat('MMMM yyyy').format(d);
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
                    '${target.metric[0].toUpperCase()}${target.metric.substring(1)} · ${_periodName(target)}',
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
            const Divider(height: 24),
            _WonCases(targetId: target.id),
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
    final month = ref.watch(targetMonthFilterProvider);

    return targetsAsync.when(
      data: (targets) {
        if (targets.isEmpty) {
          return EmptyStateView(
            message: month == null ? 'No team targets found.' : 'No team targets for this month.',
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
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text('$rank')),
            title: Text(name.isEmpty ? 'Unknown' : name),
            subtitle: LinearProgressIndicator(
              value: (target.achievementPercent / 100).clamp(0, 1),
            ),
            trailing: Text('${target.achievementPercent.toStringAsFixed(0)}%'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: _WonCases(targetId: target.id, showOwner: false),
          ),
        ],
      ),
    );
  }
}


/// Month picker row shown above both tabs. Offers the last 12 months and the next 2.
class _MonthFilterBar extends ConsumerWidget {
  const _MonthFilterBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(targetMonthFilterProvider);
    final now = DateTime.now();
    final months = List.generate(15, (i) => DateTime(now.year, now.month + 2 - i, 1));
    final fmt = DateFormat('MMMM yyyy');
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          const Icon(Icons.calendar_month_outlined, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<DateTime?>(
                isExpanded: true,
                value: selected == null
                    ? null
                    : months.firstWhere(
                        (m) => m.year == selected.year && m.month == selected.month,
                        orElse: () => selected,
                      ),
                items: [
                  const DropdownMenuItem<DateTime?>(value: null, child: Text('All months')),
                  for (final m in months) DropdownMenuItem<DateTime?>(value: m, child: Text(fmt.format(m))),
                ],
                onChanged: (v) => ref.read(targetMonthFilterProvider.notifier).state = v,
              ),
            ),
          ),
          if (selected != null)
            IconButton(
              tooltip: 'Clear month',
              icon: const Icon(Icons.close),
              onPressed: () => ref.read(targetMonthFilterProvider.notifier).state = null,
            ),
        ],
      ),
    );
  }
}

/// Collapsible "Won cases" list for one target — fetched only when expanded.
class _WonCases extends ConsumerStatefulWidget {
  const _WonCases({required this.targetId, this.showOwner = true});

  final String targetId;
  final bool showOwner;

  @override
  ConsumerState<_WonCases> createState() => _WonCasesState();
}

class _WonCasesState extends ConsumerState<_WonCases> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deals = _open ? ref.watch(targetWonDealsProvider(widget.targetId)) : null;
    final count = deals?.valueOrNull?.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() => _open = !_open),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Icon(_open ? Icons.expand_more : Icons.chevron_right, size: 20),
                const SizedBox(width: 4),
                Icon(Icons.emoji_events_outlined, size: 18, color: Colors.green.shade700),
                const SizedBox(width: 6),
                Text(
                  count == null ? 'Won cases' : 'Won cases ($count)',
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
        if (deals != null)
          deals.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            error: (e, _) => Text("Couldn't load won cases.", style: TextStyle(color: theme.colorScheme.error)),
            data: (list) => list.isEmpty
                ? Text(
                    'No won cases counted for this target yet.',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  )
                : Column(children: [for (final d in list) _WonDealTile(deal: d)]),
          ),
      ],
    );
  }
}

class _WonDealTile extends StatelessWidget {
  const _WonDealTile({required this.deal});

  final TargetWonDeal deal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sub = [
      if (deal.accountName != null) deal.accountName!,
      if (deal.ownerName != null && deal.ownerName!.isNotEmpty) deal.ownerName!,
      if (deal.closedAt != null) DateFormat('d MMM yyyy').format(deal.closedAt!),
    ].join(' · ');
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(deal.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                if (sub.isNotEmpty)
                  Text(sub, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(deal.amount.toStringAsFixed(0), style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
