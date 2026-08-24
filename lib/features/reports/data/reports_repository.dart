import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
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
  /// the caller's visible subordinates back automatically.
  Future<List<PerformanceEntry>> getUserPerformance({String? userId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/user-performance',
        queryParameters: {if (userId != null) 'userId': userId},
      );
      final list = (response.data!['performance'] as List).cast<Map<String, dynamic>>();
      return list.map(PerformanceEntry.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `period`: day | week | month | year (default month). No per-user
  /// filter exists server-side — this is always org/branch-wide.
  Future<SalesBookSummary> getSalesBook({String period = 'month'}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/sales-book',
        queryParameters: {'period': period},
      );
      return SalesBookSummary.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LeadsReportSummary> getLeadsReport({String? userId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/reports/leads',
        queryParameters: {if (userId != null) 'userId': userId},
      );
      return LeadsReportSummary.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
