import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/role_utils.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../domain/lead_distribution_report.dart';
import '../../providers/reports_providers.dart';

final _dateFormat = DateFormat('yyyy-MM-dd');

/// Mobile equivalent of Dad-frontend's `/reports/lead-distribution` page.
/// Web renders a calendar/heatmap grid of leads-per-day; that control
/// doesn't translate well to a phone screen, so this uses a date-range
/// picker + a simple per-day bar list instead — same underlying data
/// (`GET /api/reports/lead-distribution`), different presentation, not a
/// pixel-for-pixel port.
class LeadDistributionScreen extends ConsumerStatefulWidget {
  const LeadDistributionScreen({super.key});

  @override
  ConsumerState<LeadDistributionScreen> createState() => _LeadDistributionScreenState();
}

class _LeadDistributionScreenState extends ConsumerState<LeadDistributionScreen> {
  late DateTimeRange _range = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 29)),
    end: DateTime.now(),
  );
  String? _branchId;

  Future<void> _pickRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
      initialDateRange: _range,
    );
    if (picked == null) return;
    setState(() => _range = picked);
  }

  @override
  Widget build(BuildContext context) {
    final startDate = _dateFormat.format(_range.start);
    final endDate = _dateFormat.format(_range.end);
    final reportAsync = ref.watch(
      leadDistributionReportProvider(startDate: startDate, endDate: endDate, branchId: _branchId),
    );
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final isAdmin = isAdminRole(session?.role);
    final branchesAsync = isAdmin ? ref.watch(dashboardBranchesProvider) : null;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Lead Distribution')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(
          leadDistributionReportProvider(startDate: startDate, endDate: endDate, branchId: _branchId).future,
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickRange,
                    icon: const Icon(Icons.date_range_outlined, size: 18),
                    label: Text(
                      '${DateFormat('MMM d').format(_range.start)} - ${DateFormat('MMM d, yyyy').format(_range.end)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            if (isAdmin && (branchesAsync?.valueOrNull?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String?>(
                    value: _branchId,
                    isExpanded: true,
                    hint: const Text('All Branches'),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All Branches')),
                      for (final b in branchesAsync!.valueOrNull!) DropdownMenuItem(value: b.id, child: Text(b.name)),
                    ],
                    onChanged: (v) => setState(() => _branchId = v),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            reportAsync.when(
              data: (report) {
                if (report.total == 0) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: EmptyStateView(
                      message: 'No leads created in this period.',
                      icon: Icons.insights_outlined,
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${report.total} leads',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text('By Day', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    _ByDateBars(rows: report.byDate),
                    const SizedBox(height: 24),
                    Text('By Rep', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    for (final row in report.byUser)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _UserRow(row: row, maxCount: report.byUser.first.count),
                      ),
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
                  leadDistributionReportProvider(startDate: startDate, endDate: endDate, branchId: _branchId),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ByDateBars extends StatelessWidget {
  const _ByDateBars({required this.rows});

  final List<LeadDistributionDateRow> rows;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final maxCount = rows.map((r) => r.count).reduce((a, b) => a > b ? a : b);
    final sorted = [...rows]..sort((a, b) => a.date.compareTo(b.date));

    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sorted.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final row = sorted[index];
          final ratio = maxCount == 0 ? 0.0 : row.count / maxCount;
          final day = DateTime.tryParse(row.date);
          return SizedBox(
            width: 36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${row.count}', style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: ratio.clamp(0.04, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  day == null ? row.date : DateFormat('d MMM').format(day),
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow({required this.row, required this.maxCount});

  final LeadDistributionUserRow row;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ratio = maxCount == 0 ? 0.0 : row.count / maxCount;
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  row.userName,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('${row.count}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(row.branch, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: ratio.clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }
}
