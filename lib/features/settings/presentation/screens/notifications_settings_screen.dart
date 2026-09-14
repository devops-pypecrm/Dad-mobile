import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../providers/profile_controller.dart';

const _brandColor = Color(0xFF578732);

/// Real per-user notification preferences, backed by `User.notification
/// Preferences` — a field `notificationService.ts` already reads to gate
/// push/email/WhatsApp sends (see that file's `NotificationService.send`),
/// but which had no UI anywhere (web included) to actually set before this
/// screen. Each toggle writes through `PUT /api/profile` immediately, same
/// "no separate Save button" pattern as a typical OS settings toggle.
class NotificationsSettingsScreen extends ConsumerWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: profileAsync.when(
        data: (profile) {
          final prefs = profile.notificationPreferences;
          final controller = ref.read(profileControllerProvider.notifier);

          Future<void> toggle(String label, Future<void> Function() apply) async {
            try {
              await apply();
            } catch (e) {
              if (!context.mounted) return;
              showAppSnackBar(context, 'Failed to update $label: $e', isError: true);
            }
          }

          return ListView(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Text(
                  'Choose how you want to be notified about leads, follow-ups, and other activity.',
                ),
              ),
              SwitchListTile(
                activeColor: _brandColor,
                title: const Text('Push Notifications'),
                subtitle: const Text('Alerts on this device'),
                value: prefs.pushNotifications,
                onChanged: (value) => toggle(
                  'push notifications',
                  () => controller.updateNotificationPreferences(prefs.copyWith(pushNotifications: value)),
                ),
              ),
              SwitchListTile(
                activeColor: _brandColor,
                title: const Text('Email Notifications'),
                subtitle: const Text('Important updates sent to your inbox'),
                value: prefs.emailNotifications,
                onChanged: (value) => toggle(
                  'email notifications',
                  () => controller.updateNotificationPreferences(prefs.copyWith(emailNotifications: value)),
                ),
              ),
              SwitchListTile(
                activeColor: _brandColor,
                title: const Text('WhatsApp Notifications'),
                subtitle: const Text('High-priority alerts sent to your WhatsApp'),
                value: prefs.whatsAppNotifications,
                onChanged: (value) => toggle(
                  'WhatsApp notifications',
                  () => controller.updateNotificationPreferences(prefs.copyWith(whatsAppNotifications: value)),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(profileControllerProvider),
        ),
      ),
    );
  }
}
