import 'package:freezed_annotation/freezed_annotation.dart';

part 'leads_report_summary.freezed.dart';
part 'leads_report_summary.g.dart';

/// `GET /api/reports/leads` response — modeling only `summary` (the
/// per-stage/per-status breakdown used for the funnel chart), not the full
/// `leads[]` array, for the same "summary cards, not tables" reason as
/// [SalesBookSummary].
@freezed
class LeadsReportSummary with _$LeadsReportSummary {
  const factory LeadsReportSummary({
    required LeadsReportCounts summary,
  }) = _LeadsReportSummary;

  factory LeadsReportSummary.fromJson(Map<String, dynamic> json) => _$LeadsReportSummaryFromJson(json);
}

@freezed
class LeadsReportCounts with _$LeadsReportCounts {
  const factory LeadsReportCounts({
    @Default(0) int total,
    @Default(<String, int>{}) Map<String, int> byStage,
    @Default(<String, int>{}) Map<String, int> byStatus,
  }) = _LeadsReportCounts;

  factory LeadsReportCounts.fromJson(Map<String, dynamic> json) => _$LeadsReportCountsFromJson(json);
}
