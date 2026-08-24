import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/call_logs_page.dart';

part 'calls_repository.g.dart';

@Riverpod(keepAlive: true)
CallsRepository callsRepository(ProviderRef<CallsRepository> ref) => CallsRepository(ref.watch(dioProvider));

/// Talks to `GET /api/calls` (Dad-backend/src/controllers/callController.ts
/// `getAllCalls`) — org/hierarchy-visibility-scoped call log listing, backed
/// by the `Interaction` model (type: 'call'), not the native-Android
/// `CallRecording` upload model. Recording playback/download/delete
/// (`GET /calls/recording/:filename`, `DELETE /calls/:id/recording`) isn't
/// wired here — this is read-only log browsing for a first pass.
class CallsRepository {
  CallsRepository(this._dio);

  final Dio _dio;

  Future<CallLogsPage> getCalls({
    int page = 1,
    int limit = 20,
    String? search,
    String? direction,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/calls',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search != null && search.isNotEmpty) 'search': search,
          if (direction != null && direction.isNotEmpty) 'direction': direction,
        },
      );
      return CallLogsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
