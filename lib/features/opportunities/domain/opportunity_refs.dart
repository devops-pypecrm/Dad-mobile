import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_refs.freezed.dart';
part 'opportunity_refs.g.dart';

/// `id` is nullable, not an oversight: `Opportunity.account` is selected as
/// just `{ name: true }` (no `id`) in `getOpportunities`
/// (Dad-backend/src/controllers/opportunityController.ts:91) — the backend
/// genuinely never returns an account id on the LIST endpoint, only the
/// name. Confirmed nothing in the app reads `account.id` today, so this is
/// a zero-behavior-change fix for a real `null is not a subtype of String`
/// crash that broke the entire Opportunities list (every opportunity has a
/// non-null `account`, so every row hit this on parse).
///
/// `accountProducts` is the same list-vs-detail duality as `EmiSchedule`'s
/// amount fields (see that class's doc comment): only `getOpportunityById`
/// (the DETAIL endpoint) selects `account.accountProducts`, the list
/// endpoint doesn't, so this defaults to empty rather than being required —
/// rendering it from a list-endpoint payload would just show no products,
/// not crash.
@freezed
class AccountRef with _$AccountRef {
  const factory AccountRef({
    String? id,
    required String name,
    @Default(<AccountProductRef>[]) List<AccountProductRef> accountProducts,
  }) = _AccountRef;

  factory AccountRef.fromJson(Map<String, dynamic> json) => _$AccountRefFromJson(json);
}

/// An `AccountProduct` row — the "Associated Products" section on the
/// Opportunity detail page reads these to compute a total and offer
/// syncing `Opportunity.amount` to match it. Note the line price actually
/// sold at is this object's own `price` field, NOT `product.basePrice`
/// (the catalog default) — confirmed against
/// Dad-backend/prisma/schema.prisma's `AccountProduct` model.
@freezed
class AccountProductRef with _$AccountProductRef {
  const factory AccountProductRef({
    required String id,
    @Default(1) double quantity,
    @Default(0) double price,
    String? customName,
    ProductRef? product,
  }) = _AccountProductRef;

  factory AccountProductRef.fromJson(Map<String, dynamic> json) => _$AccountProductRefFromJson(json);
}

@freezed
class ProductRef with _$ProductRef {
  const factory ProductRef({required String id, required String name, @Default(0) double basePrice}) = _ProductRef;

  factory ProductRef.fromJson(Map<String, dynamic> json) => _$ProductRefFromJson(json);
}

@freezed
class OwnerRef with _$OwnerRef {
  const factory OwnerRef({String? id, String? firstName, String? lastName, String? email}) = _OwnerRef;

  factory OwnerRef.fromJson(Map<String, dynamic> json) => _$OwnerRefFromJson(json);
}

@freezed
class ContactRef with _$ContactRef {
  const factory ContactRef({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
  }) = _ContactRef;

  factory ContactRef.fromJson(Map<String, dynamic> json) => _$ContactRefFromJson(json);
}

/// The Lead this Opportunity was converted from — the "Linked Lead" card on
/// the detail page reads this, including its own inline `leadStatus`
/// change (`PUT /opportunities/:id { leadStatus }`, which the backend
/// forwards onto the Lead itself — see `opportunityController.ts`'s
/// `updateOpportunity`).
@freezed
class LeadRef with _$LeadRef {
  const factory LeadRef({
    required String id,
    String? firstName,
    String? lastName,
    String? status,
    LeadAssigneeRef? assignedTo,
  }) = _LeadRef;

  factory LeadRef.fromJson(Map<String, dynamic> json) => _$LeadRefFromJson(json);
}

@freezed
class LeadAssigneeRef with _$LeadAssigneeRef {
  const factory LeadAssigneeRef({String? firstName, String? lastName}) = _LeadAssigneeRef;

  factory LeadAssigneeRef.fromJson(Map<String, dynamic> json) => _$LeadAssigneeRefFromJson(json);
}
