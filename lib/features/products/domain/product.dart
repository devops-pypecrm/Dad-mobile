import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Mirrors `GET /api/products`'s row shape
/// (Dad-backend/src/controllers/productController.ts — a bare
/// `prisma.product.findMany`, so every scalar column on `Product` comes
/// back). Most of the fields Dad-frontend's own `/products` page uses
/// (list view + its Create/Edit form) are modeled here, plus `unit`/
/// `taxRate` since those are shown in this app's product detail UI —
/// `tags`/`minQuantity`/`maxQuantity`/`imageUrl`/`validFrom`/`validUntil`
/// still aren't exposed in Dad-frontend's form either, so there's nothing
/// to port for those yet.
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    String? sku,
    @Default(0) double basePrice,
    @Default('INR') String currency,
    String? category,
    String? description,
    @Default('unit') String unit,
    @Default(0) double taxRate,
    @Default(false) bool isActive,
    @Default(false) bool isCustom,
    String? brochureUrl,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
