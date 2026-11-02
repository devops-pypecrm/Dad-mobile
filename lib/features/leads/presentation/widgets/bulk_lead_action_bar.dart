import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/role_utils.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../providers/bulk_lead_actions_controller.dart';
import 'bulk_assign_sheet.dart';
import 'bulk_status_sheet.dart';

const _coral = Color(0xFFFF6B4A);

/// Floating toolbar shown while the Leads list is in bulk-selection mode —
/// mirrors Dad-frontend's bulk-action toolbar on `/leads`
/// (`BulkAssignDialog`/`BulkStatusDialog`), hitting the same
/// `/api/bulk/leads` endpoint. "Update status" and "Delete" are hidden for
/// anyone who isn't an org admin or manager, matching that endpoint's
/// server-side role gate (`bulkOperationsController.ts`'s `update-status`/
/// `delete` cases) — not shown at all rather than shown-then-403'd.
class BulkLeadActionBar extends ConsumerWidget {
  const BulkLeadActionBar({super.key, required this.selectedIds, required this.onDone});

  final List<String> selectedIds;
  final VoidCallback onDone;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete leads?'),
        content: Text('Delete ${selectedIds.length} lead(s)? This can\'t be undone from here.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete', style: TextStyle(color: _coral)),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final success = await ref
        .read(bulkLeadActionsControllerProvider.notifier)
        .run(action: 'delete', leadIds: selectedIds);
    if (!context.mounted) return;
    if (success) {
      onDone();
      showAppSnackBar(context, '${selectedIds.length} lead(s) deleted.');
    } else {
      final error = ref.read(bulkLeadActionsControllerProvider).error;
      showAppSnackBar(context, "Couldn't delete leads: $error", isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final role = ref.watch(sessionControllerProvider).valueOrNull?.role;
    final canManage = isOrgAdminRole(role) || isManagerRole(role);
    final isLoading = ref.watch(bulkLeadActionsControllerProvider).isLoading;

    return Material(
      elevation: 8,
      color: theme.colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Row(
            children: [
              IconButton(onPressed: onDone, icon: const Icon(Icons.close)),
              Text('${selectedIds.length} selected', style: theme.textTheme.titleMedium),
              const Spacer(),
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
                ),
              _ActionIcon(
                icon: Icons.person_add_alt_outlined,
                label: 'Assign',
                enabled: !isLoading && selectedIds.isNotEmpty,
                onTap: () => showBulkAssignSheet(context, ref, selectedIds),
              ),
              if (canManage)
                _ActionIcon(
                  icon: Icons.flag_outlined,
                  label: 'Status',
                  enabled: !isLoading && selectedIds.isNotEmpty,
                  onTap: () => showBulkStatusSheet(context, ref, selectedIds),
                ),
              if (canManage)
                _ActionIcon(
                  icon: Icons.delete_outline,
                  label: 'Delete',
                  color: _coral,
                  enabled: !isLoading && selectedIds.isNotEmpty,
                  onTap: () => _confirmDelete(context, ref),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.enabled,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool enabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? Theme.of(context).colorScheme.primary;
    return IconButton(
      tooltip: label,
      onPressed: enabled ? onTap : null,
      icon: Icon(icon, color: enabled ? resolvedColor : Theme.of(context).disabledColor),
    );
  }
}
