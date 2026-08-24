import 'package:flutter/material.dart';

import '../../domain/call_log.dart';

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

class CallLogCard extends StatelessWidget {
  const CallLogCard({super.key, required this.call});

  final CallLog call;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOutbound = call.direction == 'outbound';
    final statusColor = _statusColors[call.callStatus] ?? theme.colorScheme.onSurfaceVariant;

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
                      if (call.hasRecording)
                        Icon(Icons.mic_outlined, size: 16, color: theme.colorScheme.onSurfaceVariant),
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
