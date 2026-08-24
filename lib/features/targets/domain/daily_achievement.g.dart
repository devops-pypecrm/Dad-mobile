// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyAchievementImpl _$$DailyAchievementImplFromJson(
  Map<String, dynamic> json,
) => _$DailyAchievementImpl(
  hasTarget: json['hasTarget'] as bool? ?? false,
  showNotification: json['showNotification'] as bool? ?? false,
  target: json['target'] == null
      ? null
      : DailyTargetSummary.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DailyAchievementImplToJson(
  _$DailyAchievementImpl instance,
) => <String, dynamic>{
  'hasTarget': instance.hasTarget,
  'showNotification': instance.showNotification,
  'target': instance.target,
};

_$DailyTargetSummaryImpl _$$DailyTargetSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$DailyTargetSummaryImpl(
  id: json['_id'] as String?,
  targetValue: (json['targetValue'] as num).toDouble(),
  achievedValue: (json['achievedValue'] as num).toDouble(),
  achievementPercent: (json['achievementPercent'] as num).toInt(),
  period: json['period'] as String,
  daysRemaining: (json['daysRemaining'] as num).toInt(),
  amountRemaining: (json['amountRemaining'] as num).toDouble(),
);

Map<String, dynamic> _$$DailyTargetSummaryImplToJson(
  _$DailyTargetSummaryImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'targetValue': instance.targetValue,
  'achievedValue': instance.achievedValue,
  'achievementPercent': instance.achievementPercent,
  'period': instance.period,
  'daysRemaining': instance.daysRemaining,
  'amountRemaining': instance.amountRemaining,
};
