import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_report_row.freezed.dart';
part 'call_report_row.g.dart';

/// One row of `GET /api/calls/reports/user-analytics`'s `reportData` array
/// (Dad-backend/src/controllers/callController.ts `getUserCallAnalytics`) —
/// one entry per visible user (self + subordinates per the caller's
/// hierarchy, server-computed via `getVisibleUserIds`; org-wide for
/// admin/super_admin). Already sorted `totalCalls` descending by the
/// backend.
@freezed
class CallReportRow with _$CallReportRow {
  const factory CallReportRow({
    required String userId,
    required String agentName,
    String? branch,
    @Default(0) int totalCalls,
    @Default(0) int connectedCalls,
    @Default(0) double totalDurationSeconds,
  }) = _CallReportRow;

  const CallReportRow._();

  factory CallReportRow.fromJson(Map<String, dynamic> json) => _$CallReportRowFromJson(json);

  int get connectRatePercent => totalCalls > 0 ? ((connectedCalls / totalCalls) * 100).round() : 0;

  double get averageTalkSeconds => connectedCalls > 0 ? totalDurationSeconds / connectedCalls : 0;
}

/// `GET /api/calls/reports/user-analytics` response shape.
@freezed
class CallReport with _$CallReport {
  const factory CallReport({
    @Default(<CallReportRow>[]) List<CallReportRow> reportData,
    @Default('today') String period,
    @Default('all') String direction,
  }) = _CallReport;

  factory CallReport.fromJson(Map<String, dynamic> json) => _$CallReportFromJson(json);
}
