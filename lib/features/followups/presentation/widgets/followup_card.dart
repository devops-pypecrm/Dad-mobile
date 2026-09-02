import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../domain/followup.dart';
import '../../providers/followups_list_controller.dart';

const _statusColors = {
  kFollowUpNotStarted: Color(0xFF578732),
  kFollowUpInProgress: Color(0xFF2563EB),
  kFollowUpCompleted: Color(0xFF16A34A),
  kFollowUpDeferred: Color(0xFFDC2626),
};

const _priorityColors = {
  'high': Color(0xFFDC2626),
  'medium': Color(0xFFCA8A04),
  'low': Color(0xFF16A34A),
};

String _statusLabel(String status) => status.replaceAll('_', ' ');

String _formatDueDate(DateTime dt) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final local = dt.toLocal();
  final hour12 = local.hour % 12 == 0 ? 12 : local.hour % 12;
  final period = local.hour < 12 ? 'AM' : 'PM';
  final minute = local.minute.toString().padLeft(2, '0');
  return '${months[local.month - 1]} ${local.day}, $hour12:$minute $period';
}

/// Left accent-bar card (purple-tinted for Not Started, colored per status
/// otherwise — see `LeadCard` for the identical pattern): status + priority
/// badges, a folder icon + lead name (or subject if unrelated), a due-
/// date/assignee/branch info strip with an OVERDUE/TODAY badge, then
/// "View Details" (pushes the lead) and a "⋯" menu (View Lead/Call/
/// Reschedule/Quick Status). Full editing (`UpdateFollowUpDialog`'s
/// subject/description/priority form) isn't ported — only the status/
/// due-date mutations the backend already exposes to this app
/// (`FollowUpsRepository.updateStatus`/`.reschedule`).
class FollowUpCard extends ConsumerWidget {
  const FollowUpCard({super.key, required this.followUp});

  final FollowUp followUp;

  Future<void> _call(BuildContext context) async {
    final phone = followUp.relatedTo?.phone;
    if (phone == null || phone.isEmpty) return;
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _pickReschedule(BuildContext context, WidgetRef ref) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: followUp.dueDate.isAfter(DateTime.now())
          ? followUp.dueDate
          : DateTime.now(),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(followUp.dueDate.toLocal()),
    );
    if (!context.mounted) return;
    final dueDate = DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? 9,
      time?.minute ?? 0,
    );
    await ref
        .read(followUpsListControllerProvider.notifier)
        .reschedule(followUp.id, dueDate);
  }

  Future<void> _showActions(BuildContext context, WidgetRef ref) async {
    final leadId = followUp.leadId;
    final hasPhone = (followUp.relatedTo?.phone ?? '').isNotEmpty;
    await showModalBottomSheet<void>(
      context: context,
      // The Follow Ups tab lives inside `AppShell`'s `ShellRoute` — without
      // this, the sheet pushes onto the shell's nested Navigator and
      // renders BEHIND the floating bottom nav bar.
      useRootNavigator: true,
      builder: (context) => SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: safeBottomInset(context)),
          children: [
            if (leadId != null)
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('View Lead'),
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/leads/$leadId');
                },
              ),
            if (leadId != null && hasPhone)
              ListTile(
                leading: const Icon(Icons.call_outlined),
                title: const Text('Call'),
                onTap: () {
                  Navigator.of(context).pop();
                  _call(context);
                },
              ),
            ListTile(
              leading: const Icon(Icons.schedule_outlined),
              title: const Text('Reschedule'),
              onTap: () {
                Navigator.of(context).pop();
                _pickReschedule(context, ref);
              },
            ),
            const Divider(height: 1),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                'Quick Status',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            for (final status in kFollowUpStatuses)
              ListTile(
                title: Text(_statusLabel(status)),
                trailing: followUp.status == status
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  Navigator.of(context).pop();
                  ref
                      .read(followUpsListControllerProvider.notifier)
                      .updateStatus(followUp.id, status);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final isOverdue = !followUp.isCompleted && followUp.dueDate.isBefore(now);
    final isDueToday =
        !isOverdue &&
        !followUp.isCompleted &&
        followUp.dueDate.year == now.year &&
        followUp.dueDate.month == now.month &&
        followUp.dueDate.day == now.day;

    final leadId = followUp.leadId;
    final displayName = followUp.relatedTo?.displayName ?? followUp.subject;
    final statusColor = _statusColors[followUp.status] ?? Colors.grey;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      // `IntrinsicHeight` gives the left accent bar an incoming bounded
      // height to stretch to — same reasoning as `LeadCard`'s identical
      // accent-bar pattern (see that file), reused here for consistency.
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: statusColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _statusLabel(followUp.status),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color:
                                (_priorityColors[followUp.priority] ??
                                        theme.colorScheme.onSurfaceVariant)
                                    .withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            followUp.priority.toUpperCase(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color:
                                  _priorityColors[followUp.priority] ??
                                  theme.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF578732,
                            ).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.folder_outlined,
                            color: Color(0xFF578732),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: leadId != null
                                ? () => context.push('/leads/$leadId')
                                : null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  displayName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                if (followUp.subject != displayName)
                                  Text(
                                    followUp.subject,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _InfoColumn(
                              icon: Icons.schedule,
                              iconColor: isOverdue
                                  ? theme.colorScheme.error
                                  : isDueToday
                                  ? const Color(0xFFEA580C)
                                  : theme.colorScheme.onSurfaceVariant,
                              value: _formatDueDate(followUp.dueDate),
                              caption: 'Due Date',
                            ),
                          ),
                          Expanded(
                            child: _InfoColumn(
                              icon: Icons.person_outline,
                              iconColor: theme.colorScheme.onSurfaceVariant,
                              value: followUp.assignedTo?.fullName ?? '—',
                              caption: 'Assigned To',
                            ),
                          ),
                          Expanded(
                            child: _InfoColumn(
                              icon: Icons.apartment_outlined,
                              iconColor: theme.colorScheme.onSurfaceVariant,
                              value: followUp.branch?.name ?? 'Main Branch',
                              caption: 'Branch',
                            ),
                          ),
                          if (isOverdue)
                            _Badge(
                              label: 'OVERDUE',
                              color: theme.colorScheme.error,
                            )
                          else if (isDueToday)
                            const _Badge(
                              label: 'TODAY',
                              color: Color(0xFFEA580C),
                            ),
                        ],
                      ),
                    ),
                    const Divider(height: 24),
                    Row(
                      children: [
                        InkWell(
                          onTap: leadId != null
                              ? () => context.push('/leads/$leadId')
                              : null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Details',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: const Color(0xFF578732),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Color(0xFF578732),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => _showActions(context, ref),
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.more_horiz,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// One "icon + bold value" / "small gray caption" mini-column inside the
/// due-date/assignee/branch info strip.
class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.caption,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 13, color: iconColor),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            caption,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
      ),
    );
  }
}
