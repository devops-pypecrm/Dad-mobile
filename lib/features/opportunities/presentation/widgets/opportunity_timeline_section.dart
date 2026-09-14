import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/utils/url_launch_helper.dart';
import '../../domain/opportunity_timeline_item.dart';
import '../../providers/opportunity_timeline_provider.dart';
import '../../../leads/presentation/widgets/lead_recording_player_sheet.dart';

const _brandColor = Color(0xFF578732);

/// The "Timeline & Files" tab's activity feed — a merged, newest-first list
/// of Interactions/Tasks/Events/AuditLogs/CallRecordings/FollowUps/Documents
/// (see `OpportunityTimelineItem`'s doc comment), same data Dad-frontend's
/// `TimelineFeed.tsx` renders. Every text field here wraps in place (no
/// `maxLines`/`overflow: ellipsis` anywhere) — a long note/description reads
/// in full rather than getting cut off, matching the "don't truncate" ask
/// this was built against.
class OpportunityTimelineSection extends ConsumerWidget {
  const OpportunityTimelineSection({super.key, required this.opportunityId});

  final String opportunityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelineAsync = ref.watch(opportunityTimelineProvider(opportunityId));
    final theme = Theme.of(context);

    return timelineAsync.when(
      data: (items) {
        // WhatsApp interactions are surfaced elsewhere (lead-level WhatsApp
        // activity) — hidden here too, mirroring TimelineFeed.tsx's own
        // filter, so they don't show up twice across the app.
        final visible = items
            .where((i) => !(i.type == 'interaction' && i.subType == 'whatsapp'))
            .toList();
        if (visible.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Icon(Icons.history, size: 32, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 8),
                Text('No activity history found.', style: theme.textTheme.bodyMedium),
              ],
            ),
          );
        }
        return Column(
          children: [for (final item in visible) _TimelineTile(item: item)],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          "Couldn't load activity: $error",
          style: TextStyle(color: theme.colorScheme.error),
        ),
      ),
    );
  }
}

(IconData, Color) _iconAndColor(OpportunityTimelineItem item) {
  switch (item.type) {
    case 'interaction':
      if (item.subType == 'call') return (Icons.call, _brandColor);
      if (item.subType == 'whatsapp') return (Icons.chat_bubble_outline, const Color(0xFF16A34A));
      return (Icons.mail_outline, _brandColor);
    case 'task':
      return (Icons.check_box_outlined, const Color(0xFFEA580C));
    case 'followUp':
      return (Icons.schedule, const Color(0xFF4F46E5));
    case 'event':
      return (Icons.event_outlined, const Color(0xFF9333EA));
    case 'audit':
      return (Icons.shield_outlined, Colors.grey);
    case 'recording':
      return (Icons.call, const Color(0xFF2563EB));
    case 'document':
      return (Icons.description_outlined, const Color(0xFFD97706));
    default:
      return (Icons.circle_outlined, Colors.grey);
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({required this.item});

  final OpportunityTimelineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, color) = _iconAndColor(item);
    final dateStr = _formatDate(item.date);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title ?? 'Activity',
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                        // Full title, wraps to as many lines as it needs —
                        // never cut off with an ellipsis.
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dateStr,
                      style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
                if ((item.description ?? '').isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(item.description!, style: theme.textTheme.bodySmall),
                ],
                if (item.actor != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'by ${item.actor!.fullName}',
                    style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
                if (item.type == 'interaction' && item.subType == 'call') ...[
                  const SizedBox(height: 8),
                  _CallMeta(item: item),
                ],
                if (item.type == 'recording') ...[const SizedBox(height: 8), _CallMeta(item: item, isStandalone: true)],
                if (item.type == 'document') ...[const SizedBox(height: 8), _DocumentTile(item: item)],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CallMeta extends StatelessWidget {
  const _CallMeta({required this.item, this.isStandalone = false});

  final OpportunityTimelineItem item;
  final bool isStandalone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final direction = item.meta['direction'] as String?;
    final duration = (item.meta['duration'] as num?)?.toInt() ??
        (item.meta['recordingDuration'] as num?)?.toInt();
    final recordingUrl = isStandalone
        ? item.meta['fileUrl'] as String?
        : item.meta['recordingUrl'] as String?;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: [
        if (direction != null && direction.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              direction.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.3),
            ),
          ),
        if (duration != null && duration > 0)
          Text(
            '(${_formatDuration(duration)})',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        if (recordingUrl != null && recordingUrl.isNotEmpty)
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: _brandColor,
              side: const BorderSide(color: _brandColor),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => showLeadRecordingPlayer(context, title: item.title ?? 'Recording', url: recordingUrl),
            icon: const Icon(Icons.play_arrow, size: 16),
            label: const Text('Play recording'),
          ),
      ],
    );
  }
}

class _DocumentTile extends StatelessWidget {
  const _DocumentTile({required this.item});

  final OpportunityTimelineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileSizeKb = ((item.meta['fileSize'] as num?) ?? 0) / 1024;
    final fileUrl = item.meta['fileUrl'] as String?;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file_outlined, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? 'Document',
                  style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${item.subType ?? 'file'} · ${fileSizeKb.toStringAsFixed(1)} KB',
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          if (fileUrl != null && fileUrl.isNotEmpty)
            IconButton(
              tooltip: 'Download',
              icon: const Icon(Icons.download_outlined),
              onPressed: () => launchUriWithFeedback(
                context,
                Uri.parse('${AppConfig.instance.apiOrigin}$fileUrl'),
              ),
            ),
        ],
      ),
    );
  }
}

String _formatDuration(int totalSeconds) {
  final m = totalSeconds ~/ 60;
  final s = totalSeconds % 60;
  return '${m}m ${s}s';
}

String _formatDate(DateTime date) {
  final local = date.toLocal();
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  final hour12 = local.hour % 12 == 0 ? 12 : local.hour % 12;
  final minute = local.minute.toString().padLeft(2, '0');
  final period = local.hour >= 12 ? 'PM' : 'AM';
  return '${months[local.month - 1]} ${local.day}, $hour12:$minute $period';
}
