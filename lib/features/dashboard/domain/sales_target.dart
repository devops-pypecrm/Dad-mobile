import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_target.freezed.dart';
part 'sales_target.g.dart';

/// Mirrors the subset of `Dad-backend/prisma/schema.prisma`'s `SalesTarget`
/// model returned by `GET /api/sales-targets` (`getMyTargets`,
/// Dad-backend/src/controllers/salesTargetController.ts:397-417 —
/// `{ targets: SalesTarget[] }`, no achievement % pre-computed there).
@freezed
class SalesTarget with _$SalesTarget {
  const SalesTarget._();

  const factory SalesTarget({
    required String id,
    required double targetValue,
    @Default(0) double achievedValue,
    required String period,
    required DateTime startDate,
    required DateTime endDate,
    @Default('active') String status,
    @Default('revenue') String metric,
  }) = _SalesTarget;

  factory SalesTarget.fromJson(Map<String, dynamic> json) => _$SalesTargetFromJson(json);

  double get achievementPercent => targetValue > 0 ? (achievedValue / targetValue).clamp(0, 1) * 100 : 0;

  bool get isCurrent {
    final now = DateTime.now();
    return status == 'active' && !now.isBefore(startDate) && !now.isAfter(endDate);
  }
}
