import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../../../core/utils/device_identity.dart';
import '../domain/user_device_session.dart';
import '../domain/user_session.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(ProviderRef<AuthRepository> ref) =>
    AuthRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/auth` routes
/// (see app-pre/authentication/AUTHENTICATION_FLOW.MD). No business logic
/// lives here — round-robin assignment, target math, etc. all stay backend-side.
class AuthRepository {
  AuthRepository(this._dio);

  final Dio _dio;

  /// `email` also accepts the backend's `userId` login field — the API
  /// matches either (Dad-backend/src/controllers/authController.ts).
  ///
  /// Also sends this device's platform/model/app-version so the backend
  /// creates a `UserSession` row for it (see `sessionService.ts`) — this is
  /// what the Settings > Devices screen lists and lets the user remotely
  /// sign out of.
  Future<UserSession> login({required String email, required String password}) async {
    try {
      final device = await DeviceIdentity.current();
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
          'platform': device.platform,
          if (device.deviceName != null) 'deviceName': device.deviceName,
          if (device.appVersion != null) 'appVersion': device.appVersion,
        },
      );
      return UserSession.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Restores the session on app launch using the stored token.
  Future<UserSession> fetchCurrentUser() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/auth/me');
      return UserSession.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/auth/sessions` — every device this account is logged into.
  Future<List<UserDeviceSession>> getSessions() async {
    try {
      final response = await _dio.get<List<dynamic>>('/auth/sessions');
      return response.data!.map((e) => UserDeviceSession.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `DELETE /api/auth/sessions/:id` — remotely signs out one device.
  /// Returns `true` if the revoked session was THIS device's own — callers
  /// must log out locally right away in that case rather than waiting for
  /// the next request to naturally 401.
  Future<bool> revokeSession(String sessionId) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>('/auth/sessions/$sessionId');
      return response.data?['wasCurrentDevice'] == true;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
