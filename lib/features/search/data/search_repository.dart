import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/search_result.dart';

part 'search_repository.g.dart';

@Riverpod(keepAlive: true)
SearchRepository searchRepository(ProviderRef<SearchRepository> ref) =>
    SearchRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/search` routes
/// (Dad-backend/src/controllers/searchController.ts). Ranking/relevance and
/// visibility filtering are entirely server-side.
class SearchRepository {
  SearchRepository(this._dio);

  final Dio _dio;

  Future<List<SearchResult>> globalSearch(String query, {int limit = 20}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/search/global',
        queryParameters: {'q': query, 'limit': limit},
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      final list = (data['results'] as List).cast<Map<String, dynamic>>();
      return list.map(SearchResult.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<String>> suggestions(String query) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/search/suggestions',
        queryParameters: {'q': query},
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return (data['suggestions'] as List).cast<String>();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<String>> recentSearches() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/search/recent');
      final data = response.data!['data'] as Map<String, dynamic>;
      return (data['recent'] as List).cast<String>();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
