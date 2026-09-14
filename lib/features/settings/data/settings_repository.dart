import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/user_profile.dart';

part 'settings_repository.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(ProviderRef<SettingsRepository> ref) =>
    SettingsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/profile` routes
/// (Dad-backend/src/controllers/profileController.ts).
class SettingsRepository {
  SettingsRepository(this._dio);

  final Dio _dio;

  /// `POST /api/profile/change-password`. On success, the backend bumps
  /// `User.tokenVersion`, which immediately invalidates every JWT already
  /// issued for this account — including the one this very request just
  /// used to authenticate. Callers MUST log the user out right after a
  /// successful response (see `SecurityScreen`'s `ChangePasswordScreen`) —
  /// any further request on this session's old token will 401.
  ///
  /// Throws [ApiException] on failure — [ApiException.message] is always a
  /// human-readable summary ("Current password is incorrect", "Password
  /// does not meet security requirements"); when the backend's
  /// `PasswordValidator` rejects [newPassword], [ApiException.errors] also
  /// carries the specific per-rule failures (e.g. "must contain a number")
  /// to render as a bullet list instead of just the generic summary.
  Future<void> changePassword({required String currentPassword, required String newPassword}) async {
    try {
      await _dio.post<Map<String, dynamic>>(
        '/profile/change-password',
        data: {'currentPassword': currentPassword, 'newPassword': newPassword},
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/profile` — the full current-user row (minus password).
  Future<UserProfile> getProfile() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/profile');
      return UserProfile.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/profile` — `profileController.ts`'s `updateProfile` merges
  /// whatever keys are present in [data] straight into the `User` row
  /// (`password`/`email` are the only ones it strips server-side), so
  /// callers pass only the fields they're actually changing rather than
  /// the whole profile.
  Future<UserProfile> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>('/profile', data: data);
      return UserProfile.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Returns the `url` field from the upload response, suitable to pass
  /// straight through as `profileImage` in [updateProfile] — same endpoint
  /// and shape `CheckInsRepository.uploadPhoto` already uses.
  Future<String> uploadPhoto(File file) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path, filename: file.uri.pathSegments.last),
      });
      final response = await _dio.post<Map<String, dynamic>>('/upload/image', data: formData);
      return response.data!['url'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
