import 'package:freezed_annotation/freezed_annotation.dart';

part 'expected_revenue_report.freezed.dart';
part 'expected_revenue_report.g.dart';

/// `GET /api/analytics/expected-revenue` response — every currently-open
/// deal plus a per-deal classification against the selected period's close-
/// date window (Dad-backend/src/controllers/analyticsController.ts's
/// getExpectedRevenueReport). This is a live snapshot, not a per-period
/// slice: a deal opened last month that's still open shows up as
/// "carried_forward", it never just disappears when a date filter is
/// applied — see that controller's own doc comment for why.
@freezed
class ExpectedRevenueReport with _$ExpectedRevenueReport {
  const factory ExpectedRevenueReport({
    required String periodLabel,
    required ExpectedRevenueSummary summary,
    @Default(<ExpectedRevenueDeal>[]) List<ExpectedRevenueDeal> deals,
  }) = _ExpectedRevenueReport;

  factory ExpectedRevenueReport.fromJson(Map<String, dynamic> json) => _$ExpectedRevenueReportFromJson(json);
}

@freezed
class ExpectedRevenueSummary with _$ExpectedRevenueSummary {
  const factory ExpectedRevenueSummary({
    @Default(0) double totalExpectedRevenue,
    @Default(0) double currentPeriodAmount,
    @Default(0) int currentPeriodCount,
    @Default(0) double carriedForwardAmount,
    @Default(0) int carriedForwardCount,
    @Default(0) double upcomingAmount,
    @Default(0) int upcomingCount,
    @Default(0) double noCloseDateAmount,
    @Default(0) int noCloseDateCount,
  }) = _ExpectedRevenueSummary;

  factory ExpectedRevenueSummary.fromJson(Map<String, dynamic> json) => _$ExpectedRevenueSummaryFromJson(json);
}

enum ExpectedRevenueDealStatus {
  current,
  @JsonValue('carried_forward')
  carriedForward,
  upcoming,
  @JsonValue('no_date')
  noDate,
}

@freezed
class ExpectedRevenueDeal with _$ExpectedRevenueDeal {
  const factory ExpectedRevenueDeal({
    required String id,
    required String name,
    required String customerName,
    required String ownerName,
    required String branchName,
    required String stage,
    @Default(0) double amount,
    @Default(0) int probability,
    DateTime? closeDate,
    required ExpectedRevenueDealStatus status,
  }) = _ExpectedRevenueDeal;

  factory ExpectedRevenueDeal.fromJson(Map<String, dynamic> json) => _$ExpectedRevenueDealFromJson(json);
}
