import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_achievement.freezed.dart';
part 'daily_achievement.g.dart';

/// `GET /api/sales-targets/daily` response shape
/// (Dad-backend/src/controllers/salesTargetController.ts:511-523) —
/// `{ hasTarget: false }` or `{ hasTarget: true, showNotification, target: {...} }`.
/// `achievementPercent`/`daysRemaining`/`amountRemaining` are all computed
/// server-side, never recalculated client-side.
@freezed
class DailyAchievement with _$DailyAchievement {
  const factory DailyAchievement({
    @Default(false) bool hasTarget,
    @Default(false) bool showNotification,
    DailyTargetSummary? target,
  }) = _DailyAchievement;

  factory DailyAchievement.fromJson(Map<String, dynamic> json) => _$DailyAchievementFromJson(json);
}

@freezed
class DailyTargetSummary with _$DailyTargetSummary {
  const factory DailyTargetSummary({
    @JsonKey(name: '_id') String? id,
    required double targetValue,
    required double achievedValue,
    required int achievementPercent,
    required String period,
    required int daysRemaining,
    required double amountRemaining,
  }) = _DailyTargetSummary;

  factory DailyTargetSummary.fromJson(Map<String, dynamic> json) => _$DailyTargetSummaryFromJson(json);
}
