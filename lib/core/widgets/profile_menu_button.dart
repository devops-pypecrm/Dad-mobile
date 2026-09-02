import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/providers/session_provider.dart';
import '../router/app_shell.dart';

/// Brand purple — matches the nav bar/login button/greeting card/drawer
/// header, used here instead of `theme.colorScheme.primary` (a Material3-
/// seeded blue, not this brand color).
const _brandColor = Color(0xFF578732);

/// Drop-in replacement for the AppBar's auto-generated hamburger icon on
/// screens with a `Scaffold.drawer` set. There's no profile-photo upload
/// feature yet, so this shows the user's initial on a filled circle instead
/// (same fallback concept as Dad-frontend's AvatarFallback) — it still opens
/// the same drawer, just reads as "this is you" instead of a generic menu.
class ProfileMenuButton extends ConsumerWidget {
  const ProfileMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final initial = session?.initial ?? '?';

    return IconButton(
      icon: CircleAvatar(
        radius: 16,
        backgroundColor: _brandColor,
        child: Text(
          initial,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      // The drawer now lives on the outer AppShell Scaffold, not this
      // button's own nearest enclosing Scaffold (each tab screen's own),
      // so `Scaffold.of(context).openDrawer()` would open the wrong one
      // (and no-op, since the inner Scaffold no longer has a drawer at
      // all) — go straight through the shell's key instead.
      onPressed: () => appShellScaffoldKey.currentState?.openDrawer(),
    );
  }
}
