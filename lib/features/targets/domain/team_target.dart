import 'package:freezed_annotation/freezed_annotation.dart';

import '../../opportunities/domain/opportunity_refs.dart';

part 'team_target.freezed.dart';
part 'team_target.g.dart';

/// `GET /api/sales-targets/team` (`getTeamTargets`) response item — the same
/// `SalesTarget` shape as `GET /api/sales-targets` plus the `assignedTo`
/// relation (Dad-backend/src/controllers/salesTargetController.ts:427-449).
/// Kept separate from features/dashboard/domain/sales_target.dart's
/// `SalesTarget` rather than adding an optional field there, since "my
/// targets" never has an `assignedTo` to show.
@freezed
class TeamTarget with _$TeamTarget {
  const TeamTarget._();

  const factory TeamTarget({
    required String id,
    required double targetValue,
    @Default(0) double achievedValue,
    required String period,
    @Default('active') String status,
    OwnerRef? assignedTo,
  }) = _TeamTarget;

  factory TeamTarget.fromJson(Map<String, dynamic> json) => _$TeamTargetFromJson(json);

  double get achievementPercent => targetValue > 0 ? (achievedValue / targetValue).clamp(0, 1) * 100 : 0;
}
