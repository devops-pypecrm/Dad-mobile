import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/utils/text_format.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/opportunity.dart';
import '../../providers/opportunities_list_provider.dart';

/// Filter bottom sheet for the Opportunities list — Deal Stage/Deal Type/
/// Source/Sales Owner/Date range, all forwarded to the same
/// `GET /api/opportunities` query params the web Opportunities list uses
/// (Dad-frontend/src/pages/opportunities/index.tsx). Staged locally until
/// "Apply", same UX as `leads_filter_sheet.dart`.
///
/// [showOwnerFilter] gates the Sales Owner dropdown — pass `false` for a
/// caller with no team (plain sales rep): the backend already forces their
/// results to just their own opportunities, so an Owner picker would be a
/// no-op for them.
Future<void> showOpportunitiesFilterSheet(
  BuildContext context,
  WidgetRef ref, {
  required bool showOwnerFilter,
}) {
  final current = ref.read(opportunitiesListProvider).valueOrNull;
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => _OpportunitiesFilterSheet(
      current: current,
      showOwnerFilter: showOwnerFilter,
    ),
  );
}

const _stageOptions = [
  (null, 'All stages'),
  ('expected', 'Expected'),
  ('closed_won', 'Closed Won'),
  ('closed_lost', 'Closed Lost'),
];

const _typeOptions = [
  (null, 'All types'),
  ('NEW_BUSINESS', 'New Business'),
  ('UPSALE', 'Upsale'),
];

class _OpportunitiesFilterSheet extends ConsumerStatefulWidget {
  const _OpportunitiesFilterSheet({
    required this.current,
    required this.showOwnerFilter,
  });

  final OpportunitiesListState? current;
  final bool showOwnerFilter;

  @override
  ConsumerState<_OpportunitiesFilterSheet> createState() =>
      _OpportunitiesFilterSheetState();
}

class _OpportunitiesFilterSheetState
    extends ConsumerState<_OpportunitiesFilterSheet> {
  late String? _stage = widget.current?.stage;
  late String? _type = widget.current?.type;
  late String? _leadSource = widget.current?.leadSource;
  late String? _ownerId = widget.current?.ownerId;
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
    ref
        .read(opportunitiesListProvider.notifier)
        .applyFilters(
          search: widget.current?.search,
          stage: _stage,
          type: _type,
          leadSource: _leadSource,
          ownerId: widget.showOwnerFilter ? _ownerId : widget.current?.ownerId,
          startDate: _startDate,
          endDate: _endDate,
          scope: widget.current?.scope,
        );
    Navigator.of(context).pop();
  }

  void _clearAll() {
    setState(() {
      _stage = null;
      _type = null;
      _leadSource = null;
      _ownerId = null;
      _startDate = null;
      _endDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Server-scoped list, matching web's Owner filter (`getUsers()`) — not
    // `hierarchyUsersProvider`, which is unrestricted and only correct as
    // input to the Assign-lead picker's own client-side BFS.
    final usersAsync = ref.watch(scopedUsersProvider);

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

              Text('Deal Stage', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _stage,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: [
                  for (final (value, label) in _stageOptions)
                    DropdownMenuItem(value: value, child: Text(label)),
                ],
                onChanged: (value) => setState(() => _stage = value),
              ),
              const SizedBox(height: 16),

              Text('Deal Type', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _type,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: [
                  for (final (value, label) in _typeOptions)
                    DropdownMenuItem(value: value, child: Text(label)),
                ],
                onChanged: (value) => setState(() => _type = value),
              ),
              const SizedBox(height: 16),

              Text('Source', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _leadSource,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('All sources'),
                  ),
                  for (final source in kSelectableOpportunitySources)
                    DropdownMenuItem(
                      value: source,
                      child: Text(humanizeSnakeCase(source)),
                    ),
                ],
                onChanged: (value) => setState(() => _leadSource = value),
              ),
              const SizedBox(height: 16),

              if (widget.showOwnerFilter) ...[
                Text('Sales Owner', style: theme.textTheme.labelLarge),
                const SizedBox(height: 6),
                usersAsync.when(
                  data: (users) => DropdownButtonFormField<String?>(
                    initialValue: _ownerId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('All owners'),
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
                    onChanged: (value) => setState(() => _ownerId = value),
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (_, _) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 16),
              ],

              Text('Created Date Range', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _pickDate(isStart: true),
                      child: Text(
                        _startDate == null
                            ? 'From'
                            : '${_startDate!.toLocal()}'.split(' ').first,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _pickDate(isStart: false),
                      child: Text(
                        _endDate == null
                            ? 'To'
                            : '${_endDate!.toLocal()}'.split(' ').first,
                      ),
                    ),
                  ),
                ],
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
