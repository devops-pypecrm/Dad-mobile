import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Mirrors `GET /api/products`'s row shape
/// (Dad-backend/src/controllers/productController.ts — a bare
/// `prisma.product.findMany`, so every scalar column on `Product` comes
/// back). Only the fields Dad-frontend's own `/products` list page
/// actually displays are modeled here (`src/pages/products/index.tsx`) —
/// `description`/`tags`/`unit`/`minQuantity`/`maxQuantity`/`imageUrl`/
/// `validFrom`/`validUntil` exist on the backend model but aren't shown on
/// its list view either, so there's nothing to port for a first pass.
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    String? sku,
    @Default(0) double basePrice,
    @Default('INR') String currency,
    String? category,
    @Default(false) bool isActive,
    @Default(false) bool isCustom,
    String? brochureUrl,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
