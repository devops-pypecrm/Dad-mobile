import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';
part 'app_notification.g.dart';

/// Mirrors Prisma's `Notification` model (Dad-backend/prisma/schema.prisma:224-243)
/// exactly as returned by `GET /api/notifications`. Named `AppNotification`,
/// not `Notification`, to avoid clashing with Flutter's own `Notification`
/// widget class.
///
/// `relatedResource`/`relatedId` exist on the model but nothing in the
/// backend currently populates them (`NotificationService.send()` never
/// sets them) — kept here for forward-compatibility, not used for
/// deep-linking today (the web app doesn't do this either, see
/// Dad-frontend/src/components/shared/NotificationPopover.tsx).
@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String title,
    required String message,
    @Default('info') String type,
    String? relatedResource,
    String? relatedId,
    @Default(false) bool isRead,
    required String recipientId,
    String? organisationId,
    required DateTime createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);
}
