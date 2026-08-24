import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/sales_target.dart';

const _brandPurple = Color(0xFF5B21B6);

class TargetProgressCard extends StatelessWidget {
  const TargetProgressCard({super.key, required this.target});

  final SalesTarget? target;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

    if (target == null) {
      return Card(
        margin: EdgeInsets.zero,
        shape: shape,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('No active sales target set for this period.', style: theme.textTheme.bodyMedium),
        ),
      );
    }

    final t = target!;
    return Card(
      margin: EdgeInsets.zero,
      shape: shape,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('My Target', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(t.period, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: t.achievementPercent / 100,
                minHeight: 10,
                backgroundColor: _brandPurple.withValues(alpha: 0.15),
                valueColor: const AlwaysStoppedAnimation(_brandPurple),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '${t.achievedValue.toStringAsFixed(0)} / ${t.targetValue.toStringAsFixed(0)} '
                  '(${t.achievementPercent.toStringAsFixed(0)}%)',
                  style: theme.textTheme.bodyMedium?.copyWith(color: _brandPurple, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () => context.push(AppRoutes.targets),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _brandPurple,
                    side: const BorderSide(color: _brandPurple),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
