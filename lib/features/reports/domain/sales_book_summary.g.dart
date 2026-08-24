// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_book_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesBookSummaryImpl _$$SalesBookSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$SalesBookSummaryImpl(
  period: json['period'] as String,
  summary: SalesBookTotals.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SalesBookSummaryImplToJson(
  _$SalesBookSummaryImpl instance,
) => <String, dynamic>{'period': instance.period, 'summary': instance.summary};

_$SalesBookTotalsImpl _$$SalesBookTotalsImplFromJson(
  Map<String, dynamic> json,
) => _$SalesBookTotalsImpl(
  totalDeals: (json['totalDeals'] as num?)?.toInt() ?? 0,
  totalValue: (json['totalValue'] as num?)?.toDouble() ?? 0,
  averageDealSize: (json['averageDealSize'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$$SalesBookTotalsImplToJson(
  _$SalesBookTotalsImpl instance,
) => <String, dynamic>{
  'totalDeals': instance.totalDeals,
  'totalValue': instance.totalValue,
  'averageDealSize': instance.averageDealSize,
};
