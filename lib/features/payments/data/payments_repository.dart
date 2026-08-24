import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/emi_schedule_summary.dart';

part 'payments_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentsRepository paymentsRepository(ProviderRef<PaymentsRepository> ref) =>
    PaymentsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's EMI routes, mounted flat under `/api` (not
/// `/api/emi/...` as an early doc claimed — verified against
/// Dad-backend/src/routes/emiRoutes.ts). Read-only for Phase 4: no payment
/// recording or installment generation from mobile yet.
class PaymentsRepository {
  PaymentsRepository(this._dio);

  final Dio _dio;

  /// `status`: active | completed | defaulted (matches `EMIStatus` enum).
  Future<List<EmiScheduleSummary>> getSchedules({String? status}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/emi-schedules',
        queryParameters: {if (status != null) 'status': status},
      );
      final list = (response.data!['schedules'] as List).cast<Map<String, dynamic>>();
      return list.map(EmiScheduleSummary.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
