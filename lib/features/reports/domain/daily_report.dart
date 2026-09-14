import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report.freezed.dart';
part 'daily_report.g.dart';

/// `GET /api/reports/daily-report` response shape
/// (Dad-backend/src/controllers/reportController.ts `getDailyReport`) —
/// same data Dad-frontend's `/reports/daily` page renders. Hierarchy
/// visibility (self + subordinates via `getVisibleUserIds`, org-wide for
/// admins) is entirely server-computed, same as `CallReport`.
@freezed
class DailyReport with _$DailyReport {
  const factory DailyReport({
    @Default(<DailyReportRow>[]) List<DailyReportRow> table,
    DailyReportSummary? summary,
  }) = _DailyReport;

  factory DailyReport.fromJson(Map<String, dynamic> json) => _$DailyReportFromJson(json);
}

@freezed
class DailyReportRow with _$DailyReportRow {
  const factory DailyReportRow({
    required String id,
    required String userName,
    String? branch,
    @Default(0) int totalCalls,
    @Default(0) int totalConnected,
    @Default(0) int totalUnconnected,
    @Default(0) int totalConverted,
    @Default(0) int totalLost,
  }) = _DailyReportRow;

  factory DailyReportRow.fromJson(Map<String, dynamic> json) => _$DailyReportRowFromJson(json);
}

/// Org-wide (respecting the same branch filter + visibility as [table]'s
/// rows) call-direction breakdown — durations in seconds.
@freezed
class DailyReportSummary with _$DailyReportSummary {
  const factory DailyReportSummary({
    @Default(0) int totalCalls,
    @Default(0) int incoming,
    @Default(0) int outgoing,
    @Default(0) int missed,
    @Default(0) int rejected,
    @Default(0) int neverAttended,
    @Default(0) int notPickedUp,
    @Default(0) int unique,
    @Default(0) int totalDuration,
    @Default(0) int incomingDuration,
    @Default(0) int outgoingDuration,
  }) = _DailyReportSummary;

  factory DailyReportSummary.fromJson(Map<String, dynamic> json) => _$DailyReportSummaryFromJson(json);
}
