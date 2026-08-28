// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallStatsImpl _$$CallStatsImplFromJson(Map<String, dynamic> json) =>
    _$CallStatsImpl(
      totalCalls: (json['totalCalls'] as num?)?.toInt() ?? 0,
      outboundCalls: (json['outboundCalls'] as num?)?.toInt() ?? 0,
      inboundCalls: (json['inboundCalls'] as num?)?.toInt() ?? 0,
      missedCalls: (json['missedCalls'] as num?)?.toInt() ?? 0,
      completedCalls: (json['completedCalls'] as num?)?.toInt() ?? 0,
      avgDuration: (json['avgDuration'] as num?)?.toDouble() ?? 0,
      callsWithRecording: (json['callsWithRecording'] as num?)?.toInt() ?? 0,
      period: json['period'] as String? ?? 'week',
    );

Map<String, dynamic> _$$CallStatsImplToJson(_$CallStatsImpl instance) =>
    <String, dynamic>{
      'totalCalls': instance.totalCalls,
      'outboundCalls': instance.outboundCalls,
      'inboundCalls': instance.inboundCalls,
      'missedCalls': instance.missedCalls,
      'completedCalls': instance.completedCalls,
      'avgDuration': instance.avgDuration,
      'callsWithRecording': instance.callsWithRecording,
      'period': instance.period,
    };
