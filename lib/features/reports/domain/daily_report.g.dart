// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyReportImpl _$$DailyReportImplFromJson(Map<String, dynamic> json) =>
    _$DailyReportImpl(
      table:
          (json['table'] as List<dynamic>?)
              ?.map((e) => DailyReportRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DailyReportRow>[],
      summary: json['summary'] == null
          ? null
          : DailyReportSummary.fromJson(
              json['summary'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$DailyReportImplToJson(_$DailyReportImpl instance) =>
    <String, dynamic>{'table': instance.table, 'summary': instance.summary};

_$DailyReportRowImpl _$$DailyReportRowImplFromJson(Map<String, dynamic> json) =>
    _$DailyReportRowImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
      branch: json['branch'] as String?,
      totalCalls: (json['totalCalls'] as num?)?.toInt() ?? 0,
      totalConnected: (json['totalConnected'] as num?)?.toInt() ?? 0,
      totalUnconnected: (json['totalUnconnected'] as num?)?.toInt() ?? 0,
      totalConverted: (json['totalConverted'] as num?)?.toInt() ?? 0,
      totalLost: (json['totalLost'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DailyReportRowImplToJson(
  _$DailyReportRowImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'branch': instance.branch,
  'totalCalls': instance.totalCalls,
  'totalConnected': instance.totalConnected,
  'totalUnconnected': instance.totalUnconnected,
  'totalConverted': instance.totalConverted,
  'totalLost': instance.totalLost,
};

_$DailyReportSummaryImpl _$$DailyReportSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$DailyReportSummaryImpl(
  totalCalls: (json['totalCalls'] as num?)?.toInt() ?? 0,
  incoming: (json['incoming'] as num?)?.toInt() ?? 0,
  outgoing: (json['outgoing'] as num?)?.toInt() ?? 0,
  missed: (json['missed'] as num?)?.toInt() ?? 0,
  rejected: (json['rejected'] as num?)?.toInt() ?? 0,
  neverAttended: (json['neverAttended'] as num?)?.toInt() ?? 0,
  notPickedUp: (json['notPickedUp'] as num?)?.toInt() ?? 0,
  unique: (json['unique'] as num?)?.toInt() ?? 0,
  totalDuration: (json['totalDuration'] as num?)?.toInt() ?? 0,
  incomingDuration: (json['incomingDuration'] as num?)?.toInt() ?? 0,
  outgoingDuration: (json['outgoingDuration'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$DailyReportSummaryImplToJson(
  _$DailyReportSummaryImpl instance,
) => <String, dynamic>{
  'totalCalls': instance.totalCalls,
  'incoming': instance.incoming,
  'outgoing': instance.outgoing,
  'missed': instance.missed,
  'rejected': instance.rejected,
  'neverAttended': instance.neverAttended,
  'notPickedUp': instance.notPickedUp,
  'unique': instance.unique,
  'totalDuration': instance.totalDuration,
  'incomingDuration': instance.incomingDuration,
  'outgoingDuration': instance.outgoingDuration,
};
