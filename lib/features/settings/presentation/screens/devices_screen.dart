import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/domain/user_device_session.dart';
import '../../../auth/providers/devices_provider.dart';

const _brandColor = Color(0xFF578732);

/// "Devices" — every device this account is currently logged into, with a
/// remote sign-out per device. Backed by `UserSession` rows created at
/// login (`sessionService.ts`) and enforced in `protect` on every request,
/// so revoking one here takes effect on that device's very next API call.
class DevicesScreen extends ConsumerWidget {
  const DevicesScreen({super.key});

  Future<void> _confirmAndRevoke(BuildContext context, WidgetRef ref, UserDeviceSession session) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(session.isCurrentDevice ? 'Sign out this device?' : 'Sign out "${session.displayName}"?'),
        content: Text(
          session.isCurrentDevice
              ? "You'll be signed out of this account on this device right now."
              : "That device will be signed out next time it tries to load anything.",
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    try {
      await ref.read(devicesProvider.notifier).revoke(session.id);
      if (!context.mounted) return;
      if (!session.isCurrentDevice) showAppSnackBar(context, '"${session.displayName}" was signed out.');
      // If it WAS the current device, `logout()` already redirects to
      // /login via the router's reactive redirect — no navigation needed.
    } catch (e) {
      if (!context.mounted) return;
      showAppSnackBar(context, 'Failed to sign out device: $e', isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(devicesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Devices')),
      body: devicesAsync.when(
        data: (sessions) => RefreshIndicator(
          onRefresh: () => ref.read(devicesProvider.notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Devices currently signed into your account. Sign out any you don\'t recognize.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 16),
              Card(
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    for (var i = 0; i < sessions.length; i++) ...[
                      if (i > 0) const Divider(height: 1, indent: 70),
                      _DeviceTile(
                        session: sessions[i],
                        onSignOut: () => _confirmAndRevoke(context, ref, sessions[i]),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(devicesProvider),
        ),
      ),
    );
  }
}

class _DeviceTile extends StatelessWidget {
  const _DeviceTile({required this.session, required this.onSignOut});

  final UserDeviceSession session;
  final VoidCallback onSignOut;

  IconData get _icon {
    switch (session.platform) {
      case 'android':
        return Icons.phone_android;
      case 'ios':
        return Icons.phone_iphone;
      case 'web':
        return Icons.computer;
      default:
        return Icons.devices_other;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (session.isCurrentDevice ? _brandColor : Colors.blueGrey).withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Icon(_icon, color: session.isCurrentDevice ? _brandColor : Colors.blueGrey, size: 20),
      ),
      title: Row(
        children: [
          Flexible(child: Text(session.displayName, overflow: TextOverflow.ellipsis)),
          if (session.isCurrentDevice) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: _brandColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(6)),
              child: Text(
                'This device',
                style: theme.textTheme.labelSmall?.copyWith(color: _brandColor, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(
        'Active ${DateFormat('MMM d, h:mm a').format(session.lastActiveAt.toLocal())}'
        '${session.ipAddress != null ? ' · ${session.ipAddress}' : ''}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: TextButton(
        onPressed: onSignOut,
        child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
