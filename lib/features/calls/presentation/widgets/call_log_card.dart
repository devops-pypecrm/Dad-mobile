import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/role_utils.dart';
import '../../../auth/providers/session_provider.dart';
import '../../data/calls_repository.dart';
import '../../domain/call_log.dart';
import '../../providers/call_logs_list_provider.dart';
import 'call_recording_player_sheet.dart';

String _formatDuration(int seconds) {
  final m = seconds ~/ 60;
  final s = seconds % 60;
  return '${m}m ${s}s';
}

String _formatDate(DateTime dt) {
  final local = dt.toLocal();
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final hour12 = local.hour % 12 == 0 ? 12 : local.hour % 12;
  final period = local.hour < 12 ? 'AM' : 'PM';
  final minute = local.minute.toString().padLeft(2, '0');
  return '${months[local.month - 1]} ${local.day}, $hour12:$minute $period';
}

const _statusColors = {
  'completed': Color(0xFF16A34A),
  'missed': Color(0xFFDC2626),
  'busy': Color(0xFFCA8A04),
  'failed': Color(0xFFDC2626),
  'initiated': Color(0xFF2563EB),
};

class CallLogCard extends ConsumerWidget {
  const CallLogCard({super.key, required this.call});

  final CallLog call;

  Future<void> _download(BuildContext context) async {
    final url = call.playableRecordingUrl;
    if (url == null) return;
    final messenger = ScaffoldMessenger.of(context);
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      // Opens externally (browser/media app) rather than in-app — the
      // simplest correct "download" on mobile without adding a
      // file-storage/share dependency: the browser handles saving it.
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      messenger.showSnackBar(const SnackBar(content: Text('Could not open the recording.')));
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete recording?'),
        content: const Text('This permanently deletes the audio file. The call log entry stays.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(callsRepositoryProvider).deleteRecording(call.id);
      ref.read(callLogsListProvider.notifier).removeRecordingLocally(call.id);
      messenger.showSnackBar(const SnackBar(content: Text('Recording deleted')));
    } catch (_) {
      messenger.showSnackBar(const SnackBar(content: Text('Failed to delete recording')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isOutbound = call.direction == 'outbound';
    final statusColor = _statusColors[call.callStatus] ?? theme.colorScheme.onSurfaceVariant;
    final isAdmin = isAdminRole(ref.watch(sessionControllerProvider).valueOrNull?.role);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
              child: Icon(
                isOutbound ? Icons.call_made : Icons.call_received,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          call.counterpartName,
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (call.hasRecording) ...[
                        InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () => showCallRecordingPlayer(context, call),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(Icons.play_circle_outline, size: 18, color: theme.colorScheme.primary),
                          ),
                        ),
                        PopupMenuButton<String>(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.more_vert, size: 18, color: theme.colorScheme.onSurfaceVariant),
                          onSelected: (value) {
                            if (value == 'download') _download(context);
                            if (value == 'delete') _confirmDelete(context, ref);
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(value: 'download', child: Text('Download')),
                            if (isAdmin)
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete recording', style: TextStyle(color: Colors.red)),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  if (call.phoneNumber != null && call.phoneNumber!.isNotEmpty)
                    Text(
                      call.phoneNumber!,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(_formatDate(call.date), style: theme.textTheme.labelSmall),
                      const SizedBox(width: 8),
                      Text('· ${_formatDuration(call.durationSeconds)}', style: theme.textTheme.labelSmall),
                      const Spacer(),
                      if (call.callStatus != null && call.callStatus!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            call.callStatus!,
                            style: theme.textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.w600),
                          ),
                        ),
                    ],
                  ),
                  if (call.createdBy != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'by ${call.createdBy!.fullName}',
                        style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
