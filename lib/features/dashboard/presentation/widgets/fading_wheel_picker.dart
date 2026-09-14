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

// The month+year wheel picker that used to live here has been replaced by
// showDashboardDateRangeFilterSheet (date_range_filter_sheet.dart) — a plain
// option list (All Time / This Month / Last Month / Custom Range) matching
// Dad-frontend's current DateRangeDropdown, not a scroll wheel.
