import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../dashboard/domain/branch.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../providers/call_logs_list_provider.dart';

/// Filter bottom sheet for Call Logs — Direction/Status/Branch/Agent,
/// forwarded to the same `GET /api/calls` query params the web `/calls`
/// page uses. Same staged-until-Apply UX as [showLeadsFilterSheet].
Future<void> showCallLogsFilterSheet(BuildContext context, WidgetRef ref) {
  final current = ref.read(callLogsListProvider).valueOrNull;
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => _CallLogsFilterSheet(current: current),
  );
}

class _CallLogsFilterSheet extends ConsumerStatefulWidget {
  const _CallLogsFilterSheet({required this.current});

  final CallLogsListState? current;

  @override
  ConsumerState<_CallLogsFilterSheet> createState() =>
      _CallLogsFilterSheetState();
}

class _CallLogsFilterSheetState extends ConsumerState<_CallLogsFilterSheet> {
  late String? _direction = widget.current?.direction;
  late String? _status = widget.current?.status;
  late String? _branchId = widget.current?.branchId;
  late String? _userId = widget.current?.userId;

  void _apply() {
    ref
        .read(callLogsListProvider.notifier)
        .applyFilters(
          direction: _direction,
          status: _status,
          branchId: _branchId,
          userId: _userId,
        );
    Navigator.of(context).pop();
  }

  void _clearAll() {
    setState(() {
      _direction = null;
      _status = null;
      _branchId = null;
      _userId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Server-scoped list, matching web's Agent filter (`getUsers()`) — not
    // `hierarchyUsersProvider`, which is unrestricted and only correct as
    // input to the Assign-lead picker's own client-side BFS.
    final usersAsync = ref.watch(scopedUsersProvider);
    final branchesAsync = ref.watch(dashboardBranchesProvider);

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: sheetBottomPadding(context),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Filters', style: theme.textTheme.titleLarge),
                  ),
                  TextButton(
                    onPressed: _clearAll,
                    child: const Text('Clear All'),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Text('Direction', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _direction,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: null, child: Text('All directions')),
                  DropdownMenuItem(value: 'inbound', child: Text('Inbound')),
                  DropdownMenuItem(value: 'outbound', child: Text('Outbound')),
                ],
                onChanged: (value) => setState(() => _direction = value),
              ),
              const SizedBox(height: 16),

              Text('Status', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _status,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: null, child: Text('All statuses')),
                  DropdownMenuItem(
                    value: 'completed',
                    child: Text('Completed'),
                  ),
                  DropdownMenuItem(value: 'missed', child: Text('Missed')),
                  DropdownMenuItem(value: 'busy', child: Text('Busy')),
                  DropdownMenuItem(value: 'failed', child: Text('Failed')),
                ],
                onChanged: (value) => setState(() => _status = value),
              ),
              const SizedBox(height: 16),

              branchesAsync.valueOrNull != null &&
                      branchesAsync.valueOrNull!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Branch', style: theme.textTheme.labelLarge),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String?>(
                          initialValue: _branchId,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            const DropdownMenuItem(
                              value: null,
                              child: Text('All branches'),
                            ),
                            for (final Branch branch in branchesAsync.value!)
                              DropdownMenuItem(
                                value: branch.id,
                                child: Text(
                                  branch.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                          onChanged: (value) =>
                              setState(() => _branchId = value),
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : const SizedBox.shrink(),

              usersAsync.valueOrNull != null &&
                      usersAsync.valueOrNull!.length > 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Agent', style: theme.textTheme.labelLarge),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String?>(
                          initialValue: _userId,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            const DropdownMenuItem(
                              value: null,
                              child: Text('All agents'),
                            ),
                            for (final user in usersAsync.value!)
                              DropdownMenuItem(
                                value: user.id,
                                child: Text(
                                  user.fullName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                          onChanged: (value) => setState(() => _userId = value),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),

              const SizedBox(height: 24),
              FilledButton(
                onPressed: _apply,
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
