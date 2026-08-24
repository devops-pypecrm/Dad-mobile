import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/products_page.dart';

part 'products_repository.g.dart';

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(ProviderRef<ProductsRepository> ref) =>
    ProductsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/products` routes
/// (Dad-backend/src/controllers/productController.ts). Read-only — create/
/// update/delete are org-admin-only on web and out of scope here.
class ProductsRepository {
  ProductsRepository(this._dio);

  final Dio _dio;

  Future<ProductsPage> getProducts({int page = 1, int limit = 20, String? search}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/products',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );
      return ProductsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
