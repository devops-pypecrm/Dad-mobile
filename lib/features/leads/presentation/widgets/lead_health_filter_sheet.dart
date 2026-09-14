import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/utils/text_format.dart';
import '../../../dashboard/domain/dashboard_date_range.dart';
import '../../../dashboard/presentation/widgets/date_range_filter_sheet.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/lead.dart';

class LeadHealthFilters {
  const LeadHealthFilters({required this.dateRange, this.assignedTo, this.source});

  final DashboardDateRange dateRange;
  final String? assignedTo;
  final String? source;
}

/// Filter sheet for the Unattended/No Activity Leads screens — Date range
/// (This Month/Last Month/Custom, no "All Time": these are inherently
/// time-bound "gone stale" views, not an all-time browse) + User (only
/// shown when the caller actually has someone else visible to filter to —
/// a plain sales_rep with nobody reporting to them only ever sees
/// themself, so there's nothing to pick) + Source, same options as the
/// main Leads list's filter sheet (`leads_filter_sheet.dart`).
Future<LeadHealthFilters> showLeadHealthFilterSheet(
  BuildContext context, {
  required LeadHealthFilters current,
}) async {
  final result = await showModalBottomSheet<LeadHealthFilters>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    builder: (context) => _LeadHealthFilterSheet(current: current),
  );
  return result ?? current;
}

class _LeadHealthFilterSheet extends ConsumerStatefulWidget {
  const _LeadHealthFilterSheet({required this.current});

  final LeadHealthFilters current;

  @override
  ConsumerState<_LeadHealthFilterSheet> createState() => _LeadHealthFilterSheetState();
}

class _LeadHealthFilterSheetState extends ConsumerState<_LeadHealthFilterSheet> {
  late DashboardDateRange _dateRange = widget.current.dateRange;
  late String? _assignedTo = widget.current.assignedTo;
  late String? _source = widget.current.source;

  Future<void> _pickDateRange() async {
    final picked = await showDashboardDateRangeFilterSheet(
      context,
      selected: _dateRange,
      presets: const [
        DashboardRangePeriod.thisMonth,
        DashboardRangePeriod.lastMonth,
        DashboardRangePeriod.custom,
      ],
    );
    setState(() => _dateRange = picked);
  }

  void _apply() => Navigator.of(context).pop(
        LeadHealthFilters(dateRange: _dateRange, assignedTo: _assignedTo, source: _source),
      );

  void _clearAll() => setState(() {
        _dateRange = DashboardDateRange.thisMonth();
        _assignedTo = null;
        _source = null;
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Server-scoped list (self+subordinates, or everyone for admin) — same
    // provider the main Leads filter sheet's Owner field and Create Lead's
    // assignee picker use. Length <= 1 means nobody else is visible to
    // filter to at all.
    final usersAsync = ref.watch(scopedUsersProvider);
    final canFilterByUser = (usersAsync.valueOrNull?.length ?? 0) > 1;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: sheetBottomPadding(context)),
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

              Text('Date Range', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              OutlinedButton.icon(
                onPressed: _pickDateRange,
                icon: const Icon(Icons.calendar_today_outlined, size: 16),
                label: Align(alignment: Alignment.centerLeft, child: Text(_dateRange.label)),
                style: OutlinedButton.styleFrom(alignment: Alignment.centerLeft),
              ),
              const SizedBox(height: 16),

              if (canFilterByUser) ...[
                Text('User', style: theme.textTheme.labelLarge),
                const SizedBox(height: 6),
                usersAsync.when(
                  data: (users) => DropdownButtonFormField<String?>(
                    initialValue: _assignedTo,
                    isExpanded: true,
                    decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All users')),
                      for (final user in users)
                        DropdownMenuItem(value: user.id, child: Text(user.fullName, overflow: TextOverflow.ellipsis)),
                    ],
                    onChanged: (value) => setState(() => _assignedTo = value),
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (_, _) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 16),
              ],

              Text('Source', style: theme.textTheme.labelLarge),
              const SizedBox(height: 6),
              DropdownButtonFormField<String?>(
                initialValue: _source,
                isExpanded: true,
                decoration: const InputDecoration(isDense: true, border: OutlineInputBorder()),
                items: [
                  const DropdownMenuItem(value: null, child: Text('All sources')),
                  for (final source in kSelectableLeadSources)
                    DropdownMenuItem(value: source, child: Text(humanizeSnakeCase(source))),
                ],
                onChanged: (value) => setState(() => _source = value),
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
