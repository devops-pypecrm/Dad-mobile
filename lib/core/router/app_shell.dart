import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/app_updates/presentation/widgets/update_checker.dart';
import '../../features/notifications/presentation/widgets/notification_panel.dart';
import '../widgets/app_drawer.dart';
import '../widgets/curved_nav_bar/curved_navigation_bar.dart';
import 'app_router.dart';

/// Bar fill + selected-tab text/icon color (`#79BC46`) — a fixed brand
/// color, not theme-derived, per explicit request. Kept as a named
/// constant so `_NavItem`'s "contrast against the white circle" color
/// stays in sync with the bar automatically if this ever changes.
const _navBarColor = Color(0xFF578732);

/// A blanket floor here (tried and reverted — see git history) forced a
/// visible dead gap under the bar on any device correctly reporting a
/// near-zero inset (plain gesture mode with nothing to clear, or no system
/// nav bar at all), since there's no way to distinguish that from an OEM
/// under-reporting a real gesture pill using the inset value alone. Trusting
/// the reported value directly is the correct default; if a specific device
/// is confirmed to under-report, that needs a targeted fix, not a global one
/// that visibly breaks every correctly-reporting device in exchange.
double _bottomMarginFor(double reportedInset) =>
    reportedInset > 8 ? reportedInset + 4 : 8.0;

/// Identifies the ONE persistent outer Scaffold (this shell) across the
/// whole tab-navigation lifetime, so [ProfileMenuButton] can open its drawer
/// directly rather than via `Scaffold.of(context)` — which, called from
/// inside a tab screen's own AppBar, would resolve to that tab's own nested
/// Scaffold instead (see the drawer-ownership note on `AppShell` below).
final appShellScaffoldKey = GlobalKey<ScaffoldState>();

/// Bottom-nav shell for the five primary tabs (Search sits center, per web
/// parity with GlobalSearch.tsx being always-available). Detail/create/
/// check-in flows (plus Opportunities and Accounts — demoted from tabs to
/// keep this bar to 5 items) are pushed as regular routes on top of this
/// shell, not nested inside it.
///
/// Uses `curved_navigation_bar` for the "selected tab rises into a circle
/// that slides to wherever you tap" animation — every one of the 5 real
/// tabs can become that circle, not a single fixed center action button
/// like a typical shop-app reference screenshot (Home/Search/Cart/Profile
/// + a static center button) shows. Building an equivalent notch-morph
/// animation by hand (custom `Path`/`ClipPath` + `AnimationController`)
/// would just be re-implementing what this well-maintained package already
/// does — not worth the risk of a hand-rolled version looking janky.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child, required this.location});

  final Widget child;
  final String location;

  static const _tabs = [
    (route: AppRoutes.home, icon: Icons.dashboard_outlined, label: 'Dashboard'),
    (route: AppRoutes.leads, icon: Icons.people_outline, label: 'Leads'),
    (route: AppRoutes.search, icon: Icons.search, label: 'Search'),
    (route: AppRoutes.followups, icon: Icons.checklist, label: 'Follow Ups'),
    (
      route: AppRoutes.reports,
      icon: Icons.bar_chart_outlined,
      label: 'Reports',
    ),
  ];

  int get _currentIndex {
    final index = _tabs.indexWhere((tab) => location.startsWith(tab.route));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex;

    // NotificationPanel is a sibling of the Scaffold, not nested inside it
    // (was `body: Stack(children: [child, NotificationPanel()])`, which put
    // it below `bottomNavigationBar` in paint order — a Scaffold always
    // composites `bottomNavigationBar` above `body`, same reason the drawer
    // moved out to this level earlier). Painting it in this OUTER Stack,
    // after the whole Scaffold, puts it above literally everything the
    // Scaffold draws, floating nav bar included.
    return Stack(
      children: [
        _buildScaffold(context, currentIndex),
        const NotificationPanel(),
        const UpdateChecker(),
      ],
    );
  }

  Widget _buildScaffold(BuildContext context, int currentIndex) {
    return Scaffold(
      key: appShellScaffoldKey,
      // The drawer lives HERE, on the outer shell, not on each tab screen's
      // own inner Scaffold (they used to each set their own `drawer:`,
      // removed — see those screens' history). A `Drawer` set on an inner
      // Scaffold nests inside this Scaffold's own `body` slot, so from this
      // Scaffold's point of view it's just body content — meaning this
      // Scaffold's `bottomNavigationBar` (which paints above `body` by
      // design) would always render on top of it, showing the floating nav
      // bar layered over the bottom of the open drawer. Owning the drawer
      // here instead puts it in this Scaffold's own drawer layer, which
      // Flutter paints above `bottomNavigationBar`, fixing that stacking
      // order for good instead of patching around it per-screen.
      drawer: const AppDrawer(),
      // Required: the package's floating circle deliberately paints above
      // its own bounding box (negative-offset `Positioned` + `Clip.none`,
      // confirmed by reading curved_navigation_bar's actual source in the
      // pub cache) — that overflow IS the rise/warp animation. Without
      // `extendBody`, Scaffold clips its `bottomNavigationBar` slot to its
      // own bounds and silently cuts that part off, which is exactly what
      // was happening: the circle popped in flat with no curve, no warp,
      // because the animated part was invisible, not because it wasn't
      // running.
      extendBody: true,
      body: child,
      // The package does its own fixed-pixel positioning internally (see
      // curved_navigation_bar's source — no SafeArea awareness at all), so
      // with `extendBody: true` the device's bottom safe-area inset
      // (gesture-bar/home-indicator space) was leaking in as extra blank
      // padding below the icon row that had no equivalent above it.
      // Stripping that inherited bottom padding here — rather than shrinking
      // the bar's own `height` — avoids the package's other footgun: its
      // items are laid out at a fixed pixel offset tied to a hardcoded 75.0
      // internally, so reducing `height` below 75 clips the bottom of the
      // icons/labels instead of just tightening the gap.
      bottomNavigationBar: Builder(
        builder: (context) {
          // Gesture navigation reports a small inset (~12-24px) for the thin
          // translucent home-indicator pill our floating bar can safely
          // overlap with just a little breathing room. 3-button navigation
          // reports a much larger inset (~48px) for an *opaque*, non-overlay
          // system bar. Trust the real reported inset (+4px buffer) in both
          // cases — only fall back to a floor when the report itself looks
          // broken (≤8px), and even then only force the larger OEM-bug floor
          // on Android; everywhere else (web/desktop) a plain 8px margin is
          // correct since there's genuinely no system chrome to clear. See
          // `_bottomMarginFor`'s doc comment.
          final bottomMargin = _bottomMarginFor(
            MediaQuery.paddingOf(context).bottom,
          );
          return MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            // Floats the bar as an inset rounded box (margin on both sides +
            // bottom) instead of a flush, edge-to-edge strip. Plain `Padding`
            // (no clip), so it doesn't interfere with the circle's rise
            // animation, which still overflows above this box via `Clip.none`
            // inside the vendored widget itself.
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, bottomMargin),
              child: CurvedNavigationBar(
                index: currentIndex,
                // Bar fill is white; the floating circle is the fixed brand
                // purple. `backgroundColor` stays transparent (real content shows
                // through the notch corners as you scroll) — the bar no longer
                // depends on a color-contrast trick to read against that
                // transparent backdrop because `barElevation` below gives the
                // curved shape itself a drop shadow, drawn on its own path via
                // `canvas.drawShadow` (see the vendored painter's file header).
                color: Colors.white,
                buttonBackgroundColor: _navBarColor,
                backgroundColor: Colors.transparent,
                // Rounds all 4 corners of the bar itself (see the vendored
                // painter's file header) so it reads as a floating rounded box
                // rather than a sharp-cornered rectangle.
                cornerRadius: 28,
                // Shadow on the bar's curved shape (notch included), so it reads
                // as raised above whatever scrolls behind it.
                barElevation: 8,
                barShadowColor: Colors.black.withValues(alpha: 0.25),
                // Separate drop shadow on the circle alone (see the vendored
                // widget's file header for why this needed a fork).
                buttonElevation: 6,
                buttonShadowColor: Colors.black.withValues(alpha: 0.35),
                animationDuration: const Duration(milliseconds: 400),
                animationCurve: Curves.easeOutCubic,
                onTap: (index) => context.go(_tabs[index].route),
                items: [
                  for (var i = 0; i < _tabs.length; i++)
                    _NavItem(tab: _tabs[i], selected: i == currentIndex),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// The tab currently risen into the curved bar's floating circle shows just
/// a plain icon (white, to contrast against the now-purple circle) — no
/// room for a label once it's lifted, same as the reference screenshot's
/// center button has none. Every other tab shows a small purple icon +
/// label (purple to read against the bar's white fill) so all 5
/// destinations stay identifiable at a glance, not just whichever one
/// happens to be active.
class _NavItem extends StatelessWidget {
  const _NavItem({required this.tab, required this.selected});

  final ({String route, IconData icon, String label}) tab;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Icon(tab.icon, color: Colors.white, size: 26);
    }

    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(tab.icon, color: _navBarColor, size: 22),
        const SizedBox(height: 2),
        Text(
          tab.label,
          style: theme.textTheme.labelSmall?.copyWith(color: _navBarColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
