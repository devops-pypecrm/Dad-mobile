import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/role_utils.dart';
import '../data/users_repository.dart';
import '../domain/hierarchy_user.dart';

part 'users_provider.g.dart';

/// Every active org user, completely unscoped — the raw input
/// [assignableUsers] narrows down for the Assign-lead picker. Do NOT use
/// this for the Leads Owner filter (see [scopedUsersProvider]) — despite
/// the similar name this is a different list with different visibility
/// rules, not a "full" version of the same data.
@Riverpod(keepAlive: true)
Future<List<HierarchyUser>> hierarchyUsers(
  FutureProviderRef<List<HierarchyUser>> ref,
) {
  return ref.watch(usersRepositoryProvider).getHierarchyUsers();
}

/// Users already scoped server-side to what the caller is allowed to see
/// (self + subordinates + managed team/branch members, or everyone for
/// admin/super_admin — see `getVisibleUserIds` on the backend). This is
/// what the Leads list's Owner filter should read, matching
/// Dad-frontend's `pages/leads/index.tsx` Owner filter (`getUsers()`), not
/// [hierarchyUsersProvider]'s unrestricted list.
@Riverpod(keepAlive: true)
Future<List<HierarchyUser>> scopedUsers(
  FutureProviderRef<List<HierarchyUser>> ref,
) {
  return ref.watch(usersRepositoryProvider).getScopedUsers();
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
