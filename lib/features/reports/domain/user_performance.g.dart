// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceEntryImpl _$$PerformanceEntryImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceEntryImpl(
  user: PerformanceUserRef.fromJson(json['user'] as Map<String, dynamic>),
  metrics: PerformanceMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PerformanceEntryImplToJson(
  _$PerformanceEntryImpl instance,
) => <String, dynamic>{'user': instance.user, 'metrics': instance.metrics};

_$PerformanceUserRefImpl _$$PerformanceUserRefImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceUserRefImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  role: json['role'] as String?,
);

Map<String, dynamic> _$$PerformanceUserRefImplToJson(
  _$PerformanceUserRefImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': instance.role,
};

_$PerformanceMetricsImpl _$$PerformanceMetricsImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceMetricsImpl(
  leadsAssigned: (json['leadsAssigned'] as num?)?.toInt() ?? 0,
  leadsConverted: (json['leadsConverted'] as num?)?.toInt() ?? 0,
  conversionRate: (json['conversionRate'] as num?)?.toDouble() ?? 0,
  callsMade: (json['callsMade'] as num?)?.toInt() ?? 0,
  meetingsHeld: (json['meetingsHeld'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$PerformanceMetricsImplToJson(
  _$PerformanceMetricsImpl instance,
) => <String, dynamic>{
  'leadsAssigned': instance.leadsAssigned,
  'leadsConverted': instance.leadsConverted,
  'conversionRate': instance.conversionRate,
  'callsMade': instance.callsMade,
  'meetingsHeld': instance.meetingsHeld,
};
