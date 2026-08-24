import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/account.dart';
import '../domain/accounts_page.dart';

part 'accounts_repository.g.dart';

@Riverpod(keepAlive: true)
AccountsRepository accountsRepository(ProviderRef<AccountsRepository> ref) =>
    AccountsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/accounts` routes
/// (Dad-backend/src/controllers/accountController.ts). Read-only for
/// Phase 3 — list + detail only.
class AccountsRepository {
  AccountsRepository(this._dio);

  final Dio _dio;

  Future<AccountsPage> getAccounts({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/accounts',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          if (search != null && search.isNotEmpty) 'search': search,
          if (type != null && type.isNotEmpty) 'type': type,
        },
      );
      return AccountsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Account> getAccountById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/accounts/$id');
      return Account.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
