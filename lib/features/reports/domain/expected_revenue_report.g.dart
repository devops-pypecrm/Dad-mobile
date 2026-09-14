// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expected_revenue_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpectedRevenueReportImpl _$$ExpectedRevenueReportImplFromJson(
  Map<String, dynamic> json,
) => _$ExpectedRevenueReportImpl(
  periodLabel: json['periodLabel'] as String,
  summary: ExpectedRevenueSummary.fromJson(
    json['summary'] as Map<String, dynamic>,
  ),
  deals:
      (json['deals'] as List<dynamic>?)
          ?.map((e) => ExpectedRevenueDeal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ExpectedRevenueDeal>[],
);

Map<String, dynamic> _$$ExpectedRevenueReportImplToJson(
  _$ExpectedRevenueReportImpl instance,
) => <String, dynamic>{
  'periodLabel': instance.periodLabel,
  'summary': instance.summary,
  'deals': instance.deals,
};

_$ExpectedRevenueSummaryImpl _$$ExpectedRevenueSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ExpectedRevenueSummaryImpl(
  totalExpectedRevenue: (json['totalExpectedRevenue'] as num?)?.toDouble() ?? 0,
  currentPeriodAmount: (json['currentPeriodAmount'] as num?)?.toDouble() ?? 0,
  currentPeriodCount: (json['currentPeriodCount'] as num?)?.toInt() ?? 0,
  carriedForwardAmount: (json['carriedForwardAmount'] as num?)?.toDouble() ?? 0,
  carriedForwardCount: (json['carriedForwardCount'] as num?)?.toInt() ?? 0,
  upcomingAmount: (json['upcomingAmount'] as num?)?.toDouble() ?? 0,
  upcomingCount: (json['upcomingCount'] as num?)?.toInt() ?? 0,
  noCloseDateAmount: (json['noCloseDateAmount'] as num?)?.toDouble() ?? 0,
  noCloseDateCount: (json['noCloseDateCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ExpectedRevenueSummaryImplToJson(
  _$ExpectedRevenueSummaryImpl instance,
) => <String, dynamic>{
  'totalExpectedRevenue': instance.totalExpectedRevenue,
  'currentPeriodAmount': instance.currentPeriodAmount,
  'currentPeriodCount': instance.currentPeriodCount,
  'carriedForwardAmount': instance.carriedForwardAmount,
  'carriedForwardCount': instance.carriedForwardCount,
  'upcomingAmount': instance.upcomingAmount,
  'upcomingCount': instance.upcomingCount,
  'noCloseDateAmount': instance.noCloseDateAmount,
  'noCloseDateCount': instance.noCloseDateCount,
};

_$ExpectedRevenueDealImpl _$$ExpectedRevenueDealImplFromJson(
  Map<String, dynamic> json,
) => _$ExpectedRevenueDealImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  customerName: json['customerName'] as String,
  ownerName: json['ownerName'] as String,
  branchName: json['branchName'] as String,
  stage: json['stage'] as String,
  amount: (json['amount'] as num?)?.toDouble() ?? 0,
  probability: (json['probability'] as num?)?.toInt() ?? 0,
  closeDate: json['closeDate'] == null
      ? null
      : DateTime.parse(json['closeDate'] as String),
  status: $enumDecode(_$ExpectedRevenueDealStatusEnumMap, json['status']),
);

Map<String, dynamic> _$$ExpectedRevenueDealImplToJson(
  _$ExpectedRevenueDealImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'customerName': instance.customerName,
  'ownerName': instance.ownerName,
  'branchName': instance.branchName,
  'stage': instance.stage,
  'amount': instance.amount,
  'probability': instance.probability,
  'closeDate': instance.closeDate?.toIso8601String(),
  'status': _$ExpectedRevenueDealStatusEnumMap[instance.status]!,
};

const _$ExpectedRevenueDealStatusEnumMap = {
  ExpectedRevenueDealStatus.current: 'current',
  ExpectedRevenueDealStatus.carriedForward: 'carried_forward',
  ExpectedRevenueDealStatus.upcoming: 'upcoming',
  ExpectedRevenueDealStatus.noDate: 'no_date',
};
