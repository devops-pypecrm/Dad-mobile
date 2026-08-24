import 'package:freezed_annotation/freezed_annotation.dart';

import 'opportunity_payments.dart';
import 'opportunity_refs.dart';

part 'opportunity.freezed.dart';
part 'opportunity.g.dart';

/// Terminal stages — once here the backend refuses further stage changes
/// (Dad-backend/src/controllers/opportunityController.ts `updateOpportunity`).
/// Phase 3 is list/detail only, no stage-change UI, but this is kept as a
/// display hint (e.g. hiding a future "move stage" affordance).
const kTerminalOpportunityStages = {'closed_won', 'closed_lost'};

/// Mirrors `Dad-backend/prisma/schema.prisma`'s `Opportunity` model. `stage`
/// is a free string (not a bound Prisma enum) exactly like `Lead.status` —
/// see Dad-backend/CLAUDE.md. Nothing here recomputes pipeline/win logic;
/// every field is displayed as returned by the API.
@freezed
class Opportunity with _$Opportunity {
  const factory Opportunity({
    required String id,
    required String name,
    required double amount,
    @Default('prospecting') String stage,
    @Default(10) double probability,
    DateTime? closeDate,
    String? leadSource,
    String? description,
    @Default('pending') String paymentStatus,
    @Default('NEW_BUSINESS') String type,
    String? accountId,
    AccountRef? account,
    OwnerRef? owner,
    @Default(<ContactRef>[]) List<ContactRef> contacts,
    EmiSchedule? emiSchedule,
    @Default(<PaymentRecord>[]) List<PaymentRecord> paymentRecords,
  }) = _Opportunity;

  factory Opportunity.fromJson(Map<String, dynamic> json) => _$OpportunityFromJson(json);
}
