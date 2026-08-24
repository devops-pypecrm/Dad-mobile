import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/followup.dart';
import '../domain/followups_page.dart';

part 'followups_repository.g.dart';

@Riverpod(keepAlive: true)
FollowUpsRepository followUpsRepository(ProviderRef<FollowUpsRepository> ref) =>
    FollowUpsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/follow-ups` routes
/// (Dad-backend/src/controllers/followUpController.ts). Visibility (who can
/// see which follow-up) and the overdue/today/upcoming bucketing are both
/// computed server-side in IST — this repository just forwards params.
///
/// Two things the backend does NOT support as query params, confirmed by
/// reading `getFollowUps` directly — both are done client-side instead,
/// same as Dad-frontend's `/follow-ups` page does (`FollowUpsListController`
/// mirrors this): a due-date range filter, and any `sortBy` (the backend
/// always returns `orderBy: { dueDate: 'asc' }` regardless of what's asked).
class FollowUpsRepository {
  FollowUpsRepository(this._dio);

  final Dio _dio;

  /// `status` defaults to the backend's own default
  /// (`not_started`/`in_progress`) when omitted; pass `'all'` to include
  /// every status. [branchId]/[userId] mirror the web Follow-ups page's
  /// Branch/User filters exactly (`branchId`/`userId` query params).
  Future<FollowUpsPage> getFollowUps({
    int page = 1,
    int limit = 20,
    String? search,
    String? status,
    String? branchId,
    String? userId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/follow-ups',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search != null && search.isNotEmpty) 'search': search,
          if (status != null) 'status': status,
          if (branchId != null && branchId.isNotEmpty) 'branchId': branchId,
          if (userId != null && userId.isNotEmpty) 'userId': userId,
        },
      );
      return FollowUpsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Marking a follow-up done is just `PUT /api/follow-ups/:id` with
  /// `{ "status": "completed" }` — confirmed against
  /// Dad-backend/src/controllers/followUpController.ts:281-376. Reused for
  /// any status transition (not_started/in_progress/completed/deferred),
  /// same as the web app's "Quick Status" menu.
  Future<FollowUp> updateStatus(String id, String status) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/follow-ups/$id',
        data: {'status': status},
      );
      return FollowUp.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<FollowUp> reschedule(String id, DateTime dueDate) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/follow-ups/$id',
        data: {'dueDate': dueDate.toIso8601String()},
      );
      return FollowUp.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
