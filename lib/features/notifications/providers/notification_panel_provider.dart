import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_panel_provider.g.dart';

/// Whether the notification tray (opened from the bell in [GlobalAppBar]) is
/// currently expanded. `keepAlive` and shared app-wide (not per-screen
/// state) so the tray, the AppBar's icon-fade/morph, and the bell itself all
/// stay in lockstep regardless of which of the 5 tab screens is active —
/// there's exactly one bell/tray pair live at a time, hosted once in
/// `AppShell`, not duplicated per screen.
@Riverpod(keepAlive: true)
class NotificationPanelOpen extends _$NotificationPanelOpen {
  @override
  bool build() => false;

  void toggle() => state = !state;

  void close() => state = false;
}
