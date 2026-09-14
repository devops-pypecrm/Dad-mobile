import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/config/app_config.dart';
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

  /// Called on manual logout so this device stops receiving push for the
  /// account that just signed out — otherwise it stays registered
  /// server-side until whoever logs in next on this device re-registers
  /// the same physical token (which does clean up the old association, but
  /// only at that point, not immediately on logout). Not called from
  /// `forceLogout()` (401-triggered): the JWT is already considered invalid
  /// there, so an authenticated call here would just 401 again — pointless.
  Future<void> clearDeviceToken() async {
    try {
      await _dio.post<void>('/users/device-token/clear');
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

  /// Unread count for a SAVED (not necessarily the currently-active)
  /// account, keyed off that account's own token rather than this app's
  /// single shared session — used for the account switcher's per-account
  /// badge. Deliberately does NOT use the shared `dioProvider` instance:
  /// its auth interceptor always reads the ACTIVE account's token from
  /// storage and would silently overwrite an explicit header here, and
  /// worse, would force-logout the *active* session on a 401 that has
  /// nothing to do with it if this saved account's token has expired. Uses
  /// its own throwaway `Dio` instance instead, and never throws — a badge
  /// count is best-effort, not something that should ever visibly break
  /// the switcher screen (a saved account with a stale token just shows no
  /// badge rather than an error).
  static Future<int> unreadCountForAccount(String token) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.instance.apiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final response = await dio.get<Map<String, dynamic>>(
        '/notifications',
        queryParameters: {'page': 1, 'limit': 1},
      );
      return NotificationsPage.fromJson(response.data!).unreadCount;
    } catch (_) {
      return 0;
    }
  }
}
