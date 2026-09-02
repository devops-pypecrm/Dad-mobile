import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_whatsapp_activity.freezed.dart';
part 'lead_whatsapp_activity.g.dart';

/// One row from `GET /api/whatsapp/lead/:leadId`
/// (Dad-backend/src/controllers/whatsAppController.ts
/// `getLeadWhatsAppMessages`) — a merged feed of real `WhatsAppMessage` rows
/// and `type: 'whatsapp'` `Interaction` rows for this lead's phone numbers.
/// The backend does NOT split this into messages vs. calls; both the
/// WhatsApp Messages and WhatsApp Calls tabs fetch this exact same list and
/// filter it client-side with [isWhatsAppCall], matching
/// `Dad-frontend/src/pages/leads/[id].tsx`'s own `isWhatsAppCall` classifier
/// exactly (see that function for the substring rules this mirrors).
@freezed
class LeadWhatsAppActivity with _$LeadWhatsAppActivity {
  const factory LeadWhatsAppActivity({
    required String id,
    required String source,
    String? direction,
    String? messageType,
    String? content,
    String? status,
    String? phoneNumber,
    required DateTime date,
    String? actor,
    String? subject,
    String? description,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? callStatus,
    String? recordingUrl,
  }) = _LeadWhatsAppActivity;

  factory LeadWhatsAppActivity.fromJson(Map<String, dynamic> json) =>
      _$LeadWhatsAppActivityFromJson(json);
}

/// Same classifier as web's `isWhatsAppCall` (`pages/leads/[id].tsx`): an
/// item is treated as a call if its `subject` mentions "call", or its
/// `description`/`content` mentions a voice/video call phrase — case
/// insensitive substring match, not a dedicated `type` field (the backend
/// doesn't pre-split these into two kinds).
bool isWhatsAppCall(LeadWhatsAppActivity item) {
  final subject = (item.subject ?? '').toLowerCase();
  if (subject.contains('call')) return true;

  final text = '${item.description ?? ''} ${item.content ?? ''}'.toLowerCase();
  return text.contains('voice call') ||
      text.contains('video call') ||
      text.contains('call not connected') ||
      text.contains('initiated whatsapp call');
}
