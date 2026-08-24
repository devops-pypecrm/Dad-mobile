import 'package:flutter/material.dart';

/// Horizontal bars, one per pipeline stage — favored over a vertical
/// fl_chart `BarChart` because stage names are org-configurable
/// (`Organisation.leadStatuses`) and can be long ("Pre-qualified Lead",
/// "Demo Scheduled", etc.); a vertical chart's x-axis labels collided and
/// wrapped into an unreadable mess as soon as there were more than 3-4
/// stages or the names got longer than a couple characters. A label column
/// on the left has no such limit — it just truncates with an ellipsis.
class LeadFunnelChart extends StatelessWidget {
  const LeadFunnelChart({super.key, required this.byStage});

  final Map<String, int> byStage;

  @override
  Widget build(BuildContext context) {
    if (byStage.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: Text('No lead data for this period.')),
      );
    }

    final theme = Theme.of(context);
    final entries = byStage.entries.toList();
    final maxValue = entries.map((e) => e.value).fold<int>(0, (a, b) => a > b ? a : b);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        children: [
          for (final entry in entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 92,
                    child: Text(
                      entry.key,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        children: [
                          Container(height: 18, color: theme.colorScheme.surfaceContainerHighest),
                          FractionallySizedBox(
                            widthFactor: maxValue == 0 ? 0 : entry.value / maxValue,
                            child: Container(height: 18, color: theme.colorScheme.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 28,
                    child: Text(
                      '${entry.value}',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
