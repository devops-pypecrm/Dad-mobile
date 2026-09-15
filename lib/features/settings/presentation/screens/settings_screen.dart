import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/role_utils.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../calls/presentation/screens/call_recording_settings_screen.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_row.dart';

/// Restyled to a profile-header + grouped colored-icon-tile pattern
/// (avatar/name up top, then card-grouped rows with a tinted icon, bold
/// title, and a one-line description of what's inside) instead of the
/// previous bare `ListTile` list. Every row here links to a screen backed
/// by a real, already-existing capability — "Account" and "Notifications"
/// are the two newly wired ones (via `PUT /api/profile`); nothing here is
/// a placeholder for a feature that doesn't actually exist yet.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final isAdmin = isAdminRole(session?.role);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: session == null
          ? const SizedBox.shrink()
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              children: [
                ProfileHeader(session: session),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.person_outline,
                      iconColor: const Color(0xFF3B82F6),
                      title: 'Account',
                      subtitle: 'Name, phone, position, photo',
                      onTap: () => context.push(AppRoutes.account),
                    ),
                    SettingsRow(
                      icon: Icons.switch_account_outlined,
                      iconColor: const Color(0xFF8B5CF6),
                      title: 'Manage Accounts',
                      subtitle: 'Add, switch, or remove logged-in accounts',
                      onTap: () => context.push(AppRoutes.accountSwitcher),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.shield_outlined,
                      iconColor: const Color(0xFF22C55E),
                      title: 'Privacy & Security',
                      subtitle: 'Change your password',
                      onTap: () => context.push(AppRoutes.security),
                    ),
                    SettingsRow(
                      icon: Icons.devices_outlined,
                      iconColor: const Color(0xFF0EA5E9),
                      title: 'Devices',
                      subtitle: 'See where your account is logged in',
                      onTap: () => context.push(AppRoutes.devices),
                    ),
                    SettingsRow(
                      icon: Icons.notifications_outlined,
                      iconColor: const Color(0xFFEF4444),
                      title: 'Notifications',
                      subtitle: 'Push, email, and WhatsApp alerts',
                      onTap: () => context.push(AppRoutes.notificationsSettings),
                    ),
                    if (isAdmin)
                      SettingsRow(
                        icon: Icons.mic_outlined,
                        iconColor: const Color(0xFFF97316),
                        title: 'Call Recording',
                        subtitle: "Your organisation's recording policy",
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CallRecordingSettingsScreen()),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.system_update_outlined,
                      iconColor: const Color(0xFF06B6D4),
                      title: 'Updates',
                      subtitle: 'Check for the latest app version',
                      onTap: () => context.push(AppRoutes.updates),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
