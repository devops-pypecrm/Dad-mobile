import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/notifications_page.dart';

part 'notifications_repository.g.dart';

@Riverpod(keepAlive: true)
NotificationsRepository notificationsRepository(ProviderRef<NotificationsRepository> ref) =>
    NotificationsRepository(ref.watch(dioProvider));

/// Talks to `/api/notifications/*`
/// (Dad-backend/src/controllers/notificationController.ts) — the same
/// in-app notification system Dad-frontend's NotificationPopover and
/// `/notifications` page use, plus the pre-existing device-token
/// registration for FCM push.
class NotificationsRepository {
  NotificationsRepository(this._dio);

  final Dio _dio;

  Future<void> registerDeviceToken(String fcmToken) async {
    try {
      await _dio.post<void>('/users/device-token', data: {'fcmToken': fcmToken});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/notifications`. [type] `null`/`'all'` means no type filter,
  /// matching the web app's dropdown; [isRead] `null` means "both".
  Future<NotificationsPage> getNotifications({
    int page = 1,
    int limit = 20,
    String? type,
    bool? isRead,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/notifications',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (type != null && type != 'all') 'type': type,
          if (isRead != null) 'isRead': isRead.toString(),
        },
      );
      return NotificationsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/notifications/:id/read`.
  Future<void> markAsRead(String id) async {
    try {
      await _dio.put<void>('/notifications/$id/read');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/notifications/read-all`.
  Future<void> markAllAsRead() async {
    try {
      await _dio.put<void>('/notifications/read-all');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
