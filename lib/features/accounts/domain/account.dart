import 'package:freezed_annotation/freezed_annotation.dart';

import '../../opportunities/domain/opportunity_refs.dart';
import 'account_opportunity_ref.dart';
import 'account_product.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// Mirrors `Dad-backend/prisma/schema.prisma`'s `Account` model plus the
/// trimmed `contacts`/`opportunities`/`accountProducts` relations included
/// by `GET /api/accounts/:id`
/// (Dad-backend/src/controllers/accountController.ts). `address` is a raw
/// Json blob on the backend with no fixed shape — kept as a dynamic map.
@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required String id,
    required String name,
    String? industry,
    String? website,
    String? phone,
    @Default('prospect') String type,
    Map<String, dynamic>? address,
    OwnerRef? owner,
    @Default(<ContactRef>[]) List<ContactRef> contacts,
    @Default(<AccountOpportunityRef>[]) List<AccountOpportunityRef> opportunities,
    @Default(<AccountProductItem>[]) List<AccountProductItem> accountProducts,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  /// Best-effort single-line rendering of the free-form `address` Json blob.
  String? get formattedAddress {
    if (address == null || address!.isEmpty) return null;
    final parts = ['street', 'city', 'state', 'zip', 'country']
        .map((key) => address![key])
        .whereType<String>()
        .where((s) => s.trim().isNotEmpty);
    if (parts.isNotEmpty) return parts.join(', ');
    return address!.values.whereType<String>().where((s) => s.trim().isNotEmpty).join(', ');
  }
}
