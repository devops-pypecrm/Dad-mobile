import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/providers/session_provider.dart';
import '../router/app_router.dart';
import '../utils/role_utils.dart';

/// Brand purple — matches the nav bar/login button/greeting card, used here
/// instead of `theme.colorScheme.primary` (a Material3-seeded blue, not
/// this brand color).
const _brandPurple = Color(0xFF5B21B6);

/// Grouped app-wide navigation drawer. Reference structure only, not a
/// literal port, from Dad-frontend/src/components/shared/Sidebar.tsx's
/// `menuGroups` — that sidebar has ~9 groups covering the whole web app
/// (Marketing, Field Force, System/Settings, super-admin tools, etc.);
/// this is trimmed to the 4 groups covering features that actually exist
/// in this Flutter app today: Overview, Sales Engine, Connect, Productivity.
/// Owned by the outer `AppShell` Scaffold (see `drawer:` there), not by each
/// individual tab screen — see that file for why.
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final canSeeReEnquiries = isManagerRole(session?.role);

    void goTab(String route) {
      Navigator.of(context).pop();
      context.go(route);
    }

    void push(String route) {
      Navigator.of(context).pop();
      context.push(route);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: _brandPurple),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Tinted white (the source PNG's ring is black and its
                    // arrow is brand purple) so it reads clearly against
                    // this same purple header background instead of the
                    // arrow disappearing into it.
                    Image.asset(
                      'assets/images/app_logo.png',
                      height: 36,
                      color: Colors.white,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'PypeCRM',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    if (session != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${session.firstName} ${session.lastName}',
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            _SectionLabel('Overview'),
            _DrawerItem(
              icon: Icons.dashboard_outlined,
              label: 'Dashboard',
              onTap: () => goTab(AppRoutes.home),
            ),
            _SectionLabel('Sales Engine'),
            _DrawerItem(
              icon: Icons.people_outline,
              label: 'Leads',
              onTap: () => goTab(AppRoutes.leads),
            ),
            _DrawerItem(
              icon: Icons.trending_up,
              label: 'Opportunities',
              onTap: () => push(AppRoutes.opportunities),
            ),
            _DrawerItem(
              icon: Icons.inventory_2_outlined,
              label: 'Products',
              onTap: () => push(AppRoutes.products),
            ),
            _DrawerItem(
              icon: Icons.credit_card_outlined,
              label: 'EMI Schedules',
              onTap: () => push(AppRoutes.payments),
            ),
            _DrawerItem(
              icon: Icons.emoji_events_outlined,
              label: 'Sales Target',
              onTap: () => push(AppRoutes.targets),
            ),
            if (canSeeReEnquiries)
              _DrawerItem(
                icon: Icons.autorenew,
                label: 'Re-Enquiries',
                onTap: () => push(AppRoutes.reEnquiries),
              ),
            _SectionLabel('Connect'),
            _DrawerItem(
              icon: Icons.call_outlined,
              label: 'Call Logs',
              onTap: () => push(AppRoutes.calls),
            ),
            _SectionLabel('Productivity'),
            _DrawerItem(
              icon: Icons.checklist,
              label: 'Follow Ups',
              onTap: () => goTab(AppRoutes.followups),
            ),
            _DrawerItem(
              icon: Icons.bar_chart_outlined,
              label: 'Reports',
              onTap: () => goTab(AppRoutes.reports),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        label.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: _brandPurple,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      dense: true,
      onTap: onTap,
    );
  }
}
