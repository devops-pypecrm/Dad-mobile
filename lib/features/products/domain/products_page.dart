import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'products_page.freezed.dart';
part 'products_page.g.dart';

/// `GET /api/products` response shape — `{ products, page, totalPages, totalProducts }`
/// (Dad-backend/src/controllers/productController.ts:7-61).
@freezed
class ProductsPage with _$ProductsPage {
  const factory ProductsPage({
    @Default(<Product>[]) List<Product> products,
    @Default(1) int page,
    @Default(1) int totalPages,
    @Default(0) int totalProducts,
  }) = _ProductsPage;

  factory ProductsPage.fromJson(Map<String, dynamic> json) => _$ProductsPageFromJson(json);
}
