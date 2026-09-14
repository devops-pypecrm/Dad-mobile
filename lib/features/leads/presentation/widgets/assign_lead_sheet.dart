import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/lead.dart';
import '../../providers/assign_lead_controller.dart';

const _brandColor = Color(0xFF578732);

/// "Assign Lead" bottom sheet — same picker + subordinate-scoping rule as
/// Dad-frontend's `AssignLeadDialog.tsx`: admins/super_admins can assign to
/// anyone, everyone else only to themself or a descendant in the reporting
/// hierarchy.
Future<void> showAssignLeadSheet(
  BuildContext context,
  WidgetRef ref,
  Lead lead,
) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    // Missing here (unlike every other tall sheet in this app —
    // create_lead_screen.dart, close_deal_sheet.dart, etc.) is exactly why
    // the "Assign Lead" title could render up under the status bar on an
    // admin/manager/team-lead account with a long assignable-user list: the
    // sheet's outer Material container was free to grow all the way to the
    // very top of the screen (y=0), and only the CONTENT inside it was
    // padded clear of the status bar via the inner `SafeArea` below — not
    // the sheet's own bounds. `useSafeArea: true` caps the sheet's own
    // height at the safe area from the start, matching the rest of the app.
    useSafeArea: true,
    // On top of `useSafeArea`, also leave visible breathing room below the
    // status bar (rather than letting the sheet grow edge-to-edge right up
    // to that safe-area line) — reads less like a full screen and more like
    // an overlay, even with a long assignable-user list.
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height -
          MediaQuery.paddingOf(context).top -
          32,
    ),
    builder: (context) => _AssignLeadSheet(lead: lead),
  );
}

class _AssignLeadSheet extends ConsumerStatefulWidget {
  const _AssignLeadSheet({required this.lead});

  final Lead lead;

  @override
  ConsumerState<_AssignLeadSheet> createState() => _AssignLeadSheetState();
}

class _AssignLeadSheetState extends ConsumerState<_AssignLeadSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final usersAsync = ref.watch(hierarchyUsersProvider);
    final assignState = ref.watch(assignLeadControllerProvider(widget.lead.id));

    ref.listen(assignLeadControllerProvider(widget.lead.id), (previous, next) {
      if (next.hasError && !next.isLoading) {
        showAppSnackBar(context, next.error.toString(), isError: true);
      } else if (previous?.isLoading == true &&
          !next.isLoading &&
          !next.hasError) {
        Navigator.of(context).pop();
        showAppSnackBar(context, 'Lead reassigned.');
      }
    });

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, sheetBottomPadding(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // A plain visual affordance signaling "this sheet can be swiped
            // down to dismiss" — this sheet has no visible AppBar/close
            // button, so without it there's no hint at all that it isn't a
            // full permanent screen.
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
              'Assign Lead',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Select a user to assign this lead to.',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            if (assignState.isLoading) const LinearProgressIndicator(),
            // A plain admin/manager/team-lead's assignable list can run to
            // dozens of names (everyone or a whole subordinate tree) — a
            // search field here matters for them specifically, but it's
            // harmless (just unused) for a rep who only ever sees a
            // handful, so it's simplest to always show it rather than
            // branch on role.
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Search users…',
                prefixIcon: const Icon(Icons.search, color: _brandColor),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () => setState(() {
                          _searchController.clear();
                          _query = '';
                        }),
                      ),
                isDense: true,
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outlineVariant,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outlineVariant,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: _brandColor, width: 1.5),
                ),
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
                      : assignable
                            .where(
                              (u) => u.fullName.toLowerCase().contains(query),
                            )
                            .toList();

                  if (users.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        query.isEmpty
                            ? 'No assignable users found.'
                            : 'No users match "$_query".',
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      final isCurrent = widget.lead.assignedTo?.id == user.id;
                      return ListTile(
                        title: Text(user.fullName),
                        subtitle: user.role != null ? Text(user.role!) : null,
                        trailing: isCurrent
                            ? const Icon(Icons.check, color: _brandColor)
                            : null,
                        selected: isCurrent,
                        selectedTileColor: _brandColor.withValues(alpha: 0.08),
                        onTap: assignState.isLoading
                            ? null
                            : () => ref
                                  .read(
                                    assignLeadControllerProvider(
                                      widget.lead.id,
                                    ).notifier,
                                  )
                                  .assignTo(user.id),
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
