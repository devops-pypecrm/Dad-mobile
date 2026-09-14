import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/branch.dart';
import '../../providers/dashboard_provider.dart';
import 'date_range_filter_sheet.dart';
import 'fading_wheel_picker.dart';

/// Branch + date-range filter row for the Dashboard. The branch picker
/// stays the mobile-only wheel popup it always was (`showBranchPickerPopup`,
/// a scrollable, center-active wheel with no border, just an edge fade) —
/// only the date filter changed, from a month/year wheel to a plain preset
/// list (All Time / This Month / Last Month / Custom Range) matching
/// Dad-frontend/src/components/dashboard-v2/DateRangeDropdown.tsx, the
/// *current* web dashboard's filter (not the older single-month picker the
/// wheel used to mirror).
class BranchMonthFilter extends ConsumerWidget {
  const BranchMonthFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchesAsync = ref.watch(dashboardBranchesProvider);
    final branches = branchesAsync.valueOrNull ?? const [];

    return Row(
      children: [
        if (branches.isNotEmpty) ...[
          Expanded(child: _BranchPill(branches: branches)),
          const SizedBox(width: 6),
        ],
        const Expanded(child: _DateRangePill()),
      ],
    );
  }
}

class _BranchPill extends ConsumerWidget {
  const _BranchPill({required this.branches});

  final List<Branch> branches;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(dashboardBranchProvider);
    final matches = branches.where((b) => b.id == selected);
    final label = selected == null || matches.isEmpty ? 'All Branches' : matches.first.name;

    return _Pill(
      icon: Icons.business_outlined,
      label: label,
      onTap: () async {
        final picked = await showBranchPickerPopup(context, branches: branches, selected: selected);
        ref.read(dashboardBranchProvider.notifier).state = picked;
      },
    );
  }
}

class _DateRangePill extends ConsumerWidget {
  const _DateRangePill();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(dashboardDateRangeProvider);

    return _Pill(
      icon: Icons.calendar_today_outlined,
      label: selected.label,
      onTap: () async {
        final picked = await showDashboardDateRangeFilterSheet(context, selected: selected);
        ref.read(dashboardDateRangeProvider.notifier).state = picked;
      },
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(icon, size: 15, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 6),
            Expanded(
              child: Text(label, overflow: TextOverflow.ellipsis, maxLines: 1, style: theme.textTheme.bodyMedium),
            ),
            Icon(Icons.keyboard_arrow_down, size: 16, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
