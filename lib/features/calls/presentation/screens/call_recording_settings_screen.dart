import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error_state_view.dart';
import '../../domain/call_settings.dart';
import '../../providers/call_settings_provider.dart';

/// Admin-only mobile equivalent of Dad-frontend's
/// `/settings/call-recording` page — configures the org's `CallSettings`
/// row. Reached only from [CallLogsScreen]'s AppBar (admin/org_admin
/// roles), matching the web app's "Recording Settings" button placement
/// and its own admin-only visibility.
class CallRecordingSettingsScreen extends ConsumerWidget {
  const CallRecordingSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(callSettingsControllerProvider);
    final controller = ref.read(callSettingsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Recording Settings'),
        actions: [
          settingsAsync.when(
            data: (_) => TextButton(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                await controller.save();
                if (!context.mounted) return;
                final error = ref.read(callSettingsControllerProvider).error;
                messenger.showSnackBar(
                  SnackBar(content: Text(error == null ? 'Settings saved' : 'Failed to save: $error')),
                );
              },
              child: const Text('Save'),
            ),
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
            ),
            error: (_, _) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: settingsAsync.when(
        data: (settings) => _SettingsForm(settings: settings, controller: controller),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(callSettingsControllerProvider),
        ),
      ),
    );
  }
}

class _SettingsForm extends ConsumerWidget {
  const _SettingsForm({required this.settings, required this.controller});

  final CallSettings settings;
  final CallSettingsController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionCard(
          title: 'Recording Options',
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Auto-record Outbound Calls'),
              subtitle: const Text('Automatically record all outgoing calls'),
              value: settings.autoRecordOutbound,
              onChanged: (v) => controller.stage((c) => c.copyWith(autoRecordOutbound: v)),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Auto-record Inbound Calls'),
              subtitle: const Text('Automatically record all incoming calls'),
              value: settings.autoRecordInbound,
              onChanged: (v) => controller.stage((c) => c.copyWith(autoRecordInbound: v)),
            ),
            const SizedBox(height: 8),
            const Text('Recording Quality'),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              initialValue: settings.recordingQuality,
              decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'low', child: Text('Low (saves storage)')),
                DropdownMenuItem(value: 'medium', child: Text('Medium (balanced)')),
                DropdownMenuItem(value: 'high', child: Text('High (best quality)')),
              ],
              onChanged: (v) {
                if (v != null) controller.stage((c) => c.copyWith(recordingQuality: v));
              },
            ),
          ],
        ),
        _SectionCard(
          title: 'Storage & Retention',
          children: [
            const Text('Storage Location'),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              initialValue: settings.storageType,
              decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'local', child: Text('Local Server Storage')),
                DropdownMenuItem(value: 'cloud', child: Text('Cloud Storage (S3)')),
              ],
              onChanged: (v) {
                if (v != null) controller.stage((c) => c.copyWith(storageType: v));
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: settings.retentionDays.toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Retention Period (days)',
                border: OutlineInputBorder(),
                helperText: 'How long to keep recordings before auto-delete can apply',
              ),
              onChanged: (v) {
                final days = int.tryParse(v);
                if (days != null) controller.stage((c) => c.copyWith(retentionDays: days));
              },
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Auto-delete Old Recordings'),
              subtitle: const Text('Automatically delete recordings older than the retention period'),
              value: settings.autoDeleteEnabled,
              onChanged: (v) => controller.stage((c) => c.copyWith(autoDeleteEnabled: v)),
            ),
          ],
        ),
        _SectionCard(
          title: 'Contact Synchronization',
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Enable Unknown Number Sync'),
              subtitle: const Text(
                'If enabled, all call data is logged. If disabled, only calls from '
                'existing Leads or Contacts are tracked.',
              ),
              value: settings.syncNonCrmContacts,
              onChanged: (v) => controller.stage((c) => c.copyWith(syncNonCrmContacts: v)),
            ),
          ],
        ),
        _SectionCard(
          title: 'Notifications & Follow-ups',
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Incoming Call Pop-up'),
              subtitle: const Text('Show lead/contact details when receiving calls'),
              value: settings.popupOnIncoming,
              onChanged: (v) => controller.stage((c) => c.copyWith(popupOnIncoming: v)),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Auto Follow-up Reminders'),
              subtitle: const Text('Create automatic follow-up tasks after calls'),
              value: settings.autoFollowupReminder,
              onChanged: (v) => controller.stage((c) => c.copyWith(autoFollowupReminder: v)),
            ),
            if (settings.autoFollowupReminder)
              TextFormField(
                initialValue: settings.followupDelayMinutes.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Follow-up Delay (minutes)',
                  border: OutlineInputBorder(),
                  helperText: 'Time after call ends to trigger the follow-up reminder',
                ),
                onChanged: (v) {
                  final minutes = int.tryParse(v);
                  if (minutes != null) controller.stage((c) => c.copyWith(followupDelayMinutes: minutes));
                },
              ),
          ],
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            await controller.save();
            final error = ref.read(callSettingsControllerProvider).error;
            messenger.showSnackBar(
              SnackBar(content: Text(error == null ? 'Settings saved' : 'Failed to save: $error')),
            );
          },
          child: const Text('Save Settings'),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}
