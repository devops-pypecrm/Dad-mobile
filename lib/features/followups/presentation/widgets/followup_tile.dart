import 'package:flutter/material.dart';

import '../../domain/followup.dart';

const _months = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

String _formatDueDate(DateTime dt) {
  final local = dt.toLocal();
  final hour12 = local.hour % 12 == 0 ? 12 : local.hour % 12;
  final period = local.hour < 12 ? 'AM' : 'PM';
  final minute = local.minute.toString().padLeft(2, '0');
  return '${_months[local.month - 1]} ${local.day}, $hour12:$minute $period';
}

class FollowUpTile extends StatelessWidget {
  const FollowUpTile({super.key, required this.followUp, required this.onMarkDone, this.onTap});

  final FollowUp followUp;
  final VoidCallback onMarkDone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOverdue = !followUp.isCompleted && followUp.dueDate.isBefore(DateTime.now());

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: followUp.isCompleted,
          onChanged: followUp.isCompleted ? null : (_) => onMarkDone(),
        ),
        title: Text(
          followUp.subject,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: followUp.isCompleted
              ? theme.textTheme.titleSmall?.copyWith(decoration: TextDecoration.lineThrough)
              : theme.textTheme.titleSmall,
        ),
        subtitle: Text(
          [
            if (followUp.relatedTo != null) followUp.relatedTo!.displayName,
            _formatDueDate(followUp.dueDate),
          ].join(' · '),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: isOverdue ? theme.colorScheme.error : null),
        ),
        trailing: followUp.priority == 'high'
            ? Icon(Icons.priority_high, color: theme.colorScheme.error)
            : null,
      ),
    );
  }
}
