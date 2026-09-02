import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_call_history_item.freezed.dart';
part 'lead_call_history_item.g.dart';

/// One row from `GET /api/calls/lead/:leadId`
/// (Dad-backend/src/controllers/callController.ts `getLeadCalls`) — raw
/// `Interaction` rows where `type: 'call'` for this lead, most-recent
/// first. Unlike the Timeline/WhatsApp endpoints this isn't normalized
/// server-side, hence the field names matching `Interaction` directly.
@freezed
class LeadCallHistoryItem with _$LeadCallHistoryItem {
  const factory LeadCallHistoryItem({
    required String id,
    String? direction,
    required String subject,
    String? description,
    required DateTime date,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? callStatus,
    String? recordingUrl,
  }) = _LeadCallHistoryItem;

  factory LeadCallHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$LeadCallHistoryItemFromJson(json);
}
