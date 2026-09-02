import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../dashboard/domain/branch.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/followup.dart';
import '../../domain/followups_list_state.dart';
import '../../providers/followups_list_controller.dart';

const _sortOptions = [
  ('dueDate', 'asc', 'Due Date (Earliest)'),
  ('dueDate', 'desc', 'Due Date (Latest)'),
  ('priority', 'desc', 'Priority (High to Low)'),
  ('assignedTo', 'asc', 'User (A-Z)'),
  ('status', 'asc', 'Status (A-Z)'),
  ('subject', 'asc', 'Subject (A-Z)'),
];

const _statusLabels = {
  'all': 'All Status',
  kFollowUpNotStarted: 'Not Started',
  kFollowUpInProgress: 'In Progress',
  kFollowUpCompleted: 'Completed',
  kFollowUpDeferred: 'Deferred',
};

/// Filter/sort sheet for the Follow Ups tab — same fields as
/// Dad-frontend/src/pages/follow-ups/index.tsx's filter panel: Sort,
/// Status, Branch (only if the caller has more than one to choose from),
/// Owner, plus a due-date picker (single day or a from/to range) the web
/// page doesn't have as a distinct control (it only offers the
/// Active/Overdue/Today/Upcoming quick cards) but the backend's `dueDate`
/// field supports filtering on client-side just as well.
Future<void> showFollowUpsFilterSheet(BuildContext context, WidgetRef ref) {
  final current = ref.read(followUpsListControllerProvider).valueOrNull;
  return showModalBottomSheet<void>(
    context: context,
    // The Follow Ups tab lives inside `AppShell`'s `ShellRoute` — without
    // this, the sheet pushes onto the shell's nested Navigator and renders
    // BEHIND the floating bottom nav bar, burying "Apply Filters".
    useRootNavigator: true,
    isScrollControlled: true,
    builder: (context) => _FollowUpsFilterSheet(current: current),
  );
}

class _FollowUpsFilterSheet extends ConsumerStatefulWidget {
  const _FollowUpsFilterSheet({required this.current});

  final FollowUpsListState? current;

  @override
  ConsumerState<_FollowUpsFilterSheet> createState() =>
      _FollowUpsFilterSheetState();
}

class _FollowUpsFilterSheetState extends ConsumerState<_FollowUpsFilterSheet> {
  late String _sortBy = widget.current?.sortBy ?? 'dueDate';
  late String _sortOrder = widget.current?.sortOrder ?? 'asc';
  late String _status = widget.current?.status ?? 'all';
  late String? _branchId = widget.current?.branchId;
  late String? _userId = widget.current?.userId;

  // Due-date filter is local-only until Apply; not synced to server filters.
  late bool _useRange =
      widget.current?.dueDateFrom != null || widget.current?.dueDateTo != null;
  late DateTime? _singleDate = widget.current?.dueDateSingle;
  late DateTime? _fromDate = widget.current?.dueDateFrom;
  late DateTime? _toDate = widget.current?.dueDateTo;

  Future<void> _pickDate({required bool isFrom}) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2015),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      initialDate:
          (_useRange ? (isFrom ? _fromDate : _toDate) : _singleDate) ??
          DateTime.now(),
    );
    if (date == null) return;
    setState(() {
      if (_useRange) {
        if (isFrom) {
          _fromDate = date;
        } else {
          _toDate = date;
        }
      } else {
        _singleDate = date;
      }
    });
  }

  void _apply() {
    // One atomic call — everything (server-side filters, quick-filter,
    // due-date, sort) applied together in a single state transition. See
    // `FollowUpsListController.applyFilters`'s doc comment for why this
    // must NOT be split into several sequential calls (that's what caused
    // sort/due-date choices to silently get dropped before).
    ref
        .read(followUpsListControllerProvider.notifier)
        .applyFilters(
          search: widget.current?.search,
          status: _status,
          branchId: _branchId,
          userId: _userId,
          quickFilter: null,
          dueDateSingle: _useRange ? null : _singleDate,
          dueDateFrom: _useRange ? _fromDate : null,
          dueDateTo: _useRange ? _toDate : null,
          sortBy: _sortBy,
          sortOrder: _sortOrder,
        );
    Navigator.of(context).pop();
  }

  void _showAll() {
    ref.read(followUpsListControllerProvider.notifier).showAll();
    Navigator.of(context).pop();
  }

  void _clearAll() {
    ref.read(followUpsListControllerProvider.notifier).clearAllFilters();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Server-scoped list, matching web's Owner filter (`getUsers()`) — not
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
                    onPressed: _showAll,
                    child: const Text('Show All'),
                  ),
                  TextButton(
                    onPressed: _clearAll,
                    child: const Text('Clear All'),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Text('Sort By', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<(String, String)>(
                initialValue: (_sortBy, _sortOrder),
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: [
                  for (final (sortBy, sortOrder, label) in _sortOptions)
                    DropdownMenuItem(
                      value: (sortBy, sortOrder),
                      child: Text(label),
                    ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _sortBy = value.$1;
                    _sortOrder = value.$2;
                  });
                },
              ),
              const SizedBox(height: 16),

              Text('Status', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: _status,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: [
                  for (final entry in _statusLabels.entries)
                    DropdownMenuItem(
                      value: entry.key,
                      child: Text(entry.value),
                    ),
                ],
                onChanged: (value) => setState(() => _status = value ?? 'all'),
              ),
              const SizedBox(height: 16),

              if (branchesAsync.valueOrNull != null &&
                  branchesAsync.valueOrNull!.isNotEmpty) ...[
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
                      child: Text('All Branches'),
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
                  onChanged: (value) => setState(() => _branchId = value),
                ),
                const SizedBox(height: 16),
              ],

              Text('User', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              usersAsync.when(
                data: (users) => DropdownButtonFormField<String?>(
                  initialValue: _userId,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text('All Users'),
                    ),
                    for (final user in users)
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
                loading: () => const LinearProgressIndicator(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Text('Due Date', style: theme.textTheme.labelLarge),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Range'),
                      Switch(
                        value: _useRange,
                        onChanged: (value) => setState(() => _useRange = value),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),
              if (_useRange)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _pickDate(isFrom: true),
                        child: Text(
                          _fromDate == null
                              ? 'From'
                              : '${_fromDate!.toLocal()}'.split(' ').first,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _pickDate(isFrom: false),
                        child: Text(
                          _toDate == null
                              ? 'To'
                              : '${_toDate!.toLocal()}'.split(' ').first,
                        ),
                      ),
                    ),
                  ],
                )
              else
                OutlinedButton(
                  onPressed: () => _pickDate(isFrom: true),
                  child: Text(
                    _singleDate == null
                        ? 'Select a date'
                        : '${_singleDate!.toLocal()}'.split(' ').first,
                  ),
                ),
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
