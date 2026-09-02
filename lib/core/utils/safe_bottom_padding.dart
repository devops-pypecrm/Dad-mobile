import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Some OEM Android skins (Color OS/Oppo, MIUI, One UI) under-report the
/// gesture-nav bottom inset to Flutter's `MediaQuery` — the actual on-screen
/// gesture pill is taller than the value the OS hands back, so trusting that
/// number alone (via `SafeArea`/`MediaQuery.paddingOf` directly) leaves
/// bottom-pinned buttons sitting under the real gesture area on those
/// devices, even though the layout math is internally consistent. This is a
/// hard floor UNDER the reported value, not on top of it — affected OEMs get
/// real clearance regardless of what they report, while devices that report
/// accurately (stock/Pixel/Samsung) are unaffected since their real inset
/// already exceeds it.
///
/// Use for any standalone-route bottom sheet or scroll-ending action button
/// that isn't nested inside `AppShell` (which has its own, taller floor for
/// clearing the custom floating nav bar — see `_minBottomClearance` in
/// `app_shell.dart`).
double safeBottomInset(BuildContext context, {double floor = 24}) {
  return math.max(MediaQuery.paddingOf(context).bottom, floor);
}

/// Bottom padding for a modal sheet's trailing action button: prioritizes
/// keyboard clearance when the keyboard is open (`viewInsets`, which is
/// reliably reported — no OEM quirk there), otherwise falls back to
/// [safeBottomInset] so the button clears the system nav bar once the
/// keyboard is dismissed. `extra` is the visual breathing room above
/// whichever inset applies.
double sheetBottomPadding(
  BuildContext context, {
  double extra = 16,
  double floor = 24,
}) {
  final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
  if (keyboardInset > 0) return keyboardInset + extra;
  return safeBottomInset(context, floor: floor) + extra;
}
