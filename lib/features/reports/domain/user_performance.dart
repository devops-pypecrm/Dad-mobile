import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_performance.freezed.dart';
part 'user_performance.g.dart';

/// `GET /api/reports/user-performance` response shape:
/// `{ performance: PerformanceEntry[] }`
/// (Dad-backend/src/controllers/reportController.ts:97-192). Omitting
/// `userId` returns the caller's visible subordinates automatically —
/// the mobile client never filters this list itself.
@freezed
class PerformanceEntry with _$PerformanceEntry {
  const factory PerformanceEntry({
    required PerformanceUserRef user,
    required PerformanceMetrics metrics,
  }) = _PerformanceEntry;

  factory PerformanceEntry.fromJson(Map<String, dynamic> json) => _$PerformanceEntryFromJson(json);
}

@freezed
class PerformanceUserRef with _$PerformanceUserRef {
  const factory PerformanceUserRef({
    required String id,
    required String name,
    String? role,
  }) = _PerformanceUserRef;

  factory PerformanceUserRef.fromJson(Map<String, dynamic> json) => _$PerformanceUserRefFromJson(json);
}

@freezed
class PerformanceMetrics with _$PerformanceMetrics {
  const factory PerformanceMetrics({
    @Default(0) int leadsAssigned,
    @Default(0) int leadsConverted,
    @Default(0) double conversionRate,
    @Default(0) int callsMade,
    @Default(0) int meetingsHeld,
  }) = _PerformanceMetrics;

  factory PerformanceMetrics.fromJson(Map<String, dynamic> json) => _$PerformanceMetricsFromJson(json);
}
