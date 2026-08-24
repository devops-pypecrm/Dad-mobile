import 'package:flutter/material.dart';

import '../../domain/daily_achievement.dart';

/// "You have X days remaining... you're at Y% of your target" — per
/// app-pre/business-logic/SALES_TARGET_ANALYSIS.MD's daily motivation modal.
class DailyMotivationSheet extends StatelessWidget {
  const DailyMotivationSheet({super.key, required this.target});

  final DailyTargetSummary target;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.rocket_launch_outlined, size: 40, color: theme.colorScheme.primary),
          const SizedBox(height: 16),
          Text(
            'You\'re at ${target.achievementPercent}% of your target!',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${target.daysRemaining} day${target.daysRemaining == 1 ? '' : 's'} left in this ${target.period} '
            'period — ${target.amountRemaining.toStringAsFixed(0)} to go. Let\'s close some deals!',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Let's go"),
          ),
        ],
      ),
    );
  }
}
