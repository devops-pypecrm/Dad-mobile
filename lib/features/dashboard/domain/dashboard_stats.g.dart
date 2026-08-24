// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      totalLeads: (json['totalLeads'] as num?)?.toInt() ?? 0,
      activeOpportunities: (json['activeOpportunities'] as num?)?.toInt() ?? 0,
      pendingFollowUps: (json['pendingFollowUps'] as num?)?.toInt() ?? 0,
      salesRevenue: (json['salesRevenue'] as num?)?.toDouble() ?? 0,
      revenueThisMonth: (json['revenueThisMonth'] as num?)?.toDouble() ?? 0,
      winRate: (json['winRate'] as num?)?.toDouble() ?? 0,
      leads: json['leads'] == null
          ? null
          : LeadCounts.fromJson(json['leads'] as Map<String, dynamic>),
      opportunities: json['opportunities'] == null
          ? null
          : OpportunityCounts.fromJson(
              json['opportunities'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
  _$DashboardStatsImpl instance,
) => <String, dynamic>{
  'totalLeads': instance.totalLeads,
  'activeOpportunities': instance.activeOpportunities,
  'pendingFollowUps': instance.pendingFollowUps,
  'salesRevenue': instance.salesRevenue,
  'revenueThisMonth': instance.revenueThisMonth,
  'winRate': instance.winRate,
  'leads': instance.leads,
  'opportunities': instance.opportunities,
};

_$LeadCountsImpl _$$LeadCountsImplFromJson(Map<String, dynamic> json) =>
    _$LeadCountsImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
      newCount: (json['new'] as num?)?.toInt() ?? 0,
      converted: (json['converted'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadCountsImplToJson(_$LeadCountsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'new': instance.newCount,
      'converted': instance.converted,
    };

_$OpportunityCountsImpl _$$OpportunityCountsImplFromJson(
  Map<String, dynamic> json,
) => _$OpportunityCountsImpl(
  total: (json['total'] as num?)?.toInt() ?? 0,
  value: (json['value'] as num?)?.toDouble() ?? 0,
  won: (json['won'] as num?)?.toInt() ?? 0,
  lost: (json['lost'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$OpportunityCountsImplToJson(
  _$OpportunityCountsImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'value': instance.value,
  'won': instance.won,
  'lost': instance.lost,
};
