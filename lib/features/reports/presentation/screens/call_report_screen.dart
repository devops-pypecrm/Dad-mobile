import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/role_utils.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../domain/daily_report.dart';
import '../../providers/reports_providers.dart';
import '../widgets/daily_report_pdf.dart';

const _brandColor = Color(0xFF578732);
final _dateFormat = DateFormat('yyyy-MM-dd');

const _periods = [
  ('today', 'Today'),
  ('yesterday', 'Yesterday'),
  ('today-yesterday', 'Today & Yesterday'),
  ('last-7-days', 'Last 7 days'),
  ('last-14-days', 'Last 14 days'),
  ('last-28-days', 'Last 28 days'),
  ('last-30-days', 'Last 30 days'),
  // Same 4 presets as Dashboard/Reports' date-range filter, added
  // alongside the day-granular ones above rather than replacing them —
  // both are genuinely useful for a call report, at different zoom levels.
  ('thisMonth', 'This Month'),
  ('lastMonth', 'Last Month'),
  ('allTime', 'All Time'),
  ('custom', 'Custom Range'),
];

/// [customRange] is only consulted for `period == 'custom'`.
(DateTime, DateTime) _dateRangeFor(String period, DateTimeRange? customRange) {
  final today = DateTime.now();
  final startOfToday = DateTime(today.year, today.month, today.day);
  switch (period) {
    case 'today':
      return (startOfToday, startOfToday);
    case 'yesterday':
      final yesterday = startOfToday.subtract(const Duration(days: 1));
      return (yesterday, yesterday);
    case 'today-yesterday':
      return (startOfToday.subtract(const Duration(days: 1)), startOfToday);
    case 'last-7-days':
      return (startOfToday.subtract(const Duration(days: 6)), startOfToday);
    case 'last-14-days':
      return (startOfToday.subtract(const Duration(days: 13)), startOfToday);
    case 'last-28-days':
      return (startOfToday.subtract(const Duration(days: 27)), startOfToday);
    case 'last-30-days':
      return (startOfToday.subtract(const Duration(days: 29)), startOfToday);
    case 'thisMonth':
      return (DateTime(today.year, today.month, 1), startOfToday);
    case 'lastMonth':
      return (DateTime(today.year, today.month - 1, 1), DateTime(today.year, today.month, 0));
    case 'allTime':
      // No true "omit the filter" mode on `getDailyReport` (startDate/endDate
      // are always applied once either is present) — a far-past start date
      // is the same trick the backend's own callers use elsewhere for this.
      return (DateTime(2000, 1, 1), startOfToday);
    case 'custom':
      return customRange == null ? (startOfToday, startOfToday) : (customRange.start, customRange.end);
    default:
      return (startOfToday, startOfToday);
  }
}

String _periodLabel(String period, DateTimeRange? customRange) {
  final (start, end) = _dateRangeFor(period, customRange);
  final dayFormat = DateFormat('MMM d, yyyy');
  return start == end ? dayFormat.format(start) : '${dayFormat.format(start)} - ${dayFormat.format(end)}';
}

/// Dedicated Call Report subpage — mobile equivalent of Dad-frontend's
/// `/reports/daily` page (`GET /api/reports/daily-report`). Shows the
/// caller's own daily call/lead-outcome numbers plus, for anyone with
/// subordinates (managers/branch leads/admins), each of those subordinates
/// broken out as its own row — entirely driven by the backend's hierarchy
/// visibility (`getVisibleUserIds`/org-wide-for-admins), not reimplemented
/// here.
class CallReportScreen extends ConsumerStatefulWidget {
  const CallReportScreen({super.key});

  @override
  ConsumerState<CallReportScreen> createState() => _CallReportScreenState();
}

class _CallReportScreenState extends ConsumerState<CallReportScreen> {
  String _period = 'today';
  DateTimeRange? _customRange;
  String? _branchId;
  bool _exporting = false;

  Future<void> _selectPeriod(String value) async {
    if (value != 'custom') {
      setState(() => _period = value);
      return;
    }
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
      initialDateRange: _customRange,
    );
    if (picked == null) return; // backed out — leave the current period as-is
    if (!mounted) return;
    setState(() {
      _period = 'custom';
      _customRange = picked;
    });
  }

  Future<void> _export(DailyReport report) async {
    final session = ref.read(sessionControllerProvider).valueOrNull;
    final branches = ref.read(dashboardBranchesProvider).valueOrNull ?? const [];
    String? branchLabel;
    if (_branchId != null) {
      for (final b in branches) {
        if (b.id == _branchId) {
          branchLabel = b.name;
          break;
        }
      }
    }

    setState(() => _exporting = true);
    try {
      await exportDailyReportPdf(
        report: report,
        organisationName: session?.organisation.name ?? 'PypeCRM',
        periodLabel: _periodLabel(_period, _customRange),
        branchLabel: branchLabel,
      );
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (start, end) = _dateRangeFor(_period, _customRange);
    final startDate = _dateFormat.format(start);
    final endDate = _dateFormat.format(end);
    final reportAsync = ref.watch(
      dailyCallReportProvider(startDate: startDate, endDate: endDate, branchId: _branchId),
    );
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final isAdmin = isAdminRole(session?.role);
    final branchesAsync = isAdmin ? ref.watch(dashboardBranchesProvider) : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Report'),
        actions: [
          IconButton(
            tooltip: 'Export PDF',
            icon: _exporting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.file_download_outlined),
            onPressed: _exporting || !reportAsync.hasValue ? null : () => _export(reportAsync.value!),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(
          dailyCallReportProvider(startDate: startDate, endDate: endDate, branchId: _branchId).future,
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            _FilterChipRow(
              options: _periods,
              selected: _period,
              onSelected: _selectPeriod,
            ),
            if (_period == 'custom' && _customRange != null) ...[
              const SizedBox(height: 6),
              Text(
                _periodLabel(_period, _customRange),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: _brandColor, fontWeight: FontWeight.w600),
              ),
            ],
            if (isAdmin && (branchesAsync?.valueOrNull?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 8),
              _BranchDropdown(
                branches: branchesAsync!.valueOrNull!,
                selected: _branchId,
                onSelected: (v) => setState(() => _branchId = v),
              ),
            ],
            const SizedBox(height: 16),
            reportAsync.when(
              data: (report) {
                if (report.table.isEmpty && report.summary == null) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: EmptyStateView(
                      message: 'No activity recorded for this period.',
                      icon: Icons.call_outlined,
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final row in report.table)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _CallReportCard(row: row, isSelf: row.id == session?.id),
                      ),
                    if (report.summary != null) ...[
                      const SizedBox(height: 8),
                      Text('Summary', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      _SummaryGrid(summary: report.summary!),
                    ],
                  ],
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.invalidate(
                  dailyCallReportProvider(startDate: startDate, endDate: endDate, branchId: _branchId),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChipRow extends StatelessWidget {
  const _FilterChipRow({required this.options, required this.selected, required this.onSelected});

  final List<(String, String)> options;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final (value, label) in options)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(label),
                selected: selected == value,
                onSelected: (_) => onSelected(value),
                selectedColor: _brandColor,
                labelStyle: TextStyle(
                  color: selected == value ? Colors.white : theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: const Color(0xFFF9FAEF),
                side: BorderSide(color: theme.colorScheme.outlineVariant),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
        ],
      ),
    );
  }
}

class _BranchDropdown extends StatelessWidget {
  const _BranchDropdown({required this.branches, required this.selected, required this.onSelected});

  final List<dynamic> branches;
  final String? selected;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAEF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: selected,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: _brandColor),
          hint: Row(
            children: [
              Icon(Icons.apartment_outlined, size: 18, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              const Text('All Branches'),
            ],
          ),
          items: [
            const DropdownMenuItem(value: null, child: Text('All Branches')),
            for (final b in branches) DropdownMenuItem(value: b.id as String, child: Text(b.name as String)),
          ],
          onChanged: onSelected,
        ),
      ),
    );
  }
}

class _CallReportCard extends StatelessWidget {
  const _CallReportCard({required this.row, required this.isSelf});

  final DailyReportRow row;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initials = row.userName.trim().isEmpty
        ? '?'
        : row.userName.trim().split(RegExp(r'\s+')).take(2).map((p) => p[0].toUpperCase()).join();

    return Container(
      decoration: BoxDecoration(
        color: isSelf ? _brandColor.withValues(alpha: 0.06) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelf ? _brandColor.withValues(alpha: 0.35) : theme.colorScheme.outlineVariant,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: _brandColor.withValues(alpha: 0.15),
                child: Text(initials, style: const TextStyle(color: _brandColor, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            row.userName,
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                            softWrap: true,
                          ),
                        ),
                        if (isSelf) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(color: _brandColor, borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              'You',
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if ((row.branch ?? '').isNotEmpty)
                      Text(
                        row.branch!,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(child: _MetricCell(label: 'Calls', value: '${row.totalCalls}')),
                _cellDivider(theme),
                Expanded(
                  child: _MetricCell(
                    label: 'Connected',
                    value: '${row.totalConnected}',
                    valueColor: const Color(0xFF16A34A),
                  ),
                ),
                _cellDivider(theme),
                Expanded(child: _MetricCell(label: 'Unconn.', value: '${row.totalUnconnected}')),
                _cellDivider(theme),
                Expanded(
                  child: _MetricCell(
                    label: 'Converted',
                    value: '${row.totalConverted}',
                    valueColor: const Color(0xFF7C3AED),
                  ),
                ),
                _cellDivider(theme),
                Expanded(
                  child: _MetricCell(label: 'Lost', value: '${row.totalLost}', valueColor: const Color(0xFFDC2626)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cellDivider(ThemeData theme) => VerticalDivider(width: 1, color: theme.colorScheme.outlineVariant);
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({required this.label, required this.value, this.valueColor});

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: valueColor),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid({required this.summary});

  final DailyReportSummary summary;

  @override
  Widget build(BuildContext context) {
    final tiles = [
      (Icons.call_outlined, 'Total Calls', '${summary.totalCalls}', _formatDuration(summary.totalDuration), const Color(0xFF2563EB)),
      (Icons.call_received, 'Incoming', '${summary.incoming}', _formatDuration(summary.incomingDuration), const Color(0xFF16A34A)),
      (Icons.call_made, 'Outgoing', '${summary.outgoing}', _formatDuration(summary.outgoingDuration), const Color(0xFF4F46E5)),
      (Icons.phone_missed_outlined, 'Missed', '${summary.missed}', null, const Color(0xFFDC2626)),
      (Icons.block_outlined, 'Rejected', '${summary.rejected}', null, const Color(0xFFEA580C)),
      (Icons.do_not_disturb_alt_outlined, 'Never Attended', '${summary.neverAttended}', null, Colors.grey),
      (Icons.phone_disabled_outlined, 'Not Picked Up', '${summary.notPickedUp}', null, const Color(0xFFCA8A04)),
      (Icons.tag_outlined, 'Unique Numbers', '${summary.unique}', null, const Color(0xFF7C3AED)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: tiles.length,
      itemBuilder: (context, index) {
        final (icon, label, value, sub, color) = tiles[index];
        return _SummaryTile(icon: icon, label: label, value: value, subValue: sub, color: color);
      },
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({required this.icon, required this.label, required this.value, required this.color, this.subValue});

  final IconData icon;
  final String label;
  final String value;
  final String? subValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 16),
              ),
              if (subValue != null) ...[
                const Spacer(),
                Text(
                  subValue!,
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

String _formatDuration(int totalSeconds) {
  final m = totalSeconds ~/ 60;
  final s = totalSeconds % 60;
  return '${m}m ${s}s';
}
