import 'package:freezed_annotation/freezed_annotation.dart';

import '../../opportunities/domain/opportunity_payments.dart';

part 'emi_schedule_summary.freezed.dart';
part 'emi_schedule_summary.g.dart';

/// One item of `GET /api/emi-schedules?status=` response's `schedules[]`
/// (Dad-backend/src/controllers/emiController.ts `getEMISchedules`) — the
/// same `EmiSchedule` shape as Opportunity detail's inline EMI section,
/// plus the linked `opportunity` ref since this list spans opportunities.
@freezed
class EmiScheduleSummary with _$EmiScheduleSummary {
  const EmiScheduleSummary._();

  const factory EmiScheduleSummary({
    required String id,
    required double totalAmount,
    @Default(0) double paidAmount,
    required double remainingAmount,
    @Default('active') String status,
    required EmiOpportunityRef opportunity,
    @Default(<EmiInstallment>[]) List<EmiInstallment> installments,
  }) = _EmiScheduleSummary;

  factory EmiScheduleSummary.fromJson(Map<String, dynamic> json) => _$EmiScheduleSummaryFromJson(json);

  /// Earliest not-yet-paid installment — display-only grouping (like the
  /// Overdue/Today/Upcoming sections on My Day), not a recomputation of any
  /// amount or status the backend already determined.
  EmiInstallment? get nextDueInstallment {
    final pending = installments.where((i) => i.status == 'pending' || i.status == 'overdue').toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    return pending.isEmpty ? null : pending.first;
  }

  bool get isOverdue => installments.any((i) => i.status == 'overdue');
}

@freezed
class EmiOpportunityRef with _$EmiOpportunityRef {
  const factory EmiOpportunityRef({required String id, required String name}) = _EmiOpportunityRef;

  factory EmiOpportunityRef.fromJson(Map<String, dynamic> json) => _$EmiOpportunityRefFromJson(json);
}
