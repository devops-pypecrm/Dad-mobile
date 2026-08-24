import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
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
  Future<UserSession> login({required String email, required String password}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {'email': email, 'password': password},
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
}
