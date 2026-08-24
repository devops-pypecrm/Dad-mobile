import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../../reports/domain/top_performer.dart';
import '../domain/branch.dart';
import '../domain/dashboard_stats.dart';
import '../domain/lead_source_stat.dart';
import '../domain/sales_forecast.dart';
import '../domain/sales_target.dart';

part 'dashboard_repository.g.dart';

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(ProviderRef<DashboardRepository> ref) =>
    DashboardRepository(ref.watch(dioProvider));

/// Composes the mobile Dashboard from whatever real endpoints exist today.
///
/// There is NO purpose-built mobile summary endpoint
/// (`/api/analytics/mobile-summary` from .claude/skills/dashboard.md and
/// `/api/sales-targets/my-progress` from app-pre/reports/DASHBOARD_ANALYSIS.MD
/// were both grepped for in Dad-backend/src and do not exist — confirmed
/// backend gap, not a mobile-side bug). Each method below hits one real,
/// verified endpoint and returns its data as-is; nothing here recomputes or
/// aggregates numbers the backend didn't already compute.
///
/// The `branchId` params mirror Dad-frontend/src/services/analyticsService.ts
/// exactly: only attached to the query when non-null, never sent as a
/// literal `"all"` string — matching `getBranchFilter` in
/// analyticsController.ts, which treats a missing `branchId` as "no filter".
class DashboardRepository {
  DashboardRepository(this._dio);

  final Dio _dio;

  /// `GET /api/analytics/dashboard` (alias: `/overview`). [month] (`YYYY-MM`)
  /// scopes the revenue/pipeline/won/lost figures to that month server-side
  /// (`getDateFilter` in analyticsController.ts); omit for all-time.
  Future<DashboardStats> getStats({String? month, String? branchId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/analytics/dashboard',
        queryParameters: {
          if (month != null) 'month': month,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return DashboardStats.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/analytics/forecast` — backs the "Exp. Revenue" tile, same as
  /// `Dashboard.tsx`'s `forecast?.totalPipeline`.
  Future<SalesForecast> getForecast({String? month, String? branchId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/analytics/forecast',
        queryParameters: {
          if (month != null) 'month': month,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return SalesForecast.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/analytics/lead-sources` — all-time counts grouped by
  /// `Lead.source`, no date filter applied server-side (branch filter only).
  Future<List<LeadSourceStat>> getLeadSources({String? branchId}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/analytics/lead-sources',
        queryParameters: {if (branchId != null) 'branchId': branchId},
      );
      return response.data!.cast<Map<String, dynamic>>().map(LeadSourceStat.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/analytics/top-performers` — already sorted by revenue desc
  /// and capped to 5 server-side.
  Future<List<TopPerformer>> getTopPerformers({String? branchId}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/analytics/top-performers',
        queryParameters: {if (branchId != null) 'branchId': branchId},
      );
      return response.data!.cast<Map<String, dynamic>>().map(TopPerformer.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/branches` — org-wide branch list. Backend
  /// (`branchController.ts:6-49`) already restricts this to
  /// caller-managed branches for non-admin roles, but the web app only
  /// calls this endpoint for admin/super_admin users and uses
  /// [getManagedBranches] otherwise — mirrored here for parity.
  Future<List<Branch>> getBranches() async {
    try {
      final response = await _dio.get<List<dynamic>>('/branches');
      return response.data!.cast<Map<String, dynamic>>().map(Branch.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/users/my-team` — used instead of [getBranches] for non-admin
  /// roles, same as `Dashboard.tsx:108-114`. Returns `{ team, managedBranches }`;
  /// only `managedBranches` is relevant here.
  Future<List<Branch>> getManagedBranches() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/users/my-team');
      final list = (response.data!['managedBranches'] as List?) ?? const [];
      return list.cast<Map<String, dynamic>>().map(Branch.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/sales-targets` (`getMyTargets`) — returns `{ targets: [...] }`
  /// for every non-deleted target assigned to the user, not just the
  /// current period; the caller picks the currently-active one for display.
  Future<List<SalesTarget>> getMyTargets() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/sales-targets');
      final list = (response.data!['targets'] as List).cast<Map<String, dynamic>>();
      return list.map(SalesTarget.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
