// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunities_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpportunitiesPageImpl _$$OpportunitiesPageImplFromJson(
  Map<String, dynamic> json,
) => _$OpportunitiesPageImpl(
  opportunities: (json['opportunities'] as List<dynamic>)
      .map((e) => Opportunity.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalOpportunities: (json['totalOpportunities'] as num).toInt(),
);

Map<String, dynamic> _$$OpportunitiesPageImplToJson(
  _$OpportunitiesPageImpl instance,
) => <String, dynamic>{
  'opportunities': instance.opportunities,
  'page': instance.page,
  'totalPages': instance.totalPages,
  'totalOpportunities': instance.totalOpportunities,
};
