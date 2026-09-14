import 'package:flutter/material.dart';

import '../../domain/dashboard_date_range.dart';

/// Replaces the old month/year scroll-wheel popup with a plain option list,
/// matching Dad-frontend/src/components/dashboard-v2/DateRangeDropdown.tsx's
/// preset list (All Time / This Month / Last Month / Custom Range) — a
/// dropdown/list, not a wheel, since that's what the web reference actually
/// looks like and what was asked for here.
///
/// Returns the newly picked range, or [selected] unchanged if dismissed
/// without picking anything (including backing out of the custom-range
/// calendar without confirming).
///
/// [presets] narrows which options show — e.g. the Lead Health screens
/// (Unattended/No Activity Leads) deliberately don't offer "All Time"
/// (per what was actually asked for there: This Month/Last Month/Custom
/// only), unlike Dashboard/Reports which default to showing all 4.
Future<DashboardDateRange> showDashboardDateRangeFilterSheet(
  BuildContext context, {
  required DashboardDateRange selected,
  List<DashboardRangePeriod> presets = const [
    DashboardRangePeriod.allTime,
    DashboardRangePeriod.thisMonth,
    DashboardRangePeriod.lastMonth,
    DashboardRangePeriod.custom,
  ],
}) async {
  final result = await showModalBottomSheet<DashboardDateRange>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) => _DateRangeFilterSheet(selected: selected, presets: presets),
  );
  return result ?? selected;
}

class _PresetOption {
  const _PresetOption(this.period, this.label, this.icon);
  final DashboardRangePeriod period;
  final String label;
  final IconData icon;
}

const _allPresets = [
  _PresetOption(DashboardRangePeriod.allTime, 'All Time', Icons.all_inclusive),
  _PresetOption(DashboardRangePeriod.thisMonth, 'This Month', Icons.calendar_view_month_outlined),
  _PresetOption(DashboardRangePeriod.lastMonth, 'Last Month', Icons.calendar_month_outlined),
  _PresetOption(DashboardRangePeriod.custom, 'Custom Range', Icons.date_range_outlined),
];

class _DateRangeFilterSheet extends StatelessWidget {
  const _DateRangeFilterSheet({required this.selected, required this.presets});

  final DashboardDateRange selected;
  final List<DashboardRangePeriod> presets;

  Future<void> _handleTap(BuildContext context, _PresetOption option) async {
    if (option.period != DashboardRangePeriod.custom) {
      switch (option.period) {
        case DashboardRangePeriod.allTime:
          Navigator.pop(context, DashboardDateRange.allTime());
        case DashboardRangePeriod.thisMonth:
          Navigator.pop(context, DashboardDateRange.thisMonth());
        case DashboardRangePeriod.lastMonth:
          Navigator.pop(context, DashboardDateRange.lastMonth());
        case DashboardRangePeriod.custom:
          break; // unreachable, handled below
      }
      return;
    }

    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
      initialDateRange: selected.period == DashboardRangePeriod.custom
          ? DateTimeRange(start: selected.startDate!, end: selected.endDate!)
          : null,
    );
    if (picked == null) return; // user backed out — leave the sheet open on its current state
    if (!context.mounted) return;
    Navigator.pop(context, DashboardDateRange.custom(picked.start, picked.end));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Filter by date', style: theme.textTheme.titleSmall),
              ),
            ),
            const SizedBox(height: 4),
            for (final option in _allPresets.where((p) => presets.contains(p.period)))
              ListTile(
                dense: true,
                leading: Icon(option.icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
                title: Text(option.label),
                trailing: selected.period == option.period
                    ? Icon(Icons.check, size: 18, color: theme.colorScheme.primary)
                    : null,
                onTap: () => _handleTap(context, option),
              ),
          ],
        ),
      ),
    );
  }
}
