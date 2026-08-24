import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/followup.dart';
import '../../providers/followups_list_controller.dart';

const _statusColors = {
  kFollowUpNotStarted: Color(0xFF64748B),
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
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final local = dt.toLocal();
  final hour12 = local.hour % 12 == 0 ? 12 : local.hour % 12;
  final period = local.hour < 12 ? 'AM' : 'PM';
  final minute = local.minute.toString().padLeft(2, '0');
  return '${months[local.month - 1]} ${local.day}, $hour12:$minute $period';
}

/// Same layout/actions as Dad-frontend/src/pages/follow-ups/FollowUpMobileCard.tsx:
/// status + priority badges, lead name (or subject if unrelated), a due-date
/// row with an OVERDUE/TODAY badge, an assignee + branch metadata row, and
/// action buttons (Call — only for Lead-linked follow-ups with a phone
/// number — plus a Quick Status menu and View Lead). Full editing
/// (`UpdateFollowUpDialog`'s subject/description/priority form) isn't
/// ported — only the status/due-date mutations the backend already exposes
/// to this app (`FollowUpsRepository.updateStatus`/`.reschedule`).
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
      initialDate: followUp.dueDate.isAfter(DateTime.now()) ? followUp.dueDate : DateTime.now(),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(followUp.dueDate.toLocal()),
    );
    if (!context.mounted) return;
    final dueDate = DateTime(date.year, date.month, date.day, time?.hour ?? 9, time?.minute ?? 0);
    await ref.read(followUpsListControllerProvider.notifier).reschedule(followUp.id, dueDate);
  }

  Future<void> _showActions(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            if (followUp.leadId != null)
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('View Lead'),
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/leads/${followUp.leadId}');
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
              child: Text('Quick Status', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            for (final status in kFollowUpStatuses)
              ListTile(
                title: Text(_statusLabel(status)),
                trailing: followUp.status == status ? const Icon(Icons.check) : null,
                onTap: () {
                  Navigator.of(context).pop();
                  ref.read(followUpsListControllerProvider.notifier).updateStatus(followUp.id, status);
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
    final isDueToday = !isOverdue &&
        !followUp.isCompleted &&
        followUp.dueDate.year == now.year &&
        followUp.dueDate.month == now.month &&
        followUp.dueDate.day == now.day;

    final leadId = followUp.leadId;
    final displayName = followUp.relatedTo?.displayName ?? followUp.subject;
    final hasPhone = (followUp.relatedTo?.phone ?? '').isNotEmpty;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isOverdue || isDueToday)
            Container(height: 3, color: isOverdue ? theme.colorScheme.error : const Color(0xFFFB923C)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(
                      label: Text(_statusLabel(followUp.status)),
                      backgroundColor: (_statusColors[followUp.status] ?? Colors.grey).withValues(alpha: 0.12),
                      labelStyle: TextStyle(
                        color: _statusColors[followUp.status] ?? Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      side: BorderSide.none,
                    ),
                    const Spacer(),
                    Text(
                      followUp.priority.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: _priorityColors[followUp.priority] ?? theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: leadId != null ? () => context.push('/leads/$leadId') : null,
                  child: Text(
                    displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: leadId != null ? theme.colorScheme.primary : null,
                    ),
                  ),
                ),
                if (followUp.onModel == 'Lead' && followUp.subject != displayName)
                  Text(
                    followUp.subject,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: isOverdue
                                ? theme.colorScheme.error
                                : isDueToday
                                    ? const Color(0xFFEA580C)
                                    : theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              _formatDueDate(followUp.dueDate),
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isOverdue
                                    ? theme.colorScheme.error
                                    : isDueToday
                                        ? const Color(0xFFEA580C)
                                        : null,
                              ),
                            ),
                          ),
                          if (isOverdue)
                            _Badge(label: 'OVERDUE', color: theme.colorScheme.error)
                          else if (isDueToday)
                            const _Badge(label: 'TODAY', color: Color(0xFFEA580C)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.person_outline, size: 14, color: theme.colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              followUp.assignedTo?.fullName ?? '—',
                              style: theme.textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(Icons.apartment_outlined, size: 14, color: theme.colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              followUp.branch?.name ?? 'Main Branch',
                              style: theme.textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    if (leadId != null && hasPhone) ...[
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _call(context),
                          icon: const Icon(Icons.call, size: 16),
                          label: const Text('Call'),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showActions(context, ref),
                        icon: const Icon(Icons.more_horiz, size: 16),
                        label: const Text('Actions'),
                      ),
                    ),
                  ],
                ),
              ],
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
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 9),
      ),
    );
  }
}
