import 'package:flutter/material.dart';

/// Forces a rebuild on every `didChangeMetrics` callback (keyboard
/// show/hide, rotation, etc.) as a safety net on top of Flutter's own
/// automatic `MediaQuery`-driven resize.
///
/// Why this exists: on lower-end or momentarily laggy devices, the final
/// `didChangeMetrics` callback in a fast open-then-close keyboard sequence
/// can arrive late or get coalesced with an earlier one by the engine under
/// frame pressure. Flutter's `Scaffold` only resizes `body` in response to
/// that callback actually firing and marking `MediaQuery` dependents dirty
/// — if the closing (inset-back-to-zero) callback is the one that gets
/// dropped, nothing else will trigger a relayout, so the area the keyboard
/// used to occupy stays rendered at its old (keyboard-open, shrunk) size
/// forever, showing as blank background until some unrelated rebuild
/// (navigation, scroll, orientation change) happens to fix it by accident.
/// This matches "closed the keyboard and half the page went blank, seems
/// to happen more when the phone is lagging."
///
/// Wrapping the whole app in this widget means every metrics change forces
/// a full top-level rebuild, independent of whether any individual
/// `MediaQuery.of(context)` call was already marked dirty — so even a
/// missed/delayed intermediate callback gets corrected by whichever
/// `didChangeMetrics` call *does* eventually arrive with the current,
/// accurate insets.
class KeyboardMetricsResync extends StatefulWidget {
  const KeyboardMetricsResync({super.key, required this.child});

  final Widget child;

  @override
  State<KeyboardMetricsResync> createState() => _KeyboardMetricsResyncState();
}

class _KeyboardMetricsResyncState extends State<KeyboardMetricsResync> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // Rebuilding here, rather than relying solely on MediaQuery's own
    // dependents, re-reads the *current* instantaneous inset on whichever
    // callback actually lands — so even if an earlier one in a fast
    // open/close sequence was dropped, this one self-corrects the layout.
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
