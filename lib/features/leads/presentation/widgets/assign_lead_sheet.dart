import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/providers/session_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/lead.dart';
import '../../providers/assign_lead_controller.dart';

/// "Assign Lead" bottom sheet — same picker + subordinate-scoping rule as
/// Dad-frontend's `AssignLeadDialog.tsx`: admins/super_admins can assign to
/// anyone, everyone else only to themself or a descendant in the reporting
/// hierarchy.
Future<void> showAssignLeadSheet(BuildContext context, WidgetRef ref, Lead lead) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => _AssignLeadSheet(lead: lead),
  );
}

class _AssignLeadSheet extends ConsumerWidget {
  const _AssignLeadSheet({required this.lead});

  final Lead lead;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final usersAsync = ref.watch(hierarchyUsersProvider);
    final assignState = ref.watch(assignLeadControllerProvider(lead.id));

    ref.listen(assignLeadControllerProvider(lead.id), (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(next.error.toString())));
      } else if (previous?.isLoading == true && !next.isLoading && !next.hasError) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lead reassigned.')));
      }
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Assign Lead', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              'Select a user to assign this lead to.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            if (assignState.isLoading) const LinearProgressIndicator(),
            Flexible(
              child: usersAsync.when(
                data: (allUsers) {
                  final users = session == null
                      ? allUsers
                      : assignableUsers(
                          allUsers: allUsers,
                          currentUserId: session.id,
                          currentUserRole: session.role,
                        );
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
                      final isCurrent = lead.assignedTo?.id == user.id;
                      return ListTile(
                        title: Text(user.fullName),
                        subtitle: user.role != null ? Text(user.role!) : null,
                        trailing: isCurrent ? const Icon(Icons.check) : null,
                        onTap: assignState.isLoading
                            ? null
                            : () => ref.read(assignLeadControllerProvider(lead.id).notifier).assignTo(user.id),
                      );
                    },
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Padding(
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
