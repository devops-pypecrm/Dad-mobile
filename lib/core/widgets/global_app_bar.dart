import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/providers/session_provider.dart';
import '../../features/notifications/presentation/widgets/notification_bell_button.dart';
import '../../features/notifications/providers/notification_panel_provider.dart';
import '../router/app_router.dart';
import 'profile_menu_button.dart';

/// The one top bar shape used on every tab-root screen (Dashboard, Leads,
/// Follow Ups, Search, Reports) — same leading avatar, same Accounts/
/// Notifications/Logout actions, same black title style everywhere. Only
/// `title` changes per screen. Whatever a screen used to keep in its own
/// AppBar (search field, sort/filter buttons, tab bar, "Show All") now lives
/// in that screen's body as its own section instead — this bar carries no
/// screen-specific controls anymore.
///
/// While the notification tray ([NotificationPanel]) is open, this bar
/// reflects that: the profile avatar and the title crossfade/shift, the
/// Accounts and Logout actions shrink+fade away (`_CollapsingAction`), and —
/// as a direct consequence of vacated space rather than anything explicitly
/// repositioning either one — the title slides to the true left edge and
/// the bell (stays put in the actions list, see below) ends up flush
/// against the right edge, once their respective neighbors are gone.
class GlobalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPanelOpen = ref.watch(notificationPanelOpenProvider);

    return AppBar(
      // The avatar moves from AppBar's dedicated `leading` slot into the
      // `title` widget itself, as the first item of a Row alongside the
      // text — `leading` is a fixed-width layout slot Flutter doesn't
      // reflow when its content shrinks, so collapsing it there left the
      // title sitting in place with a dead gap on its left. Folding it into
      // `title`'s own Row lets the same `_CollapsingAction` reflow trick
      // used for the trailing actions apply here too: title text slides
      // left as the avatar's width collapses to zero, rather than a static
      // gap being left behind.
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      // Without this, `AppBar` centers `title` on platforms where
      // `centerTitle` defaults to true (iOS-style) — since `title` is our
      // own Row now instead of a plain string, that centered the whole
      // Row (and, once the avatar collapses, the now-narrower Text within
      // it) in the middle of the toolbar rather than pinning it to the
      // true left edge like the rest of this bar's layout expects.
      centerTitle: false,
      title: Row(
        children: [
          _CollapsingAction(collapsed: isPanelOpen, child: const ProfileMenuButton()),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                isPanelOpen ? 'Notifications' : title,
                key: ValueKey(isPanelOpen),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      // Applies to every action Icon below (none of them set their own
      // color) via the ambient IconTheme, so Accounts/Notifications/Logout
      // all render pure black instead of the AppBar's Material3 default
      // (theme.colorScheme.onSurface, a dark grey, not true black).
      iconTheme: const IconThemeData(color: Colors.black),
      actionsIconTheme: const IconThemeData(color: Colors.black),
      actions: [
        _CollapsingAction(
          collapsed: isPanelOpen,
          child: IconButton(
            icon: const Icon(Icons.apartment_outlined),
            tooltip: 'Accounts',
            onPressed: () => context.push(AppRoutes.accounts),
          ),
        ),
        // Stays in place (not wrapped in _CollapsingAction) — its neighbors
        // vacating around it is what reads as it "moving" to the edge.
        const NotificationBellButton(),
        _CollapsingAction(
          collapsed: isPanelOpen,
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(sessionControllerProvider.notifier).logout(),
          ),
        ),
      ],
    );
  }
}

/// Shrinks its child to zero size while fading it out (and the reverse),
/// via `AnimatedSize` + `AnimatedOpacity` — used both for the profile
/// avatar (in `title`'s Row) and the Accounts/Logout actions, so their
/// neighbors (the title text; the bell) visually slide over to fill the
/// vacated space purely from Flutter's own layout reflow — no explicit
/// position animation needed on either of those neighbors themselves.
class _CollapsingAction extends StatelessWidget {
  const _CollapsingAction({required this.collapsed, required this.child});

  final bool collapsed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 180),
          opacity: collapsed ? 0 : 1,
          child: collapsed ? const SizedBox.shrink() : child,
        ),
      ),
    );
  }
}
