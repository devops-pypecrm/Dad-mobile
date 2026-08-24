import 'package:freezed_annotation/freezed_annotation.dart';

import '../../leads/domain/lead_product.dart';

part 'account_product.freezed.dart';
part 'account_product.g.dart';

/// An `AccountProduct` row — an asset previously sold to the account
/// (Dad-backend/prisma/schema.prisma). Reuses [Product] from the Leads
/// feature since it's the identical nested Prisma relation shape.
@freezed
class AccountProductItem with _$AccountProductItem {
  const factory AccountProductItem({
    required String id,
    required int quantity,
    required double price,
    String? customName,
    String? status,
    Product? product,
  }) = _AccountProductItem;

  factory AccountProductItem.fromJson(Map<String, dynamic> json) => _$AccountProductItemFromJson(json);
}
