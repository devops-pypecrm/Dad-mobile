import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_performer.freezed.dart';
part 'top_performer.g.dart';

/// `GET /api/analytics/top-performers` response entry
/// (Dad-backend/src/controllers/analyticsController.ts:740-813). Already
/// sorted by revenue desc and capped to 5 server-side — no client-side
/// re-ranking needed.
@freezed
class TopPerformer with _$TopPerformer {
  const factory TopPerformer({
    required String id,
    required String name,
    String? email,
    String? image,
    @Default(0) double totalRevenue,
    @Default(0) int dealsWon,
  }) = _TopPerformer;

  factory TopPerformer.fromJson(Map<String, dynamic> json) => _$TopPerformerFromJson(json);
}
