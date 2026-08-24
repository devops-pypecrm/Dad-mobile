// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_report_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadsReportSummaryImpl _$$LeadsReportSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$LeadsReportSummaryImpl(
  summary: LeadsReportCounts.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LeadsReportSummaryImplToJson(
  _$LeadsReportSummaryImpl instance,
) => <String, dynamic>{'summary': instance.summary};

_$LeadsReportCountsImpl _$$LeadsReportCountsImplFromJson(
  Map<String, dynamic> json,
) => _$LeadsReportCountsImpl(
  total: (json['total'] as num?)?.toInt() ?? 0,
  byStage:
      (json['byStage'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const <String, int>{},
  byStatus:
      (json['byStatus'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const <String, int>{},
);

Map<String, dynamic> _$$LeadsReportCountsImplToJson(
  _$LeadsReportCountsImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'byStage': instance.byStage,
  'byStatus': instance.byStatus,
};
