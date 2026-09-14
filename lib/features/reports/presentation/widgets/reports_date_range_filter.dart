import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dashboard/presentation/widgets/date_range_filter_sheet.dart';
import '../../providers/reports_providers.dart';

const _brandColor = Color(0xFF578732);

/// Same preset list/UI as the Dashboard's date filter (All Time / This
/// Month / Last Month / Custom Range) — shared here via
/// [showDashboardDateRangeFilterSheet] rather than reimplemented, so the two
/// screens stay visually and behaviourally identical. Sits once above the
/// Me/Team tabs since [reportsDateRangeProvider] drives both.
class ReportsDateRangeFilter extends ConsumerWidget {
  const ReportsDateRangeFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(reportsDateRangeProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            final picked = await showDashboardDateRangeFilterSheet(context, selected: selected);
            ref.read(reportsDateRangeProvider.notifier).state = picked;
          },
          child: Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.calendar_today_outlined, size: 15, color: _brandColor),
                const SizedBox(width: 6),
                Text(
                  selected.label,
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: _brandColor),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 16, color: _brandColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
