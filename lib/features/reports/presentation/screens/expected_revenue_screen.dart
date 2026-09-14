import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/expected_revenue_report.dart';
import '../../providers/reports_providers.dart';

const _brandColor = Color(0xFF578732);
final _closeDateFormat = DateFormat('MMM d, yyyy');

const _statusMeta = {
  ExpectedRevenueDealStatus.current: ('This Period', Color(0xFF16A34A)),
  ExpectedRevenueDealStatus.carriedForward: ('Carried Forward', Color(0xFFCA8A04)),
  ExpectedRevenueDealStatus.upcoming: ('Upcoming', Color(0xFF2563EB)),
  ExpectedRevenueDealStatus.noDate: ('No Close Date', Colors.grey),
};

/// Mobile equivalent of Dad-frontend's `/reports/expected-revenue` page
/// (`pages/reports/ExpectedRevenue.tsx`) — every currently-open deal, each
/// tagged against the selected period as "This Period" / "Carried Forward"
/// (opened in an earlier period, still open today) / "Upcoming" / "No Close
/// Date". This is a live pipeline snapshot, not a per-period slice: nothing
/// here ever gets excluded just because it was created outside the selected
/// window — see `getExpectedRevenueReport`'s own doc comment in
/// Dad-backend/src/controllers/analyticsController.ts.
class ExpectedRevenueScreen extends ConsumerWidget {
  const ExpectedRevenueScreen({super.key, this.branchId, this.startDate, this.endDate});

  final String? branchId;
  final String? startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(
      expectedRevenueReportProvider(startDate: startDate, endDate: endDate, branchId: branchId),
    );
    final currency = ref.watch(sessionControllerProvider).valueOrNull?.organisation.currency;

    return Scaffold(
      appBar: AppBar(title: const Text('Expected Revenue')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(
          expectedRevenueReportProvider(startDate: startDate, endDate: endDate, branchId: branchId).future,
        ),
        child: reportAsync.when(
          data: (report) => _ReportBody(report: report, currency: currency),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => ListView(
            children: [
              ErrorStateView(
                error: error,
                onRetry: () => ref.invalidate(
                  expectedRevenueReportProvider(startDate: startDate, endDate: endDate, branchId: branchId),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReportBody extends StatelessWidget {
  const _ReportBody({required this.report, required this.currency});

  final ExpectedRevenueReport report;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    final summary = report.summary;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        Text(
          'Open deals as of ${report.periodLabel}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.6,
          children: [
            _SummaryCard(
              label: 'Total Expected',
              value: CurrencyFormatter.compact(summary.totalExpectedRevenue, currency),
              sub: '${report.deals.length} open deals',
              color: _brandColor,
            ),
            _SummaryCard(
              label: 'This Period',
              value: CurrencyFormatter.compact(summary.currentPeriodAmount, currency),
              sub: '${summary.currentPeriodCount} deals',
              color: const Color(0xFF16A34A),
            ),
            _SummaryCard(
              label: 'Carried Forward',
              value: CurrencyFormatter.compact(summary.carriedForwardAmount, currency),
              sub: '${summary.carriedForwardCount} deals from earlier',
              color: const Color(0xFFCA8A04),
            ),
            _SummaryCard(
              label: 'Upcoming',
              value: CurrencyFormatter.compact(summary.upcomingAmount, currency),
              sub: '${summary.upcomingCount} deals',
              color: const Color(0xFF2563EB),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Deals', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        if (report.deals.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: EmptyStateView(
              message: 'No open deals found for the selected criteria.',
              icon: Icons.trending_up,
            ),
          )
        else
          for (final deal in report.deals)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _DealCard(deal: deal, currency: currency),
            ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.value, required this.sub, required this.color});

  final String label;
  final String value;
  final String sub;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            sub,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _DealCard extends StatelessWidget {
  const _DealCard({required this.deal, required this.currency});

  final ExpectedRevenueDeal deal;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (statusLabel, statusColor) = _statusMeta[deal.status]!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deal.name,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      deal.customerName,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                CurrencyFormatter.format(deal.amount, currency),
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: _brandColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _Pill(icon: Icons.person_outline, label: deal.ownerName),
              if (deal.branchName != 'N/A') _Pill(icon: Icons.apartment_outlined, label: deal.branchName),
              _Pill(
                icon: Icons.flag_outlined,
                label: deal.stage.replaceAll('_', ' '),
              ),
              if (deal.closeDate != null)
                _Pill(icon: Icons.event_outlined, label: _closeDateFormat.format(deal.closeDate!)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              statusLabel,
              style: theme.textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
