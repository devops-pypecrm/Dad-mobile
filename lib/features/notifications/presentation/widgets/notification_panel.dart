import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/notification_panel_provider.dart';
import 'notifications_panel_content.dart';

/// The bell's notification tray — rises up from the bottom of the screen,
/// stopping just below the AppBar, as an overlay above whichever tab screen
/// is currently showing — and above the floating bottom nav bar too, since
/// it's placed as a sibling of the whole Scaffold in `AppShell`'s outer
/// Stack, not nested inside `body` (a Scaffold always composites
/// `bottomNavigationBar` above `body`, so nesting in `body` left the panel
/// showing underneath the nav bar). Hosted once, not duplicated per tab
/// screen, so it's correct no matter which of the 5 tabs is active when the
/// bell is tapped — same reasoning as `AppDrawer` living on the outer shell.
class NotificationPanel extends ConsumerWidget {
  const NotificationPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(notificationPanelOpenProvider);
    final media = MediaQuery.of(context);
    final topOffset = media.padding.top + kToolbarHeight;
    // Goes all the way down to the true bottom of the screen — safe to do
    // now that this panel paints above the nav bar rather than under it.
    final panelHeight = (media.size.height - topOffset) * 0.8;
    final closedBottom = -(panelHeight + 40);

    // Closed: fully non-interactive so the screen underneath behaves
    // completely normally — this whole overlay effectively doesn't exist
    // until opened.
    return IgnorePointer(
      ignoring: !isOpen,
      child: Stack(
        children: [
          Positioned.fill(
            top: topOffset,
            child: AnimatedOpacity(
              opacity: isOpen ? 1 : 0,
              duration: const Duration(milliseconds: 250),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => ref.read(notificationPanelOpenProvider.notifier).close(),
                child: Container(color: Colors.black.withValues(alpha: 0.35)),
              ),
            ),
          ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            height: panelHeight,
            bottom: isOpen ? 0 : closedBottom,
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeOutCubic,
            child: Material(
              color: Theme.of(context).colorScheme.surface,
              elevation: 16,
              shadowColor: Colors.black.withValues(alpha: 0.3),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              clipBehavior: Clip.antiAlias,
              // Panel now reaches the true screen bottom (see above), so its
              // own content needs to clear the device's home-indicator/
              // gesture-bar inset itself.
              child: const SafeArea(top: false, child: NotificationsPanelContent()),
            ),
          ),
        ],
      ),
    );
  }
}
