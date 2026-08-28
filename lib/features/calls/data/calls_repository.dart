import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/call_logs_page.dart';
import '../domain/call_stats.dart';

part 'calls_repository.g.dart';

@Riverpod(keepAlive: true)
CallsRepository callsRepository(ProviderRef<CallsRepository> ref) => CallsRepository(ref.watch(dioProvider));

/// Talks to `GET /api/calls` + `GET /api/calls/stats` + `DELETE
/// /api/calls/:id/recording` (Dad-backend/src/controllers/callController.ts)
/// — org/hierarchy-visibility-scoped call log listing, backed by the
/// `Interaction` model (type: 'call'), not the native-Android
/// `CallRecording` upload model.
class CallsRepository {
  CallsRepository(this._dio);

  final Dio _dio;

  Future<CallLogsPage> getCalls({
    int page = 1,
    int limit = 20,
    String? search,
    String? direction,
    String? status,
    String? branchId,
    String? userId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/calls',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search != null && search.isNotEmpty) 'search': search,
          if (direction != null && direction.isNotEmpty) 'direction': direction,
          if (status != null && status.isNotEmpty) 'status': status,
          if (branchId != null && branchId.isNotEmpty) 'branchId': branchId,
          if (userId != null && userId.isNotEmpty) 'userId': userId,
        },
      );
      return CallLogsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// [period] is one of `today`/`week`/`month`, matching the web `/calls`
  /// page's period selector.
  Future<CallStats> getCallStats({String period = 'week', String? userId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/calls/stats',
        queryParameters: {
          'period': period,
          if (userId != null && userId.isNotEmpty) 'userId': userId,
        },
      );
      return CallStats.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> deleteRecording(String callId) async {
    try {
      await _dio.delete<void>('/calls/$callId/recording');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
