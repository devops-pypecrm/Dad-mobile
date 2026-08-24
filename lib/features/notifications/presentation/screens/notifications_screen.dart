import 'package:flutter/material.dart';

import '../widgets/notifications_panel_content.dart';

/// Full-page version of the notifications UI, reachable at `/notifications`
/// (e.g. deep links). The bell in [GlobalAppBar] no longer navigates here —
/// it opens [NotificationPanel] as an in-place sliding tray instead — but
/// this route stays valid as a standalone destination, sharing the exact
/// same list/filter implementation via [NotificationsPanelContent].
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const NotificationsPanelContent(),
    );
  }
}
