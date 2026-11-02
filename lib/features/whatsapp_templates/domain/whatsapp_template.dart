import 'package:freezed_annotation/freezed_annotation.dart';

part 'whatsapp_template.freezed.dart';
part 'whatsapp_template.g.dart';

/// Mirrors `GET /api/whatsapp-templates`'s row shape
/// (Dad-backend/src/controllers/whatsappPersonalTemplateController.ts) —
/// a private, per-user WhatsApp message template for the "send via
/// WhatsApp" quick action's template picker. Not related to
/// `WhatsAppTemplate` (the org-wide, Meta-approved Cloud API template
/// model) — this one never touches Meta at all, it's just prefilled text
/// for a `wa.me` deep link into the user's own WhatsApp app.
@freezed
class WhatsAppTemplate with _$WhatsAppTemplate {
  const factory WhatsAppTemplate({
    required String id,
    required String title,
    required String body,
    required DateTime createdAt,
  }) = _WhatsAppTemplate;

  factory WhatsAppTemplate.fromJson(Map<String, dynamic> json) => _$WhatsAppTemplateFromJson(json);
}
