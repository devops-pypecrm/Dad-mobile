import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// A donut-style progress ring (achieved vs remaining) built on
/// `fl_chart`'s `PieChart`, per app-pre/mobile/DEPENDENCIES.MD's
/// recommendation for target progress rings.
class TargetProgressRing extends StatelessWidget {
  const TargetProgressRing({super.key, required this.percent, this.size = 160});

  /// 0–100. Values above 100 (over-achievement) are clamped for the ring
  /// itself but still shown as the real number in the center label.
  final double percent;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clamped = percent.clamp(0, 100).toDouble();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 0,
              centerSpaceRadius: size / 2 - 18,
              sections: [
                PieChartSectionData(
                  value: clamped,
                  color: theme.colorScheme.primary,
                  showTitle: false,
                  radius: 18,
                ),
                PieChartSectionData(
                  value: 100 - clamped,
                  color: theme.colorScheme.surfaceContainerHighest,
                  showTitle: false,
                  radius: 18,
                ),
              ],
            ),
          ),
          Padding(
            // Keeps the label inside the donut hole (`centerSpaceRadius`)
            // instead of clipping/overlapping the ring at large system font
            // scales, where headlineSmall can grow well past the label's
            // budgeted space.
            padding: EdgeInsets.all(size / 2 - 18 - 4),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${percent.toStringAsFixed(0)}%',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
