import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/lead_source_stat.dart';

const _brandColor = Color(0xFF578732);

// Same COLORS array as Dad-frontend/src/components/dashboard/LeadSourcesWidget.tsx:8,
// cycled the same way (`COLORS[index % COLORS.length]`) so a given source
// lands on the same color on both platforms.
const _palette = [
  Color(0xFF34D399),
  Color(0xFF2DD4BF),
  Color(0xFF38BDF8),
  Color(0xFF818CF8),
  Color(0xFFA78BFA),
  Color(0xFFF472B6),
];

String _labelFor(String source) {
  final words = source.replaceAll('_', ' ').split(' ');
  return words.map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}').join(' ');
}

/// Donut chart of `GET /api/analytics/lead-sources`. That endpoint applies
/// no date filter, so this reflects all-time lead counts, not the
/// dashboard's selected month.
class LeadSourceChart extends StatelessWidget {
  const LeadSourceChart({super.key, required this.stats});

  final List<LeadSourceStat> stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (stats.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: Text('No lead source data yet.')),
      );
    }

    final total = stats.fold<int>(0, (sum, s) => sum + s.count);
    final sorted = [...stats]..sort((a, b) => b.count.compareTo(a.count));

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 42,
                      sections: [
                        for (var i = 0; i < sorted.length; i++)
                          PieChartSectionData(
                            value: sorted[i].count.toDouble(),
                            color: _palette[i % _palette.length],
                            radius: 26,
                            showTitle: false,
                          ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$total',
                        style: theme.textTheme.titleLarge
                            ?.copyWith(color: _brandColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'leads',
                        style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < sorted.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(color: _palette[i % _palette.length], shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _labelFor(sorted[i].source),
                              style: theme.textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            total == 0 ? '0%' : '${(sorted[i].count / total * 100).round()}%',
                            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const Divider(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total leads', style: theme.textTheme.bodyMedium),
            Text(
              '$total',
              style: theme.textTheme.titleMedium?.copyWith(color: _brandColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
