import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_mode_provider.dart';
import '../../../../core/utils/logout_helper.dart';
import '../../../../core/utils/role_utils.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../calls/presentation/screens/call_recording_settings_screen.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_row.dart';

/// Profile-header + grouped colored-icon-tile pattern (avatar/name up top,
/// then card-grouped rows with a tinted icon, bold title, and a one-line
/// description of what's inside), each group under its own section label —
/// Account / Security / Device & Notifications / Communication / App.
/// Every row here links to a screen backed by a real, already-existing
/// capability — nothing here is a placeholder for a feature that doesn't
/// actually exist yet.
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
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                ProfileHeader(session: session),
                const SizedBox(height: 20),
                const SettingsSectionLabel('Account'),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.person_outline,
                      iconColor: const Color(0xFF9654B5),
                      title: 'Account',
                      subtitle: 'Name, phone, position, photo',
                      onTap: () => context.push(AppRoutes.account),
                    ),
                    SettingsRow(
                      icon: Icons.people_alt_outlined,
                      iconColor: const Color(0xFF9654B5),
                      solidIcon: true,
                      title: 'Manage Accounts',
                      subtitle: 'Add, switch, or remove logged-in accounts',
                      onTap: () => context.push(AppRoutes.accountSwitcher),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SettingsSectionLabel('Security'),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.shield_outlined,
                      iconColor: const Color(0xFF9654B5),
                      title: 'Privacy & Security',
                      subtitle: 'Change your password and security settings',
                      onTap: () => context.push(AppRoutes.security),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SettingsSectionLabel('Device & Notifications'),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.laptop_outlined,
                      iconColor: const Color(0xFF00A8D6),
                      title: 'Devices',
                      subtitle: 'See where your account is logged in',
                      onTap: () => context.push(AppRoutes.devices),
                    ),
                    SettingsRow(
                      icon: Icons.notifications_outlined,
                      iconColor: const Color(0xFFF5B82E),
                      title: 'Notifications',
                      subtitle: 'Push, email, and WhatsApp alerts',
                      onTap: () => context.push(AppRoutes.notificationsSettings),
                    ),
                  ],
                ),
                if (isAdmin) ...[
                  const SizedBox(height: 20),
                  const SettingsSectionLabel('Communication'),
                  SettingsGroup(
                    children: [
                      SettingsRow(
                        icon: Icons.call_outlined,
                        iconColor: const Color(0xFF9654B5),
                        title: 'Call Recording',
                        subtitle: "Your organisation's recording policy",
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CallRecordingSettingsScreen()),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                const SettingsSectionLabel('App'),
                SettingsGroup(
                  children: [
                    SettingsRow(
                      icon: Icons.file_download_outlined,
                      iconColor: const Color(0xFF00A8D6),
                      title: 'Updates',
                      subtitle: 'Check for the latest app version',
                      onTap: () => context.push(AppRoutes.updates),
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        final mode = ref.watch(appThemeModeProvider);
                        return SettingsRow(
                          icon: Icons.dark_mode_outlined,
                          iconColor: kBrandColor,
                          title: 'Theme',
                          subtitle: _themeModeLabel(mode),
                          onTap: () => _showThemeModePicker(context, ref, mode),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _LogOutRow(onTap: () => confirmAndLogout(context, ref)),
              ],
            ),
    );
  }
}

String _themeModeLabel(ThemeMode mode) => switch (mode) {
      ThemeMode.light => 'Light',
      ThemeMode.dark => 'Dark',
      ThemeMode.system => 'System default',
    };

void _showThemeModePicker(BuildContext context, WidgetRef ref, ThemeMode current) {
  showModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Theme', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
          ),
          for (final mode in ThemeMode.values)
            RadioListTile<ThemeMode>(
              value: mode,
              groupValue: current,
              activeColor: kBrandColor,
              title: Text(_themeModeLabel(mode)),
              onChanged: (value) {
                if (value != null) ref.read(appThemeModeProvider.notifier).setMode(value);
                Navigator.of(sheetContext).pop();
              },
            ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}

class _LogOutRow extends StatelessWidget {
  const _LogOutRow({required this.onTap});

  final VoidCallback onTap;

  static const _red = Color(0xFFFF6B4A);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Material(
        color: _red.withValues(alpha: 0.06),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Positioned(
                left: -26,
                top: -10,
                bottom: -10,
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: _red.withValues(alpha: 0.10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: _red.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.logout, color: _red, size: 20),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Log Out', style: TextStyle(color: _red, fontWeight: FontWeight.w600, fontSize: 16)),
                          SizedBox(height: 2),
                          Text('Sign out from this device', style: TextStyle(color: _red, fontSize: 12)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: _red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
