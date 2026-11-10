import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/audit_log_entry.dart';
import '../domain/call_report_row.dart';
import '../domain/campaign_report_row.dart';
import '../domain/daily_report.dart';
import '../domain/expected_revenue_report.dart';
import '../domain/lead_distribution_report.dart';
import '../domain/leads_report_summary.dart';
import '../domain/sales_book_summary.dart';
import '../domain/user_performance.dart';

part 'reports_repository.g.dart';

@Riverpod(keepAlive: true)
ReportsRepository reportsRepository(ProviderRef<ReportsRepository> ref) =>
    ReportsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/reports` routes
/// (Dad-backend/src/controllers/reportController.ts). Excel export
/// (`/api/reports/export/:type`) is intentionally not implemented on
/// mobile — per app-pre/reports/REPORT_ANALYSIS.MD, that's a web-only flow.
class ReportsRepository {
  ReportsRepository(this._dio);

  final Dio _dio;

  /// Pass [userId] for a single rep's numbers; omit it as a manager to get
  /// the caller's visible subordinates back automatically. [startDate]/
  /// [endDate] (`yyyy-MM-dd`) scope every metric server-side; omit both for
  /// all-time.
  Future<List<PerformanceEntry>> getUserPerformance({
    String? userId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/user-performance',
        queryParameters: {
          if (userId != null) 'userId': userId,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
      );
      final list = (response.data!['performance'] as List).cast<Map<String, dynamic>>();
      return list.map(PerformanceEntry.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// [startDate]/[endDate] (`yyyy-MM-dd`) take priority over [period] when
  /// given — the explicit range this screen's date-range filter actually
  /// drives now (an exact calendar month, "All Time", or a custom range),
  /// not the four fixed trailing-window presets `period` alone allows.
  Future<SalesBookSummary> getSalesBook({
    String period = 'month',
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/sales-book',
        queryParameters: {
          'period': period,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
      );
      return SalesBookSummary.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LeadsReportSummary> getLeadsReport({
    String? userId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/leads',
        queryParameters: {
          if (userId != null) 'userId': userId,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
      );
      return LeadsReportSummary.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/calls/reports/user-analytics` (Dad-backend/src/controllers/
  /// callController.ts `getUserCallAnalytics`) — a different router mount
  /// than every other method here (`/calls/...`, not `/reports/...`), kept
  /// in this repository anyway since it's a report screen's data source,
  /// not part of the Calls feature's own browsing/playback concern.
  /// [period]: today | yesterday | week | month. [direction]: all | inbound
  /// | outbound. Hierarchy visibility (self + subordinates, or org-wide for
  /// admins) is entirely server-computed — this call carries no client-side
  /// user filtering of its own.
  Future<CallReport> getCallAnalytics({
    String period = 'today',
    String direction = 'all',
    String? branchId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/calls/reports/user-analytics',
        queryParameters: {
          'period': period,
          'direction': direction,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return CallReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/reports/daily-report` — the richer per-user breakdown (adds
  /// converted/lost lead counts alongside call stats) plus an org-wide call
  /// direction summary, same data the web `/reports/daily` page renders.
  /// [startDate]/[endDate] are `yyyy-MM-dd` strings; a single-day report
  /// just passes the same value for both.
  Future<DailyReport> getDailyReport({
    String? branchId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/daily-report',
        queryParameters: {
          'startDate': startDate,
          'endDate': endDate,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return DailyReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/analytics/expected-revenue` (Dad-backend/src/controllers/
  /// analyticsController.ts `getExpectedRevenueReport`) — a different router
  /// mount than every other method here (`/analytics/...`, not
  /// `/reports/...`), kept in this repository anyway for the same reason
  /// [getCallAnalytics] is: it's a report screen's data source, not part of
  /// any other feature's own concern. [startDate]/[endDate] (`yyyy-MM-dd`)
  /// pick which period a deal counts as "current" vs "carried_forward" vs
  /// "upcoming" against — they do NOT exclude any open deal from the result,
  /// every currently-open deal is always returned regardless of period.
  /// Omit both for the backend's own default (the current calendar month).
  Future<ExpectedRevenueReport> getExpectedRevenueReport({
    String? startDate,
    String? endDate,
    String? branchId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/analytics/expected-revenue',
        queryParameters: {
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return ExpectedRevenueReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/reports/lead-distribution` — same endpoint as Dad-frontend's
  /// `/reports/lead-distribution` page. [startDate]/[endDate] are
  /// `yyyy-MM-dd`; the backend defaults to the last 30 days when both are
  /// omitted.
  Future<LeadDistributionReport> getLeadDistributionReport({
    String? startDate,
    String? endDate,
    String? branchId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/lead-distribution',
        queryParameters: {
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return LeadDistributionReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/audit-logs` — admin/manager-only (backend returns 403
  /// otherwise), same endpoint as Dad-frontend's Audit Logs report page.
  Future<AuditLogsReport> getAuditLogs({
    String? startDate,
    String? endDate,
    String? entity,
    String? action,
    String? userId,
    String? branchId,
    int limit = 100,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/audit-logs',
        queryParameters: {
          'limit': limit,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
          if (entity != null) 'entity': entity,
          if (action != null) 'action': action,
          if (userId != null) 'userId': userId,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return AuditLogsReport.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/campaigns` — same endpoint as Dad-frontend's
  /// `getEmailCampaigns`, response shape `{ campaigns: [...] }`.
  Future<List<CampaignReportRow>> getCampaigns() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/campaigns');
      final list = (response.data?['campaigns'] as List?) ?? const [];
      return list.map((e) => CampaignReportRow.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
