import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_share_link.freezed.dart';
part 'product_share_link.g.dart';

/// Mirrors both `GET` and `POST /api/products/:id/share`'s response shape
/// (Dad-backend/src/controllers/productController.ts
/// `getProductShareConfig`/`generateProductShareLink`) — a public,
/// view-tracked shareable link for a catalog product, same feature as
/// Dad-frontend's product Share button/dropdown.
@freezed
class ProductShareLink with _$ProductShareLink {
  const factory ProductShareLink({
    String? url,
    String? slug,
    @Default(0) int views,
    String? youtubeUrl,
    String? customTitle,
    String? customDescription,
  }) = _ProductShareLink;

  factory ProductShareLink.fromJson(Map<String, dynamic> json) =>
      _$ProductShareLinkFromJson(json);
}
