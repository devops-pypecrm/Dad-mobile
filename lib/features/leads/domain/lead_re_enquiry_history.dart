import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_re_enquiry_history.freezed.dart';
part 'lead_re_enquiry_history.g.dart';

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
    required int eventIndex,
    required DateTime date,
    String? name,
    String? phone,
    String? email,
    String? source,
    @Default(false) bool hasFullSnapshot,
    String? alreadySplitLeadId,
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
