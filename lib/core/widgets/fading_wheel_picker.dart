import 'package:flutter/material.dart';

const _itemExtent = 44.0;
const _visibleItems = 5; // 2 above + center + 2 below

/// Wraps a popup's result so a barrier-dismiss (`Navigator.pop` with no
/// value → plain `null`) can be told apart from an explicit selection that
/// happens to itself be `null` (e.g. "All Branches"/"All Time"), or (for
/// [showWheelSelectPopup]) index `0` — both would otherwise collapse to the
/// same falsy value via `??`.
class WheelResult<T> {
  const WheelResult(this.value);
  final T value;
}

/// A single vertically-scrolling wheel column: the centered item reads as
/// active (bold, full size/opacity), items further from center shrink and
/// fade out, and a top/bottom gradient blends the ends into the popup's own
/// background — no border/outline anywhere. Originally built for the
/// Dashboard's Branch/Month filters (`showBranchPickerPopup`/
/// `showMonthYearPickerPopup`, which still own their own dialog layout —
/// two wheels side by side, an "All Time" shortcut) and extracted here so
/// other single-value pickers (e.g. the Lead Detail status picker via
/// [showWheelSelectPopup]) get the same "scroll to the value you want,
/// centered item is the active one" feel instead of reimplementing it.
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
    setState(
      () => _fractionalIndex = _controller.position.pixels / _itemExtent,
    );
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
                        fontWeight: isActive
                            ? FontWeight.w700
                            : FontWeight.w400,
                        color: isActive
                            ? Colors.black
                            : theme.colorScheme.onSurfaceVariant,
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
class WheelPopupShell extends StatelessWidget {
  const WheelPopupShell({super.key, required this.child});

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
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.18),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
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
Widget wheelActiveRowHighlight(BuildContext context) {
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

/// A single-wheel version of the Dashboard's Branch/Month center-popup
/// pattern — one labeled list of `String` values, scrolled to [initialIndex]
/// so the current selection starts centered/active rather than requiring a
/// scroll from the top, confirmed with a "Done" button. Returns the picked
/// index, or [initialIndex] unchanged if dismissed without confirming (same
/// dismiss-vs-explicit-choice handling as the Dashboard pickers, via
/// [WheelResult] rather than a bare nullable return).
Future<int> showWheelSelectPopup(
  BuildContext context, {
  required String title,
  required List<String> items,
  required int initialIndex,
  Color? accentColor,
}) async {
  var current = initialIndex;

  final result = await showDialog<WheelResult<int>>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.25),
    builder: (dialogContext) => WheelPopupShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
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
                itemCount: items.length,
                itemLabel: (i) => items[i],
                initialIndex: initialIndex,
                onChanged: (i) => current = i,
                width: 260,
              ),
            ],
          ),
          TextButton(
            style: accentColor != null
                ? TextButton.styleFrom(foregroundColor: accentColor)
                : null,
            onPressed: () =>
                Navigator.pop(dialogContext, WheelResult<int>(current)),
            child: const Text('Done'),
          ),
        ],
      ),
    ),
  );

  if (result == null) return initialIndex;
  return result.value;
}
