import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preferences.freezed.dart';
part 'notification_preferences.g.dart';

/// `User.notificationPreferences` (a `Json?` column on the backend) — a
/// field that already existed in the schema and was already READ by
/// `Dad-backend/src/services/notificationService.ts` (gating push/email/
/// WhatsApp sends) but had no UI anywhere, web included, to actually set
/// it; every user was silently running on the defaults below. This screen
/// is the first place that writes it.
///
/// Absence of a key means the default, matching `notificationService.ts`
/// exactly: push/email are opt-OUT (`!== false` — on unless explicitly
/// disabled), WhatsApp is opt-IN (`=== true` — off unless explicitly
/// enabled).
@freezed
class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @Default(true) bool pushNotifications,
    @Default(true) bool emailNotifications,
    @Default(false) bool whatsAppNotifications,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);
}
