import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_opportunity_ref.freezed.dart';
part 'account_opportunity_ref.g.dart';

/// The trimmed `opportunities` relation on `GET /api/accounts/:id`
/// (`select: { id, name, amount, stage }` — Dad-backend/src/controllers/accountController.ts),
/// not the full Opportunity object.
@freezed
class AccountOpportunityRef with _$AccountOpportunityRef {
  const factory AccountOpportunityRef({
    required String id,
    required String name,
    required double amount,
    required String stage,
  }) = _AccountOpportunityRef;

  factory AccountOpportunityRef.fromJson(Map<String, dynamic> json) =>
      _$AccountOpportunityRefFromJson(json);
}
