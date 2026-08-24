// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesTargetImpl _$$SalesTargetImplFromJson(Map<String, dynamic> json) =>
    _$SalesTargetImpl(
      id: json['id'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      achievedValue: (json['achievedValue'] as num?)?.toDouble() ?? 0,
      period: json['period'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: json['status'] as String? ?? 'active',
      metric: json['metric'] as String? ?? 'revenue',
    );

Map<String, dynamic> _$$SalesTargetImplToJson(_$SalesTargetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetValue': instance.targetValue,
      'achievedValue': instance.achievedValue,
      'period': instance.period,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': instance.status,
      'metric': instance.metric,
    };
