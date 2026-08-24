import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';
part 'dashboard_stats.g.dart';

/// `GET /api/analytics/dashboard` response shape
/// (Dad-backend/src/controllers/analyticsController.ts:324-350). Displayed
/// as-is — no client-side math on top of these numbers.
@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    @Default(0) int totalLeads,
    @Default(0) int activeOpportunities,
    @Default(0) int pendingFollowUps,
    @Default(0) double salesRevenue,
    @Default(0) double revenueThisMonth,
    @Default(0) double winRate,
    LeadCounts? leads,
    OpportunityCounts? opportunities,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) => _$DashboardStatsFromJson(json);
}

@freezed
class LeadCounts with _$LeadCounts {
  const factory LeadCounts({
    @Default(0) int total,
    @JsonKey(name: 'new') @Default(0) int newCount,
    @Default(0) int converted,
  }) = _LeadCounts;

  factory LeadCounts.fromJson(Map<String, dynamic> json) => _$LeadCountsFromJson(json);
}

@freezed
class OpportunityCounts with _$OpportunityCounts {
  const factory OpportunityCounts({
    @Default(0) int total,
    @Default(0) double value,
    @Default(0) int won,
    @Default(0) int lost,
  }) = _OpportunityCounts;

  factory OpportunityCounts.fromJson(Map<String, dynamic> json) => _$OpportunityCountsFromJson(json);
}
