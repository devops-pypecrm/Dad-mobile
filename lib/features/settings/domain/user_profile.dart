import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_preferences.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// The subset of `GET /api/profile`'s response (`profileController.ts`'s
/// `getProfile` — the full `User` row minus `password`) this app actually
/// edits. Deliberately not every field on the row (permissions,
/// integrations, metaAccessToken, etc. are backend/admin-console concerns,
/// not something a mobile Account screen touches) — and deliberately NOT
/// `role` either: `getProfile` sends it as `{ id, name }` ("Transform for
/// frontend") while `updateProfile`'s response sends the same field back
/// as a plain string, so the two endpoints disagree on its shape. Nothing
/// here needs it (`SettingsScreen`'s admin check already reads `role` off
/// `sessionControllerProvider`'s `UserSession`, a different, consistently-
/// shaped model), so it's just left out rather than modeled as `dynamic`.
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    String? position,
    String? profileImage,
    required NotificationPreferences notificationPreferences,
  }) = _UserProfile;

  /// `notificationPreferences` is a nullable `Json?` column on the backend
  /// — absent entirely for any user who's never had it saved before — so
  /// this normalizes a missing/null value to an empty map first, letting
  /// `NotificationPreferences.fromJson`'s own `@Default`s on each key
  /// (pushNotifications/emailNotifications on by default, whatsApp off)
  /// take over from there, matching `notificationService.ts`'s defaults
  /// exactly.
  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson({
        ...json,
        'notificationPreferences': (json['notificationPreferences'] as Map<String, dynamic>?) ?? const {},
      });
}
