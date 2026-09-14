import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/providers/session_provider.dart';
import '../../dashboard/domain/dashboard_date_range.dart';
import '../data/reports_repository.dart';
import '../domain/call_report_row.dart';
import '../domain/daily_report.dart';
import '../domain/expected_revenue_report.dart';
import '../domain/leads_report_summary.dart';
import '../domain/sales_book_summary.dart';
import '../domain/user_performance.dart';

part 'reports_providers.g.dart';

/// Drives the Reports screen's My Performance/Team tabs (performance,
/// lead funnel, sales book) — reuses the Dashboard's date-range type/preset
/// set (All Time / This Month / Last Month / Custom Range) for consistency,
/// since the backend endpoints behind all of these already accept the same
/// startDate/endDate shape that feature already wired up. Defaults to
/// "This Month", same as Dashboard.
final reportsDateRangeProvider = StateProvider<DashboardDateRange>(
  (ref) => DashboardDateRange.thisMonth(),
);

@riverpod
Future<List<PerformanceEntry>> myPerformance(AutoDisposeFutureProviderRef<List<PerformanceEntry>> ref) {
  final userId = ref.watch(sessionControllerProvider).valueOrNull?.id;
  final range = ref.watch(reportsDateRangeProvider);
  return ref.watch(reportsRepositoryProvider).getUserPerformance(
        userId: userId,
        startDate: range.apiStartDate,
        endDate: range.apiEndDate,
      );
}

/// Manager view — omitting `userId` makes the backend return the caller's
/// visible subordinates automatically (see ReportsRepository).
@riverpod
Future<List<PerformanceEntry>> teamPerformance(AutoDisposeFutureProviderRef<List<PerformanceEntry>> ref) {
  final range = ref.watch(reportsDateRangeProvider);
  return ref.watch(reportsRepositoryProvider).getUserPerformance(
        startDate: range.apiStartDate,
        endDate: range.apiEndDate,
      );
}

@riverpod
Future<LeadsReportSummary> myLeadsFunnel(AutoDisposeFutureProviderRef<LeadsReportSummary> ref) {
  final userId = ref.watch(sessionControllerProvider).valueOrNull?.id;
  final range = ref.watch(reportsDateRangeProvider);
  return ref.watch(reportsRepositoryProvider).getLeadsReport(
        userId: userId,
        startDate: range.apiStartDate,
        endDate: range.apiEndDate,
      );
}

/// Dashboard's own Sales Book card is a *separate*, always-"This Month"
/// provider (`salesBookThisMonthProvider`, unchanged) — this one instead
/// follows [reportsDateRangeProvider], since the Reports screen's whole
/// point here is letting that filter actually apply to what it shows.
@riverpod
Future<SalesBookSummary> reportsSalesBook(AutoDisposeFutureProviderRef<SalesBookSummary> ref) {
  final range = ref.watch(reportsDateRangeProvider);
  // "All Time" has no startDate at all — pass period: 'all' explicitly so
  // the backend doesn't fall back to its own default ('month') when both
  // dates are omitted.
  return ref.watch(reportsRepositoryProvider).getSalesBook(
        period: range.period == DashboardRangePeriod.allTime ? 'all' : 'month',
        startDate: range.apiStartDate,
        endDate: range.apiEndDate,
      );
}

/// Dashboard's own always-"This Month" Sales Book card — unaffected by
/// [reportsDateRangeProvider], deliberately kept separate from
/// [reportsSalesBookProvider] above.
@riverpod
Future<SalesBookSummary> salesBookThisMonth(AutoDisposeFutureProviderRef<SalesBookSummary> ref) {
  return ref.watch(reportsRepositoryProvider).getSalesBook(period: 'month');
}

/// Backs the Call Report screen. `period`/`direction` are family params so
/// switching either just re-fetches instead of needing separate providers.
@riverpod
Future<CallReport> callReport(
  AutoDisposeFutureProviderRef<CallReport> ref, {
  required String period,
  required String direction,
}) {
  return ref.watch(reportsRepositoryProvider).getCallAnalytics(period: period, direction: direction);
}

/// Backs the Call Report screen's per-user table + summary cards. Keyed by
/// the resolved `startDate`/`endDate` (not the period label itself) so a
/// custom range or a differently-computed "today" still cache/refetch
/// correctly, plus an optional branch filter.
@riverpod
Future<DailyReport> dailyCallReport(
  AutoDisposeFutureProviderRef<DailyReport> ref, {
  required String startDate,
  required String endDate,
  String? branchId,
}) {
  return ref.watch(reportsRepositoryProvider).getDailyReport(
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
      );
}

/// Backs the Expected Revenue report screen. `startDate`/`endDate` are
/// optional (backend defaults to the current calendar month when both are
/// omitted) — passing `null` for both is a valid, meaningful "use the
/// default period" call, not an error state, so this isn't `required`
/// like [dailyCallReport]'s.
@riverpod
Future<ExpectedRevenueReport> expectedRevenueReport(
  AutoDisposeFutureProviderRef<ExpectedRevenueReport> ref, {
  String? startDate,
  String? endDate,
  String? branchId,
}) {
  return ref.watch(reportsRepositoryProvider).getExpectedRevenueReport(
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
      );
}
