import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/text_format.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../dashboard/domain/branch.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/lead.dart';
import '../../providers/leads_list_provider.dart';

/// Filter bottom sheet for the Leads list — Status/Source/Owner/Branch/Date
/// range, all forwarded to the same `GET /api/leads` query params the web
/// Leads list uses (Dad-frontend/src/pages/leads/index.tsx). Staged locally
/// until "Apply", same UX as a filter panel, not applied per-tap.
Future<void> showLeadsFilterSheet(BuildContext context, WidgetRef ref) {
  final current = ref.read(leadsListProvider).valueOrNull;
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => _LeadsFilterSheet(current: current),
  );
}

class _LeadsFilterSheet extends ConsumerStatefulWidget {
  const _LeadsFilterSheet({required this.current});

  final LeadsListState? current;

  @override
  ConsumerState<_LeadsFilterSheet> createState() => _LeadsFilterSheetState();
}

class _LeadsFilterSheetState extends ConsumerState<_LeadsFilterSheet> {
  late String? _status = widget.current?.status;
  late String? _source = widget.current?.source;
  late String? _assignedTo = widget.current?.assignedTo;
  late String? _branchId = widget.current?.branchId;
  late DateTime? _startDate = widget.current?.startDate;
  late DateTime? _endDate = widget.current?.endDate;

  Future<void> _pickDate({required bool isStart}) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
      initialDate: (isStart ? _startDate : _endDate) ?? DateTime.now(),
    );
    if (date == null) return;
    setState(() => isStart ? _startDate = date : _endDate = date);
  }

  void _apply() {
    ref.read(leadsListProvider.notifier).applyFilters(
          search: widget.current?.search,
          status: _status,
          source: _source,
          assignedTo: _assignedTo,
          branchId: _branchId,
          startDate: _startDate,
          endDate: _endDate,
          sortBy: widget.current?.sortBy,
          sortOrder: widget.current?.sortOrder,
        );
    Navigator.of(context).pop();
  }

  void _clearAll() {
    setState(() {
      _status = null;
      _source = null;
      _assignedTo = null;
      _branchId = null;
      _startDate = null;
      _endDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final leadStatuses = ref.watch(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;
    final usersAsync = ref.watch(hierarchyUsersProvider);
    final branchesAsync = ref.watch(dashboardBranchesProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(child: Text('Filters', style: theme.textTheme.titleLarge)),
                  TextButton(onPressed: _clearAll, child: const Text('Clear All')),
                ],
              ),
              const SizedBox(height: 12),

              Text('Pipeline Stage', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _status,
                decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
                items: [
                  const DropdownMenuItem(value: null, child: Text('All statuses')),
                  for (final option in (leadStatuses ?? const []))
                    DropdownMenuItem(value: option.id, child: Text(option.label ?? option.id)),
                ],
                onChanged: (value) => setState(() => _status = value),
              ),
              const SizedBox(height: 16),

              Text('Source', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _source,
                decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
                items: [
                  const DropdownMenuItem(value: null, child: Text('All sources')),
                  for (final source in kSelectableLeadSources)
                    DropdownMenuItem(value: source, child: Text(humanizeSnakeCase(source))),
                ],
                onChanged: (value) => setState(() => _source = value),
              ),
              const SizedBox(height: 16),

              Text('Owner', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              usersAsync.when(
                data: (users) => DropdownButtonFormField<String?>(
                  initialValue: _assignedTo,
                  isExpanded: true,
                  decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('All owners')),
                    for (final user in users)
                      DropdownMenuItem(value: user.id, child: Text(user.fullName, overflow: TextOverflow.ellipsis)),
                  ],
                  onChanged: (value) => setState(() => _assignedTo = value),
                ),
                loading: () => const LinearProgressIndicator(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),

              branchesAsync.valueOrNull != null && branchesAsync.valueOrNull!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Branch', style: theme.textTheme.labelLarge),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String?>(
                          initialValue: _branchId,
                          isExpanded: true,
                          decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
                          items: [
                            const DropdownMenuItem(value: null, child: Text('All branches')),
                            for (final Branch branch in branchesAsync.value!)
                              DropdownMenuItem(value: branch.id, child: Text(branch.name, overflow: TextOverflow.ellipsis)),
                          ],
                          onChanged: (value) => setState(() => _branchId = value),
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : const SizedBox.shrink(),

              Text('Created Date Range', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _pickDate(isStart: true),
                      child: Text(_startDate == null ? 'From' : '${_startDate!.toLocal()}'.split(' ').first),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _pickDate(isStart: false),
                      child: Text(_endDate == null ? 'To' : '${_endDate!.toLocal()}'.split(' ').first),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(onPressed: _apply, child: const Text('Apply Filters')),
            ],
          ),
        ),
      ),
    );
  }
}
