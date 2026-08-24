import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/providers/session_provider.dart';
import '../data/reports_repository.dart';
import '../domain/leads_report_summary.dart';
import '../domain/sales_book_summary.dart';
import '../domain/user_performance.dart';

part 'reports_providers.g.dart';

@riverpod
Future<List<PerformanceEntry>> myPerformance(AutoDisposeFutureProviderRef<List<PerformanceEntry>> ref) {
  final userId = ref.watch(sessionControllerProvider).valueOrNull?.id;
  return ref.watch(reportsRepositoryProvider).getUserPerformance(userId: userId);
}

/// Manager view — omitting `userId` makes the backend return the caller's
/// visible subordinates automatically (see ReportsRepository).
@riverpod
Future<List<PerformanceEntry>> teamPerformance(AutoDisposeFutureProviderRef<List<PerformanceEntry>> ref) {
  return ref.watch(reportsRepositoryProvider).getUserPerformance();
}

@riverpod
Future<LeadsReportSummary> myLeadsFunnel(AutoDisposeFutureProviderRef<LeadsReportSummary> ref) {
  final userId = ref.watch(sessionControllerProvider).valueOrNull?.id;
  return ref.watch(reportsRepositoryProvider).getLeadsReport(userId: userId);
}

@riverpod
Future<SalesBookSummary> salesBookThisMonth(AutoDisposeFutureProviderRef<SalesBookSummary> ref) {
  return ref.watch(reportsRepositoryProvider).getSalesBook(period: 'month');
}
