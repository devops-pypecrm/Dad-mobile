import 'package:flutter/material.dart';

import '../../domain/opportunity.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({super.key, required this.opportunity, required this.onTap});

  final Opportunity opportunity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTerminal = kTerminalOpportunityStages.contains(opportunity.stage);

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
              Text(
                opportunity.name,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              if (opportunity.account != null) ...[
                const SizedBox(height: 2),
                Text(
                  opportunity.account!.name,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Builder(
                    builder: (context) {
                      // Material 3 has no built-in "success" role — tertiary
                      // is the conventional stand-in. Using the theme's
                      // container/on-container pairing (not a raw color +
                      // hardcoded alpha) guarantees contrast, the same
                      // pattern used by EmiScheduleCard's overdue chip.
                      Color? background;
                      Color? foreground;
                      if (isTerminal) {
                        if (opportunity.stage == 'closed_won') {
                          background = theme.colorScheme.tertiaryContainer;
                          foreground = theme.colorScheme.onTertiaryContainer;
                        } else {
                          background = theme.colorScheme.errorContainer;
                          foreground = theme.colorScheme.onErrorContainer;
                        }
                      }
                      return Chip(
                        label: Text(opportunity.stage),
                        labelStyle: foreground != null ? TextStyle(color: foreground) : null,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        backgroundColor: background,
                      );
                    },
                  ),
                  const Spacer(),
                  Text(
                    opportunity.amount.toStringAsFixed(0),
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
