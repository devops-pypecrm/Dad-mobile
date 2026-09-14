import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/checkin.dart';
import '../domain/pending_checkin.dart';

part 'checkins_repository.g.dart';

@Riverpod(keepAlive: true)
CheckInsRepository checkInsRepository(ProviderRef<CheckInsRepository> ref) =>
    CheckInsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/checkins` (create/list) and
/// `/api/upload/image` (photo upload) routes
/// (Dad-backend/src/controllers/checkInController.ts,
/// Dad-backend/src/controllers/uploadController.ts). Check-in creation
/// itself never accepts a raw file — a photo must be uploaded first to get
/// a `photoUrl` string.
class CheckInsRepository {
  CheckInsRepository(this._dio);

  final Dio _dio;

  /// Returns the `url` field from the upload response (already prefixed
  /// with `/api/...` — see `AppConfig.apiOrigin` for how to resolve it for
  /// display), suitable to pass straight through as `photoUrl`.
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

  Future<CheckIn> createCheckIn(PendingCheckIn draft) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/checkins',
        data: {
          'type': draft.type,
          if (draft.notes != null && draft.notes!.isNotEmpty) 'notes': draft.notes,
          if (draft.leadId != null) 'leadId': draft.leadId,
          if (draft.contactId != null) 'contactId': draft.contactId,
          if (draft.accountId != null) 'accountId': draft.accountId,
          if (draft.latitude != null) 'latitude': draft.latitude,
          if (draft.longitude != null) 'longitude': draft.longitude,
          if (draft.address != null) 'address': draft.address,
          if (draft.photoUrl != null) 'photoUrl': draft.photoUrl,
        },
      );
      return CheckIn.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `date` as `yyyy-MM-dd`. Response is a raw JSON array, not `{ data: [] }`.
  /// `offset`/`sortBy`/`sortOrder`/`branchId` mirror the same query params
  /// Dad-frontend's Field Force page and its report use (`getCheckIns` in
  /// `checkInService.ts`) — the backend already supports all of them
  /// (`checkInController.ts`'s `getCheckIns`), the mobile client just
  /// wasn't passing them through yet.
  Future<List<CheckIn>> getCheckIns({
    String? date,
    int limit = 50,
    int offset = 0,
    String? sortBy,
    String? sortOrder,
    String? branchId,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/checkins',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          if (date != null) 'date': date,
          if (sortBy != null) 'sortBy': sortBy,
          if (sortOrder != null) 'sortOrder': sortOrder,
          if (branchId != null) 'branchId': branchId,
        },
      );
      return response.data!.map((e) => CheckIn.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
