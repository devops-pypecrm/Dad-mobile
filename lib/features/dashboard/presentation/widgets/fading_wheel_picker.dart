import 'package:flutter/material.dart';

import '../../domain/branch.dart';

const _itemExtent = 44.0;
const _visibleItems = 5; // 2 above + center + 2 below

/// Wraps a popup's result so a barrier-dismiss (`Navigator.pop` with no
/// value → plain `null`) can be told apart from an explicit selection that
/// happens to itself be `null` (e.g. "All Branches"/"All Time") — both
/// would otherwise collapse to the same raw `null` from `showDialog`.
class _WheelResult<T> {
  const _WheelResult(this.value);
  final T value;
}

/// A single vertically-scrolling wheel column: the centered item reads as
/// active (bold, full size/opacity), items further from center shrink and
/// fade out, and a top/bottom gradient blends the ends into the popup's own
/// background — no border/outline anywhere. Replaces plain `DropdownButton`
/// menus with this "scroll to the branch/month you want, centered item is
/// the active one" picker feel.
class FadingWheel extends StatefulWidget {
  const FadingWheel({
    super.key,
    required this.itemCount,
    required this.itemLabel,
    required this.initialIndex,
    required this.onChanged,
    this.width,
  });

  final int itemCount;
  final String Function(int index) itemLabel;
  final int initialIndex;
  final ValueChanged<int> onChanged;
  final double? width;

  @override
  State<FadingWheel> createState() => _FadingWheelState();
}

class _FadingWheelState extends State<FadingWheel> {
  late final FixedExtentScrollController _controller;
  double _fractionalIndex = 0;

  @override
  void initState() {
    super.initState();
    _fractionalIndex = widget.initialIndex.toDouble();
    _controller = FixedExtentScrollController(initialItem: widget.initialIndex);
    _controller.addListener(_onScroll);
  }

  // FixedExtentScrollController's `pixels` is exactly `index * itemExtent`
  // (see FixedExtentScrollController docs) — dividing back out gives a
  // continuous fractional "current center index" that updates smoothly
  // mid-drag, not just once per discrete item snap.
  void _onScroll() {
    if (!_controller.hasClients) return;
    setState(() => _fractionalIndex = _controller.position.pixels / _itemExtent);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = theme.colorScheme.surface;

    return SizedBox(
      width: widget.width,
      height: _itemExtent * _visibleItems,
      child: Stack(
        children: [
          ListWheelScrollView.useDelegate(
            controller: _controller,
            itemExtent: _itemExtent,
            diameterRatio: 1.9,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: widget.onChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.itemCount,
              builder: (context, index) {
                final distance = (index - _fractionalIndex).abs();
                final opacity = (1 - distance * 0.4).clamp(0.12, 1.0);
                final isActive = distance < 0.5;
                return Center(
                  child: Opacity(
                    opacity: opacity,
                    child: Text(
                      widget.itemLabel(index),
                      style: TextStyle(
                        fontSize: isActive ? 17 : 15,
                        fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                        color: isActive ? Colors.black : theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
          // Edge fades — blend the top/bottom couple of items into the
          // popup's own background instead of a hard clip line.
          IgnorePointer(
            child: Column(
              children: [
                Container(
                  height: _itemExtent * 1.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [bg, bg.withValues(alpha: 0)],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: _itemExtent * 1.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [bg, bg.withValues(alpha: 0)],
                    ),
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

/// Popup's outer box: rounded corners + a soft shadow for depth, but
/// deliberately no `border:`/outline — matches "no border, just the
/// gradient fade" for the wheel(s) it wraps.
class _PopupShell extends StatelessWidget {
  const _PopupShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 30, offset: const Offset(0, 10)),
          ],
        ),
        child: child,
      ),
    );
  }
}

/// Light highlight band across the active row, behind the wheel(s)' text —
/// reinforces which row is "the" selected one when there's more than one
/// wheel side by side (month + year).
Widget _activeRowHighlight(BuildContext context) {
  return IgnorePointer(
    child: Center(
      child: Container(
        height: _itemExtent,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

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

  final result = await showDialog<_WheelResult<String?>>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.25),
    builder: (dialogContext) => _PopupShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Branch', style: Theme.of(dialogContext).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              _activeRowHighlight(dialogContext),
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
            onPressed: () => Navigator.pop(dialogContext, _WheelResult<String?>(ids[current])),
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
  // `_WheelResult` exists to avoid.
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
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
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

  final result = await showDialog<_WheelResult<String?>>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.25),
    builder: (dialogContext) => StatefulBuilder(
      builder: (dialogContext, setDialogState) => _PopupShell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Month', style: Theme.of(dialogContext).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Opacity(
              opacity: allTime ? 0.35 : 1,
              child: IgnorePointer(
                ignoring: allTime,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _activeRowHighlight(dialogContext),
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
                _WheelResult<String?>(
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
  // `_WheelResult` exists to avoid.
  if (result == null) return selected;
  return result.value;
}
