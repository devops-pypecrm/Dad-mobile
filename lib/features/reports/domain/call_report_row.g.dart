// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_report_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallReportRowImpl _$$CallReportRowImplFromJson(Map<String, dynamic> json) =>
    _$CallReportRowImpl(
      userId: json['userId'] as String,
      agentName: json['agentName'] as String,
      branch: json['branch'] as String?,
      totalCalls: (json['totalCalls'] as num?)?.toInt() ?? 0,
      connectedCalls: (json['connectedCalls'] as num?)?.toInt() ?? 0,
      totalDurationSeconds:
          (json['totalDurationSeconds'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CallReportRowImplToJson(_$CallReportRowImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'agentName': instance.agentName,
      'branch': instance.branch,
      'totalCalls': instance.totalCalls,
      'connectedCalls': instance.connectedCalls,
      'totalDurationSeconds': instance.totalDurationSeconds,
    };

_$CallReportImpl _$$CallReportImplFromJson(Map<String, dynamic> json) =>
    _$CallReportImpl(
      reportData:
          (json['reportData'] as List<dynamic>?)
              ?.map((e) => CallReportRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CallReportRow>[],
      period: json['period'] as String? ?? 'today',
      direction: json['direction'] as String? ?? 'all',
    );

Map<String, dynamic> _$$CallReportImplToJson(_$CallReportImpl instance) =>
    <String, dynamic>{
      'reportData': instance.reportData,
      'period': instance.period,
      'direction': instance.direction,
    };
