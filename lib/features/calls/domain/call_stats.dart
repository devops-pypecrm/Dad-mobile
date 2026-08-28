import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_stats.freezed.dart';
part 'call_stats.g.dart';

/// `GET /api/calls/stats` response
/// (Dad-backend/src/controllers/callController.ts `getCallStats`) — same
/// figures the web `/calls` page's four stat cards show.
@freezed
class CallStats with _$CallStats {
  const factory CallStats({
    @Default(0) int totalCalls,
    @Default(0) int outboundCalls,
    @Default(0) int inboundCalls,
    @Default(0) int missedCalls,
    @Default(0) int completedCalls,
    /// Minutes, one decimal place — matches the backend's own rounding.
    @Default(0) double avgDuration,
    @Default(0) int callsWithRecording,
    @Default('week') String period,
  }) = _CallStats;

  factory CallStats.fromJson(Map<String, dynamic> json) => _$CallStatsFromJson(json);
}
