import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_refs.freezed.dart';
part 'opportunity_refs.g.dart';

/// `id` is nullable, not an oversight: `Opportunity.account` is selected as
/// just `{ name: true }` (no `id`) in BOTH `getOpportunities` and
/// `getOpportunityById` (Dad-backend/src/controllers/opportunityController.ts:91,309)
/// — the backend genuinely never returns an account id here, only the name.
/// Confirmed nothing in the app reads `account.id` today, so this is a
/// zero-behavior-change fix for a real `null is not a subtype of String`
/// crash that broke the entire Opportunities list (every opportunity has a
/// non-null `account`, so every row hit this on parse).
@freezed
class AccountRef with _$AccountRef {
  const factory AccountRef({String? id, required String name}) = _AccountRef;

  factory AccountRef.fromJson(Map<String, dynamic> json) => _$AccountRefFromJson(json);
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
