import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/hierarchy_user.dart';

part 'users_repository.g.dart';

@Riverpod(keepAlive: true)
UsersRepository usersRepository(ProviderRef<UsersRepository> ref) =>
    UsersRepository(ref.watch(dioProvider));

class UsersRepository {
  UsersRepository(this._dio);

  final Dio _dio;

  /// `GET /api/hierarchy` (Dad-backend/src/controllers/hierarchyController.ts)
  /// — every active user in the org, completely UNSCOPED (no role/hierarchy
  /// filtering server-side). Only correct use is as the raw input to a
  /// client-side hierarchy walk — [assignableUsers] narrows this down to
  /// self+subordinates (or everyone, for admin/super_admin), matching
  /// exactly what Dad-frontend's `AssignLeadDialog.tsx` does with this same
  /// endpoint. Do NOT use this directly for anything that should already
  /// reflect visibility scoping (e.g. the Leads Owner filter) — see
  /// [getScopedUsers] for that.
  Future<List<HierarchyUser>> getHierarchyUsers() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/hierarchy');
      final list = (response.data!['users'] as List)
          .cast<Map<String, dynamic>>();
      return list.map(HierarchyUser.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/users` (Dad-backend/src/controllers/userController.ts) —
  /// unlike [getHierarchyUsers], this is already scoped server-side by
  /// `getVisibleUserIds` for anyone who isn't plain `admin`/`super_admin`:
  /// self + reportsTo-descendants + managed team/branch members. This is
  /// the source Dad-frontend's Leads list Owner filter uses (`getUsers()`
  /// in `pages/leads/index.tsx`) — a different, separately-scoped endpoint
  /// from the one `AssignLeadDialog` uses, not the same list reused twice.
  /// `role` comes back as `{id, name}` here (vs. a plain string from
  /// `/hierarchy`), hence the manual parse below instead of reusing
  /// `HierarchyUser.fromJson`.
  Future<List<HierarchyUser>> getScopedUsers() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/users');
      final list = (response.data!['users'] as List)
          .cast<Map<String, dynamic>>();
      return list.map((json) {
        final roleField = json['role'];
        final roleStr = roleField is Map
            ? (roleField['id'] as String? ?? roleField['name'] as String?)
            : roleField as String?;
        return HierarchyUser(
          id: json['id'] as String,
          firstName: json['firstName'] as String? ?? '',
          lastName: json['lastName'] as String? ?? '',
          email: json['email'] as String?,
          role: roleStr,
          reportsToId: json['reportsToId'] as String?,
        );
      }).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
