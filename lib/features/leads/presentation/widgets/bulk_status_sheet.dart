import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../providers/bulk_lead_actions_controller.dart';

/// Bulk "Update status" picker. Server-side gated to org admin/manager —
/// this sheet is only ever opened from the bulk action bar after the same
/// check client-side, so a non-admin never sees the option, but the real
/// enforcement is the backend's 403.
Future<bool?> showBulkStatusSheet(BuildContext context, WidgetRef ref, List<String> leadIds) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _BulkStatusSheet(leadIds: leadIds),
  );
}

class _BulkStatusSheet extends ConsumerWidget {
  const _BulkStatusSheet({required this.leadIds});

  final List<String> leadIds;

  static const _fallback = ['new', 'contacted', 'qualified', 'converted', 'lost'];

  Future<void> _setStatus(BuildContext context, WidgetRef ref, String status) async {
    final success = await ref
        .read(bulkLeadActionsControllerProvider.notifier)
        .run(action: 'update-status', leadIds: leadIds, data: {'status': status});
    if (!context.mounted) return;
    if (success) {
      Navigator.of(context).pop(true);
      showAppSnackBar(context, '${leadIds.length} lead(s) updated.');
    } else {
      final error = ref.read(bulkLeadActionsControllerProvider).error;
      showAppSnackBar(context, "Couldn't update status: $error", isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final leadStatuses = ref.watch(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;
    final isLoading = ref.watch(bulkLeadActionsControllerProvider).isLoading;

    final options = (leadStatuses != null && leadStatuses.isNotEmpty)
        ? leadStatuses
        : null;
    final ids = options?.map((o) => o.id).toList() ?? _fallback;
    final labelFor = {for (final o in (options ?? const [])) o.id: o.label ?? o.id};

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, sheetBottomPadding(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update status for ${leadIds.length} lead(s)',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (isLoading) const LinearProgressIndicator(),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ids.length,
                itemBuilder: (context, index) {
                  final id = ids[index];
                  return ListTile(
                    title: Text(labelFor[id] ?? id),
                    onTap: isLoading ? null : () => _setStatus(context, ref, id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
