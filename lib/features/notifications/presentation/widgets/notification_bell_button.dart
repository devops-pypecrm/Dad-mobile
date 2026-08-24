import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/notification_panel_provider.dart';
import '../../providers/notifications_controller.dart';

/// AppBar bell icon with a real unread-count badge (the web app only shows
/// a plain dot on its popover trigger — the mobile bell shows the actual
/// number since [NotificationsController] already has it, same figure the
/// web app's `/notifications` page tab badge uses).
///
/// Tapping toggles [NotificationPanel] open/closed rather than navigating —
/// the icon itself morphs bell↔close to match (see [_BellOrClose]).
class NotificationBellButton extends ConsumerWidget {
  const NotificationBellButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadCount = ref.watch(notificationsControllerProvider).valueOrNull?.unreadCount ?? 0;
    final isPanelOpen = ref.watch(notificationPanelOpenProvider);

    return IconButton(
      tooltip: isPanelOpen ? 'Close notifications' : 'Notifications',
      onPressed: () => ref.read(notificationPanelOpenProvider.notifier).toggle(),
      // The badge only makes sense on the bell, not the close state.
      icon: Badge(
        isLabelVisible: !isPanelOpen && unreadCount > 0,
        label: Text(unreadCount > 9 ? '9+' : '$unreadCount'),
        child: _BellOrClose(showClose: isPanelOpen, hasUnread: unreadCount > 0),
      ),
    );
  }
}

/// Crossfades + rotates between the bell and an "X" — Flutter's built-in
/// `AnimatedIcons` set has no bell↔close pair to do a true traced
/// undraw/redraw morph (only menu↔close, arrow↔menu, play↔pause, etc. —
/// checked; none cover a bell), so this is a fade+scale+quarter-turn
/// crossfade instead. It reads as a "morph," just not a literal path trace.
class _BellOrClose extends StatelessWidget {
  const _BellOrClose({required this.showClose, required this.hasUnread});

  final bool showClose;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, animation) => RotationTransition(
        turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
        child: ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        ),
      ),
      child: Icon(
        showClose ? Icons.close : (hasUnread ? Icons.notifications : Icons.notifications_outlined),
        key: ValueKey(showClose ? 'close' : 'bell'),
      ),
    );
  }
}
