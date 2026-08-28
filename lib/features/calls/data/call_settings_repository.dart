import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/call_settings.dart';

part 'call_settings_repository.g.dart';

@Riverpod(keepAlive: true)
CallSettingsRepository callSettingsRepository(ProviderRef<CallSettingsRepository> ref) =>
    CallSettingsRepository(ref.watch(dioProvider));

/// `GET`/`PUT /api/call-settings` (Dad-backend/src/controllers/callSettingsController.ts,
/// `protect`-only — no extra admin gate server-side, but the mobile UI only
/// surfaces this to admin/org_admin roles, same as the web app hiding the
/// "Recording Settings" link for non-admins).
class CallSettingsRepository {
  CallSettingsRepository(this._dio);

  final Dio _dio;

  Future<CallSettings> getSettings() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/call-settings');
      return CallSettings.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<CallSettings> updateSettings(CallSettings settings) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>('/call-settings', data: settings.toJson());
      return CallSettings.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
