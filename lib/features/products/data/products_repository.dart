import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/product.dart';
import '../domain/products_page.dart';

part 'products_repository.g.dart';

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(ProviderRef<ProductsRepository> ref) =>
    ProductsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/products` routes
/// (Dad-backend/src/controllers/productController.ts). Read (`getProducts`)
/// needs no special role — any authenticated org user can call it. Create/
/// update/delete are gated server-side by `isOrgAdmin()` (403 otherwise,
/// see `role_utils.dart`'s `isOrgAdminRole` for the matching client-side
/// check used to hide those actions' UI for non-admins) — this repository
/// still exposes the calls themselves regardless of role, since the 403 is
/// the real enforcement and the UI gate is just to avoid a pointless
/// round-trip for someone who can't use it anyway.
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

  /// `POST /api/products`. Brochure upload isn't wired up here — web
  /// uploads the file separately first (`POST /api/upload/document`) and
  /// only sends the resulting `brochureUrl` string in this call; that
  /// upload flow is a real gap in this first pass, not something silently
  /// dropped without mention. `organisationId`/`createdById`/`branchId`
  /// are server-derived from the JWT, never sent from the client.
  Future<Product> createProduct({
    required String name,
    String? sku,
    required double basePrice,
    String? category,
    String? description,
    bool isCustom = false,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/products',
        data: {
          'name': name,
          if (sku != null && sku.isNotEmpty) 'sku': sku,
          'basePrice': basePrice,
          if (category != null && category.isNotEmpty) 'category': category,
          if (description != null && description.isNotEmpty) 'description': description,
          'isCustom': isCustom,
        },
      );
      return Product.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/products/:id` — same fields as [createProduct]; backend
  /// applies whatever's sent directly (no field allow-list), so only
  /// user-editable fields are included here.
  Future<Product> updateProduct(
    String id, {
    String? name,
    String? sku,
    double? basePrice,
    String? category,
    String? description,
    bool? isCustom,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/products/$id',
        data: {
          if (name != null) 'name': name,
          if (sku != null) 'sku': sku,
          if (basePrice != null) 'basePrice': basePrice,
          if (category != null) 'category': category,
          if (description != null) 'description': description,
          if (isCustom != null) 'isCustom': isCustom,
        },
      );
      return Product.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `DELETE /api/products/:id` — soft delete
  /// (`isDeleted: true, deletedAt: now`), org-admin only. Matches web:
  /// there's no confirmation dialog on the backend/API side of this, so if
  /// mobile wants one it's purely a client-side UX choice, not something
  /// the server expects.
  Future<void> deleteProduct(String id) async {
    try {
      await _dio.delete<void>('/products/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
