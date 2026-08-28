import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/call_stats_provider.dart';

/// Mirrors the web `/calls` page's 4 stat cards + today/week/month period
/// selector — same `GET /api/calls/stats` figures, laid out as a horizontal
/// scroller since 4 fixed-width cards don't fit a phone screen at once.
class CallStatsHeader extends ConsumerWidget {
  const CallStatsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(callStatsProvider);
    final period = ref.watch(callStatsPeriodProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              for (final p in const ['today', 'week', 'month'])
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(p[0].toUpperCase() + p.substring(1)),
                    selected: period == p,
                    onSelected: (_) => ref.read(callStatsPeriodProvider.notifier).state = p,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 92,
          child: statsAsync.when(
            data: (stats) => ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _StatCard(label: 'Total Calls', value: '${stats.totalCalls}', icon: Icons.phone_outlined),
                _StatCard(
                  label: 'Avg Duration',
                  value: '${stats.avgDuration.toStringAsFixed(1)}m',
                  icon: Icons.timer_outlined,
                ),
                _StatCard(label: 'Missed', value: '${stats.missedCalls}', icon: Icons.phone_missed_outlined),
                _StatCard(label: 'Recordings', value: '${stats.callsWithRecording}', icon: Icons.mic_outlined),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            error: (_, _) => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const Spacer(),
          Text(value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
