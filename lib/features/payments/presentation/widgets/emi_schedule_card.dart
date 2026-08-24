import 'package:flutter/material.dart';

import '../../domain/emi_schedule_summary.dart';

class EmiScheduleCard extends StatelessWidget {
  const EmiScheduleCard({super.key, required this.schedule, required this.onTap});

  final EmiScheduleSummary schedule;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nextDue = schedule.nextDueInstallment;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      schedule.opportunity.name,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (schedule.isOverdue)
                    Chip(
                      label: const Text('Overdue'),
                      backgroundColor: theme.colorScheme.errorContainer,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('Remaining: ', style: theme.textTheme.bodyMedium),
                  Text(
                    schedule.remainingAmount.toStringAsFixed(0),
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              if (nextDue != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Next due: ${nextDue.amount.toStringAsFixed(0)} on '
                  '${'${nextDue.dueDate.toLocal()}'.split(' ').first}',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
