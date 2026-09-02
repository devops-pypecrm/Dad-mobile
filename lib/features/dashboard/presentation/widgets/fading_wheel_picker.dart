import 'package:flutter/material.dart';

import '../../../../core/widgets/fading_wheel_picker.dart';
import '../../domain/branch.dart';

/// Branch/Month filter popups for the Dashboard — mobile-only polish (the
/// web app just uses plain `<select>`s), built on the shared
/// `FadingWheel`/`WheelPopupShell` widgets in `core/widgets/` (a scrollable,
/// center-active wheel with no border, just an edge fade). These two
/// multi-wheel/shortcut-chip layouts stay here since they're specific to
/// this screen; the single-wheel case other pickers need (e.g. the Lead
/// Detail status picker) uses `showWheelSelectPopup` directly instead.
///
/// Shows the branch picker; returns the newly picked branch id (`null` for
/// "All Branches"), or [selected] unchanged if dismissed without confirming.
Future<String?> showBranchPickerPopup(
  BuildContext context, {
  required List<Branch> branches,
  required String? selected,
}) async {
  final ids = <String?>[null, for (final b in branches) b.id];
  final names = ['All Branches', for (final b in branches) b.name];
  final initialIndex = ids.indexOf(selected).clamp(0, ids.length - 1);
  var current = initialIndex;

  final result = await showDialog<WheelResult<String?>>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.25),
    builder: (dialogContext) => WheelPopupShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Branch',
            style: Theme.of(
              dialogContext,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              wheelActiveRowHighlight(dialogContext),
              FadingWheel(
                itemCount: names.length,
                itemLabel: (i) => names[i],
                initialIndex: initialIndex,
                onChanged: (i) => current = i,
                width: 220,
              ),
            ],
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              dialogContext,
              WheelResult<String?>(ids[current]),
            ),
            child: const Text('Done'),
          ),
        ],
      ),
    ),
  );

  // Explicit null-check on `result` itself, not `result?.value` — the
  // latter collapses "dismissed without confirming" (result == null) and
  // "explicitly picked All Branches/All Time" (result.value == null) back
  // into the same case via `??`, which is exactly the ambiguity
  // `WheelResult` exists to avoid.
  if (result == null) return selected;
  return result.value;
}

/// Shows the month+year picker (two wheels side by side, plus an "All
/// Time" shortcut); returns the newly picked `YYYY-MM` string (`null` for
/// "All Time"), or [selected] unchanged if dismissed without confirming.
Future<String?> showMonthYearPickerPopup(
  BuildContext context, {
  required String? selected,
}) async {
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final now = DateTime.now();
  final years = List.generate(6, (i) => now.year - i); // this year back 5

  int monthIndex;
  int yearIndex;
  if (selected == null) {
    monthIndex = now.month - 1;
    yearIndex = 0;
  } else {
    final parts = selected.split('-');
    monthIndex = int.parse(parts[1]) - 1;
    yearIndex = years.indexOf(int.parse(parts[0])).clamp(0, years.length - 1);
  }
  var currentMonth = monthIndex;
  var currentYear = yearIndex;
  var allTime = selected == null;

  final result = await showDialog<WheelResult<String?>>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.25),
    builder: (dialogContext) => StatefulBuilder(
      builder: (dialogContext, setDialogState) => WheelPopupShell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Month',
              style: Theme.of(
                dialogContext,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Opacity(
              opacity: allTime ? 0.35 : 1,
              child: IgnorePointer(
                ignoring: allTime,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    wheelActiveRowHighlight(dialogContext),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadingWheel(
                          itemCount: monthNames.length,
                          itemLabel: (i) => monthNames[i],
                          initialIndex: monthIndex,
                          onChanged: (i) => currentMonth = i,
                          width: 140,
                        ),
                        FadingWheel(
                          itemCount: years.length,
                          itemLabel: (i) => '${years[i]}',
                          initialIndex: yearIndex,
                          onChanged: (i) => currentYear = i,
                          width: 90,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            FilterChip(
              label: const Text('All Time'),
              selected: allTime,
              onSelected: (value) => setDialogState(() => allTime = value),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pop(
                dialogContext,
                WheelResult<String?>(
                  allTime
                      ? null
                      : '${years[currentYear].toString().padLeft(4, '0')}-'
                            '${(currentMonth + 1).toString().padLeft(2, '0')}',
                ),
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    ),
  );

  // Explicit null-check on `result` itself, not `result?.value` — the
  // latter collapses "dismissed without confirming" (result == null) and
  // "explicitly picked All Branches/All Time" (result.value == null) back
  // into the same case via `??`, which is exactly the ambiguity
  // `WheelResult` exists to avoid.
  if (result == null) return selected;
  return result.value;
}
