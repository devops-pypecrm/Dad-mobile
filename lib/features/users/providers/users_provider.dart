import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/role_utils.dart';
import '../data/users_repository.dart';
import '../domain/hierarchy_user.dart';

part 'users_provider.g.dart';

/// All active org users. `keepAlive` — this list changes rarely within a
/// session and is reused by both the Leads Owner filter (full list, same
/// as web) and [assignableUsers] (subordinate-filtered).
@Riverpod(keepAlive: true)
Future<List<HierarchyUser>> hierarchyUsers(FutureProviderRef<List<HierarchyUser>> ref) {
  return ref.watch(usersRepositoryProvider).getHierarchyUsers();
}

/// Users a given caller is allowed to assign a lead to: everyone, if the
/// caller is admin/super_admin; otherwise the caller themself plus every
/// descendant in the `reportsToId` tree — same BFS `AssignLeadDialog.tsx`
/// runs client-side (`assignableUsers` in that file).
List<HierarchyUser> assignableUsers({
  required List<HierarchyUser> allUsers,
  required String currentUserId,
  required String? currentUserRole,
}) {
  if (isAdminRole(currentUserRole)) return allUsers;

  final childrenOf = <String, List<String>>{};
  for (final user in allUsers) {
    final parentId = user.reportsToId;
    if (parentId != null) {
      (childrenOf[parentId] ??= []).add(user.id);
    }
  }

  final subordinateIds = <String>{};
  final queue = [currentUserId];
  while (queue.isNotEmpty) {
    final id = queue.removeAt(0);
    subordinateIds.add(id);
    queue.addAll(childrenOf[id] ?? const []);
  }

  return allUsers.where((u) => subordinateIds.contains(u.id)).toList();
}
