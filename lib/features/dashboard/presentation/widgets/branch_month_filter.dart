import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/branch.dart';
import '../../providers/dashboard_provider.dart';
import 'fading_wheel_picker.dart';

const _monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

/// Branch + Month filter row for the Dashboard, mirroring
/// Dad-frontend/src/pages/Dashboard.tsx:206-250's underlying filter values
/// (same `branches.length > 0` gate that hides the branch pill entirely
/// rather than showing it empty/disabled) — the picker UI itself
/// (`showBranchPickerPopup`/`showMonthYearPickerPopup`, a scrollable,
/// center-active wheel with no border, just an edge fade) is mobile-only
/// polish, not a web port; the web app just uses plain `<select>`s.
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
          const SizedBox(width: 8),
        ],
        const Expanded(child: _MonthPill()),
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

class _MonthPill extends ConsumerWidget {
  const _MonthPill();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(dashboardMonthProvider);

    String labelFor(String? month) {
      if (month == null) return 'All Time';
      final parts = month.split('-');
      return '${_monthNames[int.parse(parts[1]) - 1]} ${parts[0]}';
    }

    return _Pill(
      icon: Icons.calendar_today_outlined,
      label: labelFor(selected),
      onTap: () async {
        final picked = await showMonthYearPickerPopup(context, selected: selected);
        ref.read(dashboardMonthProvider.notifier).state = picked;
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
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 8),
            Expanded(
              child: Text(label, overflow: TextOverflow.ellipsis, maxLines: 1, style: theme.textTheme.bodyMedium),
            ),
            Icon(Icons.keyboard_arrow_down, size: 18, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
