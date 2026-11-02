import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/whatsapp_template.dart';

part 'whatsapp_templates_repository.g.dart';

@Riverpod(keepAlive: true)
WhatsAppTemplatesRepository whatsAppTemplatesRepository(ProviderRef<WhatsAppTemplatesRepository> ref) =>
    WhatsAppTemplatesRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/whatsapp-templates` routes
/// (Dad-backend/src/controllers/whatsappPersonalTemplateController.ts).
/// The backend scopes every one of these by the caller's own user id —
/// there is no way to list/edit/delete anyone else's templates through
/// this API, by design.
class WhatsAppTemplatesRepository {
  WhatsAppTemplatesRepository(this._dio);

  final Dio _dio;

  Future<List<WhatsAppTemplate>> getTemplates() async {
    try {
      final response = await _dio.get<List<dynamic>>('/whatsapp-templates');
      return (response.data ?? [])
          .map((json) => WhatsAppTemplate.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<WhatsAppTemplate> createTemplate({required String title, required String body}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/whatsapp-templates',
        data: {'title': title, 'body': body},
      );
      return WhatsAppTemplate.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<WhatsAppTemplate> updateTemplate({
    required String id,
    required String title,
    required String body,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/whatsapp-templates/$id',
        data: {'title': title, 'body': body},
      );
      return WhatsAppTemplate.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> deleteTemplate(String id) async {
    try {
      await _dio.delete('/whatsapp-templates/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
