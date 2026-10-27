import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/ist_format.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../domain/lead_re_enquiry_history.dart';
import '../../domain/lead_whatsapp_activity.dart';
import '../../providers/lead_activity_providers.dart';
import '../../providers/lead_re_enquiry_split_controller.dart';
import 'lead_recording_player_sheet.dart';

const _brandColor = Color(0xFF9654B5);

enum _ActivityTab {
  timeline,
  whatsappMessages,
  whatsappCalls,
  callHistory,
  ownershipHistory,
  reEnquiryHistory,
}

const _tabs = [
  (tab: _ActivityTab.timeline, label: 'Timeline'),
  (tab: _ActivityTab.whatsappMessages, label: 'WhatsApp Messages'),
  (tab: _ActivityTab.whatsappCalls, label: 'WhatsApp Calls'),
  (tab: _ActivityTab.callHistory, label: 'Call History'),
  (tab: _ActivityTab.ownershipHistory, label: 'Ownership History'),
  (tab: _ActivityTab.reEnquiryHistory, label: 'Re-Enquiry History'),
];

/// The 5 activity tabs Dad-frontend's `pages/leads/[id].tsx` shows on the
/// web Lead Detail page (Timeline/WhatsApp Messages/WhatsApp Calls/Call
/// History/Ownership History), ported below the existing single-scroll
/// mobile Lead Detail content rather than replacing it. Deliberately NOT a
/// `TabBarView` — that needs a bounded height and its own scroll physics,
/// which fights the outer `ListView` this sits inside (the whole Lead
/// Detail screen is one scrollable, not nested scrollables); instead this
/// is a simple selector + the selected tab's items rendered inline as plain
/// (non-scrolling) content, letting the outer page handle all scrolling.
class LeadActivityTabs extends ConsumerStatefulWidget {
  const LeadActivityTabs({super.key, required this.leadId});

  final String leadId;

  @override
  ConsumerState<LeadActivityTabs> createState() => _LeadActivityTabsState();
}

class _LeadActivityTabsState extends ConsumerState<LeadActivityTabs> {
  _ActivityTab _selected = _ActivityTab.timeline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final t in _tabs) ...[
                _TabChip(
                  label: t.label,
                  selected: _selected == t.tab,
                  onTap: () => setState(() => _selected = t.tab),
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        const SizedBox(height: 12),
        switch (_selected) {
          _ActivityTab.timeline => _TimelineTab(leadId: widget.leadId),
          _ActivityTab.whatsappMessages => _WhatsAppMessagesTab(
            leadId: widget.leadId,
          ),
          _ActivityTab.whatsappCalls => _WhatsAppCallsTab(
            leadId: widget.leadId,
          ),
          _ActivityTab.callHistory => _CallHistoryTab(leadId: widget.leadId),
          _ActivityTab.ownershipHistory => _OwnershipHistoryTab(
            leadId: widget.leadId,
          ),
          _ActivityTab.reEnquiryHistory => _ReEnquiryHistoryTab(
            leadId: widget.leadId,
          ),
        },
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: selected ? _brandColor : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? _brandColor : theme.colorScheme.outlineVariant,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: selected ? Colors.white : theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Rounded white card wrapping one activity row — shared shell for every
/// tab's items so they read consistently despite very different content.
class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: child,
    );
  }
}

class _IconCircle extends StatelessWidget {
  const _IconCircle({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 17, color: color),
    );
  }
}

class _DurationBadge extends StatelessWidget {
  const _DurationBadge({required this.seconds});

  final num seconds;

  @override
  Widget build(BuildContext context) {
    if (seconds <= 0) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time,
            size: 12,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            formatCallDuration(seconds),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabLoading extends StatelessWidget {
  const _TabLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _TabError extends StatelessWidget {
  const _TabError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(message, style: TextStyle(color: theme.colorScheme.error)),
    );
  }
}

// ---------------------------------------------------------------------------
// Timeline
// ---------------------------------------------------------------------------

(IconData, Color) _timelineIconFor(String type, String subType) {
  switch (type) {
    case 'interaction':
      switch (subType) {
        case 'call':
          return (Icons.call_outlined, const Color(0xFF00A8D6));
        case 'email':
          return (Icons.email_outlined, const Color(0xFF9654B5));
        case 'meeting':
          return (Icons.groups_outlined, const Color(0xFF9654B5));
        case 'note':
          return (Icons.note_outlined, _brandColor);
        default:
          return (Icons.chat_bubble_outline, _neutralGrey);
      }
    case 'task':
      return (Icons.check_circle_outline, const Color(0xFFF5B82E));
    case 'event':
      return (Icons.event_outlined, const Color(0xFF00A8D6));
    case 'audit':
      return (Icons.history, _neutralGrey);
    case 'recording':
      return (Icons.mic_none_outlined, const Color(0xFFFF6B4A));
    case 'document':
      return (Icons.insert_drive_file_outlined, _neutralGrey);
    case 'followUp':
      return (Icons.flag_outlined, _brandColor);
    default:
      return (Icons.circle_outlined, _neutralGrey);
  }
}

const _neutralGrey = Color(0xFF6B7280);

class _TimelineTab extends ConsumerWidget {
  const _TimelineTab({required this.leadId});

  final String leadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref
        .watch(leadTimelineProvider(leadId))
        .when(
          loading: () => const _TabLoading(),
          error: (error, stack) =>
              _TabError(message: "Couldn't load timeline: $error"),
          data: (items) {
            // WhatsApp activity has its own dedicated tabs — excluded here,
            // matching web's `TimelineFeed.tsx`.
            final filtered = items
                .where(
                  (i) => !(i.type == 'interaction' && i.subType == 'whatsapp'),
                )
                .toList();
            if (filtered.isEmpty) {
              return const _EmptyState(
                icon: Icons.history,
                message: 'No activity history found.',
              );
            }
            return Column(
              children: [
                for (final item in filtered)
                  _ActivityCard(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            final (icon, color) = _timelineIconFor(
                              item.type,
                              item.subType,
                            );
                            return _IconCircle(icon: icon, color: color);
                          },
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
                                      item.title,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    formatIST(item.date, 'MMM d, h:mm a'),
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                              if (item.description != null &&
                                  item.description!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  item.description!,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                              if (item.actor != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  'by ${item.actor!.firstName}',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                              Builder(
                                builder: (context) {
                                  final seconds = bestDurationSeconds(
                                    hardwareDuration:
                                        item.meta?.hardwareDuration,
                                    recordingDuration:
                                        item.meta?.recordingDuration,
                                    durationMinutes: item.meta?.duration,
                                  );
                                  if (seconds <= 0)
                                    return const SizedBox.shrink();
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: _DurationBadge(seconds: seconds),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        );
  }
}

// ---------------------------------------------------------------------------
// WhatsApp Messages
// ---------------------------------------------------------------------------

class _WhatsAppMessagesTab extends ConsumerWidget {
  const _WhatsAppMessagesTab({required this.leadId});

  final String leadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref
        .watch(leadWhatsAppActivityProvider(leadId))
        .when(
          loading: () => const _TabLoading(),
          error: (error, stack) =>
              _TabError(message: "Couldn't load WhatsApp messages: $error"),
          data: (items) {
            final messages = items.where((i) => !isWhatsAppCall(i)).toList();
            if (messages.isEmpty) {
              return const _EmptyState(
                icon: Icons.message_outlined,
                message: 'No WhatsApp messages recorded.',
              );
            }
            return Column(
              children: [
                for (final msg in messages)
                  _ActivityCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _IconCircle(
                              icon: Icons.message_outlined,
                              color: msg.direction == 'inbound'
                                  ? const Color(0xFFF5B82E)
                                  : const Color(0xFF9654B5),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                msg.direction == 'inbound'
                                    ? 'From Lead'
                                    : 'To Lead',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              formatIST(msg.date, 'MMM d, h:mm a'),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        if (msg.content != null && msg.content!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(msg.content!, style: theme.textTheme.bodyMedium),
                        ],
                        if (msg.actor != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            'Logged by ${msg.actor}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            );
          },
        );
  }
}

// ---------------------------------------------------------------------------
// WhatsApp Calls
// ---------------------------------------------------------------------------

class _WhatsAppCallsTab extends ConsumerWidget {
  const _WhatsAppCallsTab({required this.leadId});

  final String leadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref
        .watch(leadWhatsAppActivityProvider(leadId))
        .when(
          loading: () => const _TabLoading(),
          error: (error, stack) =>
              _TabError(message: "Couldn't load WhatsApp calls: $error"),
          data: (items) {
            final calls = items.where(isWhatsAppCall).toList();
            if (calls.isEmpty) {
              return const _EmptyState(
                icon: Icons.call_outlined,
                message: 'No WhatsApp call history recorded.',
              );
            }

            num totalSeconds = 0;
            DateTime? lastContacted;
            for (final c in calls) {
              totalSeconds += bestDurationSeconds(
                hardwareDuration: c.hardwareDuration,
                recordingDuration: c.recordingDuration,
                durationMinutes: c.duration,
              );
              if (lastContacted == null || c.date.isAfter(lastContacted))
                lastContacted = c.date;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _brandColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _SummaryStat(
                          label: 'Total Calls',
                          value: '${calls.length}',
                        ),
                      ),
                      Expanded(
                        child: _SummaryStat(
                          label: 'Total Talk-Time',
                          value: formatCallDuration(totalSeconds),
                        ),
                      ),
                      Expanded(
                        child: _SummaryStat(
                          label: 'Last Contacted',
                          value: lastContacted != null
                              ? formatIST(lastContacted, 'MMM d, yyyy')
                              : 'Never',
                        ),
                      ),
                    ],
                  ),
                ),
                for (final call in calls)
                  _ActivityCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _IconCircle(
                              icon: Icons.call_outlined,
                              color: call.direction == 'inbound'
                                  ? const Color(0xFFF5B82E)
                                  : const Color(0xFF9654B5),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    call.direction == 'inbound'
                                        ? 'Incoming WhatsApp'
                                        : 'Outgoing WhatsApp',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  Text(
                                    call.subject ?? 'WhatsApp Call',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              formatIST(call.date, 'MMM d, h:mm a'),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        if (call.content != null &&
                            call.content!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            call.content!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            Builder(
                              builder: (context) {
                                final seconds = bestDurationSeconds(
                                  hardwareDuration: call.hardwareDuration,
                                  recordingDuration: call.recordingDuration,
                                  durationMinutes: call.duration,
                                );
                                return _DurationBadge(seconds: seconds);
                              },
                            ),
                            if (call.callStatus != null &&
                                call.callStatus!.isNotEmpty)
                              _StatusBadge(label: call.callStatus!),
                            if (call.actor != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                ),
                                child: Text(
                                  'Logged by ${call.actor}',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (call.recordingUrl != null &&
                            call.recordingUrl!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _brandColor,
                            ),
                            onPressed: () => showLeadRecordingPlayer(
                              context,
                              title: call.subject ?? 'WhatsApp Call',
                              url: call.recordingUrl!,
                            ),
                            icon: const Icon(
                              Icons.play_circle_outline,
                              size: 18,
                            ),
                            label: const Text('Play recording'),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            );
          },
        );
  }
}

class _SummaryStat extends StatelessWidget {
  const _SummaryStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: _brandColor,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Call History
// ---------------------------------------------------------------------------

class _CallHistoryTab extends ConsumerWidget {
  const _CallHistoryTab({required this.leadId});

  final String leadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref
        .watch(leadCallHistoryProvider(leadId))
        .when(
          loading: () => const _TabLoading(),
          error: (error, stack) =>
              _TabError(message: "Couldn't load call history: $error"),
          data: (calls) {
            if (calls.isEmpty) {
              return const _EmptyState(
                icon: Icons.phone_in_talk_outlined,
                message: 'No call history recorded.',
              );
            }
            return Column(
              children: [
                for (final call in calls)
                  _ActivityCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _IconCircle(
                              icon: Icons.call_outlined,
                              color: call.direction == 'inbound'
                                  ? const Color(0xFFF5B82E)
                                  : const Color(0xFF00A8D6),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    call.direction == 'inbound'
                                        ? 'Incoming'
                                        : 'Outgoing',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  Text(
                                    call.subject,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              formatIST(call.date, 'MMM d, h:mm a'),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        if (call.description != null &&
                            call.description!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            call.description!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            Builder(
                              builder: (context) {
                                final seconds = bestDurationSeconds(
                                  hardwareDuration: call.hardwareDuration,
                                  recordingDuration: call.recordingDuration,
                                  durationMinutes: call.duration,
                                );
                                return _DurationBadge(seconds: seconds);
                              },
                            ),
                            if (call.callStatus != null &&
                                call.callStatus!.isNotEmpty)
                              _StatusBadge(label: call.callStatus!),
                          ],
                        ),
                        if (call.recordingUrl != null &&
                            call.recordingUrl!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _brandColor,
                            ),
                            onPressed: () => showLeadRecordingPlayer(
                              context,
                              title: call.subject,
                              url: call.recordingUrl!,
                            ),
                            icon: const Icon(
                              Icons.play_circle_outline,
                              size: 18,
                            ),
                            label: const Text('Play recording'),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            );
          },
        );
  }
}

// ---------------------------------------------------------------------------
// Ownership History
// ---------------------------------------------------------------------------

class _OwnershipHistoryTab extends ConsumerWidget {
  const _OwnershipHistoryTab({required this.leadId});

  final String leadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ref
        .watch(leadOwnershipHistoryProvider(leadId))
        .when(
          loading: () => const _TabLoading(),
          error: (error, stack) =>
              _TabError(message: "Couldn't load ownership history: $error"),
          data: (entries) {
            if (entries.isEmpty) {
              return const _EmptyState(
                icon: Icons.swap_horiz,
                message: 'No history recorded yet.',
              );
            }
            return Column(
              children: [
                for (final entry in entries)
                  _ActivityCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formatIST(entry.createdAt, 'MMM d, yyyy h:mm a'),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _OwnerPill(
                                name: entry.oldOwner != null
                                    ? '${entry.oldOwner!.firstName} ${entry.oldOwner!.lastName ?? ''}'
                                          .trim()
                                    : 'Unassigned',
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: _brandColor,
                              ),
                            ),
                            Expanded(
                              child: _OwnerPill(
                                name: entry.newOwner != null
                                    ? '${entry.newOwner!.firstName} ${entry.newOwner!.lastName ?? ''}'
                                          .trim()
                                    : 'Unassigned',
                              ),
                            ),
                          ],
                        ),
                        if (entry.reason != null &&
                            entry.reason!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Reason: ${entry.reason}',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                        if (entry.changedBy != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            'Changed by ${entry.changedBy!.firstName} ${entry.changedBy!.lastName ?? ''}'
                                .trim(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            );
          },
        );
  }
}

class _OwnerPill extends StatelessWidget {
  const _OwnerPill({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _brandColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelMedium?.copyWith(
          color: _brandColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Re-Enquiry History
// ---------------------------------------------------------------------------

/// Every past time this lead's phone number enquired again — not just the
/// current merged name/count the rest of the app shows. Each event carries
/// a "Create as separate lead" action for when it turns out to have been a
/// different person sharing the same phone number, not the same customer.
class _ReEnquiryHistoryTab extends ConsumerWidget {
  const _ReEnquiryHistoryTab({required this.leadId});

  final String leadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(leadReEnquiryHistoryProvider(leadId))
        .when(
          loading: () => const _TabLoading(),
          error: (error, stack) =>
              _TabError(message: "Couldn't load re-enquiry history: $error"),
          data: (history) {
            if (history.events.isEmpty) {
              return const _EmptyState(
                icon: Icons.replay_outlined,
                message: 'This lead has never re-enquired.',
              );
            }
            return Column(
              children: [
                for (final event in history.events)
                  _ReEnquiryEventCard(
                    leadId: leadId,
                    currentPhone: history.currentPhone,
                    event: event,
                  ),
              ],
            );
          },
        );
  }
}

class _ReEnquiryEventCard extends ConsumerWidget {
  const _ReEnquiryEventCard({
    required this.leadId,
    required this.currentPhone,
    required this.event,
  });

  final String leadId;
  final String currentPhone;
  final LeadReEnquiryEvent event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final splitState = ref.watch(
      leadReEnquirySplitControllerProvider(leadId),
    );

    ref.listen(leadReEnquirySplitControllerProvider(leadId), (
      previous,
      next,
    ) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        showAppSnackBar(context, error.toString(), isError: true);
      }
    });

    return _ActivityCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _IconCircle(
                icon: Icons.replay_outlined,
                color: _brandColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name ?? 'Name not recorded',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      formatIST(event.date, 'MMM d, yyyy h:mm a'),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (event.phone != null || event.email != null) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                if (event.phone != null) _StatusBadge(label: event.phone!),
                if (event.email != null) _StatusBadge(label: event.email!),
              ],
            ),
          ],
          const SizedBox(height: 10),
          if (event.alreadySplitLeadId != null)
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  'Already created as a separate lead',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            )
          else
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: splitState.isLoading
                    ? null
                    : () => _confirmAndSplit(context, ref),
                icon: splitState.isLoading
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.call_split, size: 16),
                label: const Text('Create as separate lead'),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _confirmAndSplit(BuildContext context, WidgetRef ref) async {
    final phoneForNewLead = event.phone ?? currentPhone;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create as separate lead?'),
        content: Text(
          event.phone != null && event.phone != currentPhone
              ? 'This will create a new lead for "${event.name}" using the phone number captured at that enquiry ($phoneForNewLead).'
              : 'This re-enquiry didn\'t capture its own phone number, so the new '
                    'lead for "${event.name}" will share this lead\'s phone number '
                    '($phoneForNewLead).\n\n'
                    'Warning: because both leads will have the same phone number, a '
                    'future re-enquiry on this number could get matched to either one. '
                    'Add a note, secondary phone, or email on the new lead as soon as '
                    'possible to keep the two apart.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Create separate lead'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final newLeadId = await ref
        .read(leadReEnquirySplitControllerProvider(leadId).notifier)
        .split(eventIndex: event.eventIndex);

    if (newLeadId != null && context.mounted) {
      showAppSnackBar(context, 'Created new lead for "${event.name}"');
    }
  }
}
