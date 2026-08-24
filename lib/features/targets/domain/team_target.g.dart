// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamTargetImpl _$$TeamTargetImplFromJson(Map<String, dynamic> json) =>
    _$TeamTargetImpl(
      id: json['id'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      achievedValue: (json['achievedValue'] as num?)?.toDouble() ?? 0,
      period: json['period'] as String,
      status: json['status'] as String? ?? 'active',
      assignedTo: json['assignedTo'] == null
          ? null
          : OwnerRef.fromJson(json['assignedTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TeamTargetImplToJson(_$TeamTargetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetValue': instance.targetValue,
      'achievedValue': instance.achievedValue,
      'period': instance.period,
      'status': instance.status,
      'assignedTo': instance.assignedTo,
    };
