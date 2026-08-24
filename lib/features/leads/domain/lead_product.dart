import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_product.freezed.dart';
part 'lead_product.g.dart';

/// A `LeadProduct` row (only present on `GET /api/leads/:id`, never on the
/// list endpoint). Its presence/count gates the `qualified`/`converted`
/// status transition server-side.
@freezed
class LeadProductItem with _$LeadProductItem {
  const factory LeadProductItem({
    required String id,
    required String productId,
    @Default(1) int quantity,
    required double price,
    String? customName,
    Product? product,
  }) = _LeadProductItem;

  factory LeadProductItem.fromJson(Map<String, dynamic> json) => _$LeadProductItemFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    String? sku,
    required double basePrice,
    @Default('INR') String currency,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
