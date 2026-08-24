import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/opportunities_page.dart';
import '../domain/opportunity.dart';

part 'opportunities_repository.g.dart';

@Riverpod(keepAlive: true)
OpportunitiesRepository opportunitiesRepository(ProviderRef<OpportunitiesRepository> ref) =>
    OpportunitiesRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/opportunities` routes
/// (Dad-backend/src/controllers/opportunityController.ts). Read-only for
/// Phase 3 — list + detail only, no stage/close-deal mutations.
class OpportunitiesRepository {
  OpportunitiesRepository(this._dio);

  final Dio _dio;

  Future<OpportunitiesPage> getOpportunities({
    int page = 1,
    int limit = 20,
    String? stage,
    String? search,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/opportunities',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (stage != null && stage.isNotEmpty) 'stage': stage,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );
      return OpportunitiesPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Opportunity> getOpportunityById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/opportunities/$id');
      return Opportunity.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
