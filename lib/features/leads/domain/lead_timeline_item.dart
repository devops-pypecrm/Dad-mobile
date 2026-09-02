import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_timeline_item.freezed.dart';
part 'lead_timeline_item.g.dart';

/// One row from `GET /api/timeline/lead/:id`
/// (Dad-backend/src/controllers/timelineController.ts `getTimeline`) — a
/// merged, server-sorted (date desc) feed of Interaction/Task/CalendarEvent/
/// AuditLog/CallRecording/FollowUp/Document activity for this lead.
/// `type: 'interaction', subType: 'whatsapp'` rows are deliberately excluded
/// client-side (see [LeadTimelineList]) since WhatsApp activity has its own
/// dedicated tabs, matching `TimelineFeed.tsx`'s own filter.
@freezed
class LeadTimelineItem with _$LeadTimelineItem {
  const factory LeadTimelineItem({
    required String id,
    required String type,
    required String subType,
    required String title,
    String? description,
    required DateTime date,
    LeadTimelineActor? actor,
    LeadTimelineMeta? meta,
  }) = _LeadTimelineItem;

  factory LeadTimelineItem.fromJson(Map<String, dynamic> json) =>
      _$LeadTimelineItemFromJson(json);
}

@freezed
class LeadTimelineActor with _$LeadTimelineActor {
  const factory LeadTimelineActor({
    required String firstName,
    String? lastName,
  }) = _LeadTimelineActor;

  factory LeadTimelineActor.fromJson(Map<String, dynamic> json) =>
      _$LeadTimelineActorFromJson(json);
}

@freezed
class LeadTimelineMeta with _$LeadTimelineMeta {
  const factory LeadTimelineMeta({
    String? direction,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? recordingUrl,
    String? priority,
    String? location,
    String? fileUrl,
    String? fileType,
    double? fileSize,
    String? callType,
  }) = _LeadTimelineMeta;

  factory LeadTimelineMeta.fromJson(Map<String, dynamic> json) =>
      _$LeadTimelineMetaFromJson(json);
}
