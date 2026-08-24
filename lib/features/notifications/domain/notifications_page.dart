import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_notification.dart';

part 'notifications_page.freezed.dart';
part 'notifications_page.g.dart';

/// `GET /api/notifications` response shape
/// (Dad-backend/src/controllers/notificationController.ts:43-49).
/// `unreadCount` is the recipient's global unread count — a separate,
/// unfiltered query server-side — not derived from `notifications.length`,
/// so it stays correct even when a `type`/`isRead` filter narrows the list.
@freezed
class NotificationsPage with _$NotificationsPage {
  const factory NotificationsPage({
    @Default([]) List<AppNotification> notifications,
    @Default(0) int unreadCount,
    @Default(0) int total,
    @Default(1) int totalPages,
    @Default(1) int currentPage,
  }) = _NotificationsPage;

  factory NotificationsPage.fromJson(Map<String, dynamic> json) => _$NotificationsPageFromJson(json);
}
