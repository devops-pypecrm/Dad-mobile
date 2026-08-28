import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_settings.freezed.dart';
part 'call_settings.g.dart';

/// `GET`/`PUT /api/call-settings` — the org-wide `CallSettings` row
/// (Dad-backend/prisma/schema.prisma `CallSettings` model,
/// `Dad-backend/src/controllers/callSettingsController.ts`). Same fields
/// Dad-frontend's `/settings/call-recording` page configures; this is the
/// admin-only mobile equivalent of that page (Phase 5 follow-up —
/// `autoRecordInbound`/`autoRecordOutbound` default `false` for new orgs
/// for consent-law reasons, a legal call for org admins, not this app).
@freezed
class CallSettings with _$CallSettings {
  const factory CallSettings({
    @Default(false) bool autoRecordOutbound,
    @Default(false) bool autoRecordInbound,
    @Default('high') String recordingQuality,
    @Default('local') String storageType,
    @Default(90) int retentionDays,
    @Default(false) bool autoDeleteEnabled,
    @Default(true) bool popupOnIncoming,
    @Default(true) bool autoFollowupReminder,
    @Default(30) int followupDelayMinutes,
    @Default(true) bool syncNonCrmContacts,
  }) = _CallSettings;

  factory CallSettings.fromJson(Map<String, dynamic> json) => _$CallSettingsFromJson(json);
}
