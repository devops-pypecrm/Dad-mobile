import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/app_release.dart';

part 'app_release_repository.g.dart';

@Riverpod(keepAlive: true)
AppReleaseRepository appReleaseRepository(ProviderRef<AppReleaseRepository> ref) =>
    AppReleaseRepository(ref.watch(dioProvider));

/// Talks to `/api/app-releases/*`
/// (Dad-backend/src/controllers/appReleaseController.ts) — the version
/// manifest the mobile app checks on launch, and that the public
/// pypecrm.com/download page also reads.
class AppReleaseRepository {
  AppReleaseRepository(this._dio);

  final Dio _dio;

  /// Returns `null` (not a throw) when no release has been published yet
  /// for this platform (404). Other failures still throw [ApiException] —
  /// callers that don't want a failed update check to disrupt anything
  /// (see [latestMobileReleaseProvider]) catch that themselves.
  Future<AppRelease?> getLatestRelease({String platform = 'mobile'}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/app-releases/latest',
        queryParameters: {'platform': platform},
      );
      return AppRelease.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw ApiException.fromDioException(e);
    }
  }

  /// Streams the current .apk straight to [savePath], reporting progress —
  /// used for the in-app download+install flow (see `ApkDownloadController`)
  /// instead of bouncing out to the browser/download page.
  Future<void> downloadApk({
    required String platform,
    required String savePath,
    required void Function(int received, int total) onProgress,
  }) async {
    try {
      await _dio.download(
        '/app-releases/download/$platform',
        savePath,
        onReceiveProgress: onProgress,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
