import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_timeline_item.freezed.dart';
part 'opportunity_timeline_item.g.dart';

/// `GET /api/timeline/:type/:id` response shape
/// (Dad-backend/src/controllers/timelineController.ts) — a flat, already
/// date-sorted-descending feed merging Interactions, Tasks, CalendarEvents,
/// AuditLogs, standalone CallRecordings, FollowUps, and Documents into one
/// normalized shape. Same contract Dad-frontend's `TimelineFeed.tsx` reads;
/// this is the "Timeline & Files" tab's data source on the Opportunity
/// detail screen. `meta` is left as a raw map rather than modeled per
/// `type` — the seven source entities each populate a different subset of
/// fields there (direction/duration/recordingUrl for calls, fileUrl/
/// fileSize/fileType for documents, priority for tasks/follow-ups,
/// location for events), and nothing here needs more than a handful of
/// keyed lookups, so a full per-type model would be pure ceremony.
@freezed
class OpportunityTimelineItem with _$OpportunityTimelineItem {
  const factory OpportunityTimelineItem({
    required String id,
    required String type,
    String? subType,
    String? title,
    String? description,
    required DateTime date,
    TimelineActor? actor,
    @Default(<String, dynamic>{}) Map<String, dynamic> meta,
  }) = _OpportunityTimelineItem;

  factory OpportunityTimelineItem.fromJson(Map<String, dynamic> json) =>
      _$OpportunityTimelineItemFromJson(json);
}

@freezed
class TimelineActor with _$TimelineActor {
  const factory TimelineActor({
    required String firstName,
    String? lastName,
  }) = _TimelineActor;

  const TimelineActor._();

  factory TimelineActor.fromJson(Map<String, dynamic> json) => _$TimelineActorFromJson(json);

  String get fullName => [firstName, lastName].where((p) => p != null && p.isNotEmpty).join(' ');
}
