import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/hierarchy_user.dart';

part 'users_repository.g.dart';

@Riverpod(keepAlive: true)
UsersRepository usersRepository(ProviderRef<UsersRepository> ref) => UsersRepository(ref.watch(dioProvider));

/// `GET /api/hierarchy` (Dad-backend/src/controllers/hierarchyController.ts)
/// — used by both the Leads list's Owner filter and the Assign-lead picker,
/// same source the web app's `AssignLeadDialog`/Owner filter use.
class UsersRepository {
  UsersRepository(this._dio);

  final Dio _dio;

  Future<List<HierarchyUser>> getHierarchyUsers() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/hierarchy');
      final list = (response.data!['users'] as List).cast<Map<String, dynamic>>();
      return list.map(HierarchyUser.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
