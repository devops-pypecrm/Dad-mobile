import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../providers/bulk_lead_actions_controller.dart';


/// Bulk "Assign" picker — same subordinate-scoping rule as the single-lead
/// `AssignLeadSheet`: admins/super_admins can assign to anyone, everyone
/// else only to themself or a descendant in the reporting hierarchy.
Future<void> showBulkAssignSheet(BuildContext context, WidgetRef ref, List<String> leadIds) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).top - 32,
    ),
    builder: (context) => _BulkAssignSheet(leadIds: leadIds),
  );
}

class _BulkAssignSheet extends ConsumerStatefulWidget {
  const _BulkAssignSheet({required this.leadIds});

  final List<String> leadIds;

  @override
  ConsumerState<_BulkAssignSheet> createState() => _BulkAssignSheetState();
}

class _BulkAssignSheetState extends ConsumerState<_BulkAssignSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _assignTo(String userId) async {
    final success = await ref
        .read(bulkLeadActionsControllerProvider.notifier)
        .run(action: 'assign', leadIds: widget.leadIds, data: {'assignedToId': userId});
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
      showAppSnackBar(context, '${widget.leadIds.length} lead(s) assigned.');
    } else {
      final error = ref.read(bulkLeadActionsControllerProvider).error;
      showAppSnackBar(context, "Couldn't assign leads: $error", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final usersAsync = ref.watch(hierarchyUsersProvider);
    final isLoading = ref.watch(bulkLeadActionsControllerProvider).isLoading;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, sheetBottomPadding(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              'Assign ${widget.leadIds.length} lead(s)',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (isLoading) const LinearProgressIndicator(),
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Search users…',
                prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
                isDense: true,
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: usersAsync.when(
                data: (allUsers) {
                  final assignable = session == null
                      ? allUsers
                      : assignableUsers(
                          allUsers: allUsers,
                          currentUserId: session.id,
                          currentUserRole: session.role,
                        );
                  final query = _query.trim().toLowerCase();
                  final users = query.isEmpty
                      ? assignable
                      : assignable.where((u) => u.fullName.toLowerCase().contains(query)).toList();

                  if (users.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text('No assignable users found.'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user.fullName),
                        subtitle: user.role != null ? Text(user.role!) : null,
                        onTap: isLoading ? null : () => _assignTo(user.id),
                      );
                    },
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Failed to load users: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
