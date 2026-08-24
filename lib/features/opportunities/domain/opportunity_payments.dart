import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_payments.freezed.dart';
part 'opportunity_payments.g.dart';

/// Display-only mirrors of `EMISchedule`/`EMIInstallment`/`PaymentRecord`
/// (Dad-backend/prisma/schema.prisma). The mobile app never computes EMI
/// math itself — these are read-only projections of server state.
///
/// `totalAmount`/`remainingAmount` are defaulted, not required: the
/// Opportunities LIST endpoint selects `emiSchedule: { id, status }` only
/// (Dad-backend/src/controllers/opportunityController.ts:94) — no amounts
/// at all — while `getOpportunityById` returns the full row. Same class of
/// bug as `AccountRef.id` (see opportunity_refs.dart): a required field the
/// list endpoint doesn't actually send, which crashed the whole list for
/// any org with a closed-won EMI deal in it. The detail screen still gets
/// real, non-zero values here since that endpoint sends everything.
@freezed
class EmiSchedule with _$EmiSchedule {
  const factory EmiSchedule({
    required String id,
    @Default(0) double totalAmount,
    @Default(0) double paidAmount,
    @Default(0) double remainingAmount,
    @Default('active') String status,
    @Default(<EmiInstallment>[]) List<EmiInstallment> installments,
  }) = _EmiSchedule;

  factory EmiSchedule.fromJson(Map<String, dynamic> json) => _$EmiScheduleFromJson(json);
}

@freezed
class EmiInstallment with _$EmiInstallment {
  const factory EmiInstallment({
    required String id,
    required int installmentNumber,
    required double amount,
    @Default(0) double paidAmount,
    required DateTime dueDate,
    @Default('pending') String status,
    DateTime? paidDate,
  }) = _EmiInstallment;

  factory EmiInstallment.fromJson(Map<String, dynamic> json) => _$EmiInstallmentFromJson(json);
}

@freezed
class PaymentRecord with _$PaymentRecord {
  const factory PaymentRecord({
    required String id,
    required double amount,
    required DateTime paymentDate,
    String? paymentMethod,
    @Default('full') String paymentType,
    String? notes,
  }) = _PaymentRecord;

  factory PaymentRecord.fromJson(Map<String, dynamic> json) => _$PaymentRecordFromJson(json);
}
