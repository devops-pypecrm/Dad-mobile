import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_source_stat.freezed.dart';
part 'lead_source_stat.g.dart';

/// `GET /api/analytics/lead-sources` response entry
/// (Dad-backend/src/controllers/analyticsController.ts:576-616). Org/branch
/// scoped only — the backend applies no date filter here, so this is an
/// all-time breakdown, not "this month".
@freezed
class LeadSourceStat with _$LeadSourceStat {
  const factory LeadSourceStat({
    required String source,
    @Default(0) int count,
  }) = _LeadSourceStat;

  factory LeadSourceStat.fromJson(Map<String, dynamic> json) => _$LeadSourceStatFromJson(json);
}
