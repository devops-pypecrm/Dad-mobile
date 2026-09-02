import 'package:flutter/material.dart';

const _brandColor = Color(0xFF578732);

/// Best-effort icon per stage, matched by keyword rather than an exact
/// lookup table — stage names are org-configurable (`Organisation.
/// leadStatuses`), so there's no fixed enum of values to switch on across
/// every tenant. Falls back to a generic label icon for anything
/// unrecognized.
IconData _iconForStage(String stage) {
  final s = stage.toLowerCase();
  if (s.contains('unknown')) return Icons.help_outline;
  if (s.contains('later')) return Icons.schedule_outlined;
  if (s.contains('unreachable')) return Icons.phone_disabled_outlined;
  if (s.contains('hold')) return Icons.pause_circle_outline;
  if (s.contains('wrong')) return Icons.phone_missed_outlined;
  if (s.contains('not responding')) return Icons.chat_bubble_outline;
  if (s.contains('follow')) return Icons.autorenew;
  if (s.contains('proposal')) return Icons.send_outlined;
  if (s.contains('dnp')) return Icons.do_disturb_on_outlined;
  if (s.contains('convert')) return Icons.check_circle_outline;
  if (s.contains('invalid')) return Icons.error_outline;
  return Icons.label_outline;
}

/// Horizontal bars, one per pipeline stage — favored over a vertical
/// fl_chart `BarChart` because stage names are org-configurable
/// (`Organisation.leadStatuses`) and can be long ("Pre-qualified Lead",
/// "Demo Scheduled", etc.); a vertical chart's x-axis labels collided and
/// wrapped into an unreadable mess as soon as there were more than 3-4
/// stages or the names got longer than a couple characters. A label column
/// on the left has no such limit — it just truncates with an ellipsis.
class LeadFunnelChart extends StatelessWidget {
  const LeadFunnelChart({super.key, required this.byStage, required this.total});

  final Map<String, int> byStage;
  final int total;

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _brandColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Total Leads $total',
                style: theme.textTheme.labelMedium?.copyWith(color: _brandColor, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (final entry in entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _brandColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(_iconForStage(entry.key), size: 16, color: _brandColor),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 84,
                    child: Text(
                      entry.key,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        children: [
                          Container(height: 8, color: _brandColor.withValues(alpha: 0.12)),
                          FractionallySizedBox(
                            widthFactor: maxValue == 0 ? 0 : entry.value / maxValue,
                            child: Container(height: 8, color: _brandColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 30,
                    child: Text(
                      '${entry.value}',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold, color: _brandColor),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text('|', style: TextStyle(color: theme.colorScheme.outlineVariant)),
                  const SizedBox(width: 6),
                  SizedBox(
                    width: 46,
                    child: Text(
                      total > 0 ? '${(entry.value / total * 100).toStringAsFixed(1)}%' : '0%',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
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
