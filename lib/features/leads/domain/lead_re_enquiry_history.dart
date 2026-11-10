import 'package:freezed_annotation/freezed_annotation.dart';

import 'lead_assignee.dart';

part 'lead_re_enquiry_history.freezed.dart';
part 'lead_re_enquiry_history.g.dart';

/// A `FollowUp` row merged into the same timeline as re-enquiry events —
/// only present on `type: 'follow_up'` events.
@freezed
class ReEnquiryFollowUpRef with _$ReEnquiryFollowUpRef {
  const factory ReEnquiryFollowUpRef({
    required String id,
    String? subject,
    String? description,
    String? status,
    String? priority,
    LeadAssignee? assignedTo,
  }) = _ReEnquiryFollowUpRef;

  factory ReEnquiryFollowUpRef.fromJson(Map<String, dynamic> json) =>
      _$ReEnquiryFollowUpRefFromJson(json);
}

/// One row from `GET /api/leads/:id/re-enquiry-history`
/// (Dad-backend/src/controllers/leadController.ts `getReEnquiryHistory`) —
/// a single time this lead's phone number enquired again, most-recent
/// first. Unlike the Lead record itself (which only shows the current
/// merged name/count), this is the full per-event trail.
///
/// [name] is recovered either from a full snapshot captured at the time
/// (for events since this feature shipped) or parsed out of the older
/// activity log text for events before that — [hasFullSnapshot] tells you
/// which, since only a full snapshot carries [phone]/[email] and can be
/// split into a genuinely separate lead with real contact details.
@freezed
class LeadReEnquiryEvent with _$LeadReEnquiryEvent {
  const factory LeadReEnquiryEvent({
    // Null for `type: 'follow_up'` events — only re_enquiry events index
    // into `sourceDetails.reEnquiries[]`/the interaction array, which is
    // what `splitReEnquiryIntoLead`'s `eventIndex` param refers to.
    int? eventIndex,
    required DateTime date,
    // 're_enquiry' | 'follow_up'. Defaults to 're_enquiry' so events from
    // before this discriminator existed still parse as the only type they
    // could have been.
    @Default('re_enquiry') String type,
    String? name,
    String? phone,
    String? email,
    String? source,
    // "Course interested in" at the time of this specific re-enquiry — only
    // present on `type: 're_enquiry'` events recorded after this field was
    // added; older events have no value to show, not a bug.
    String? enquiryAbout,
    @Default(false) bool hasFullSnapshot,
    String? alreadySplitLeadId,
    // Only present on `type: 'follow_up'` events.
    ReEnquiryFollowUpRef? followUp,
  }) = _LeadReEnquiryEvent;

  factory LeadReEnquiryEvent.fromJson(Map<String, dynamic> json) =>
      _$LeadReEnquiryEventFromJson(json);
}

@freezed
class LeadReEnquiryHistory with _$LeadReEnquiryHistory {
  const factory LeadReEnquiryHistory({
    required String leadId,
    required String currentName,
    required String currentPhone,
    String? currentEmail,
    @Default(0) int reEnquiryCount,
    @Default([]) List<LeadReEnquiryEvent> events,
  }) = _LeadReEnquiryHistory;

  factory LeadReEnquiryHistory.fromJson(Map<String, dynamic> json) =>
      _$LeadReEnquiryHistoryFromJson(json);
}
