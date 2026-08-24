import 'package:freezed_annotation/freezed_annotation.dart';

import 'followup.dart';

part 'followups_page.freezed.dart';
part 'followups_page.g.dart';

/// `GET /api/follow-ups` response shape:
/// `{ tasks, page, totalPages, totalTasks, counts: { active, overdue, today, upcoming } }`
/// (Dad-backend/src/controllers/followUpController.ts:207-218). Note the
/// list key is `tasks`, not `followUps`.
@freezed
class FollowUpsPage with _$FollowUpsPage {
  const factory FollowUpsPage({
    required List<FollowUp> tasks,
    required int page,
    required int totalPages,
    required int totalTasks,
    required FollowUpCounts counts,
  }) = _FollowUpsPage;

  factory FollowUpsPage.fromJson(Map<String, dynamic> json) => _$FollowUpsPageFromJson(json);
}

@freezed
class FollowUpCounts with _$FollowUpCounts {
  const factory FollowUpCounts({
    @Default(0) int active,
    @Default(0) int overdue,
    @Default(0) int today,
    @Default(0) int upcoming,
  }) = _FollowUpCounts;

  factory FollowUpCounts.fromJson(Map<String, dynamic> json) => _$FollowUpCountsFromJson(json);
}
