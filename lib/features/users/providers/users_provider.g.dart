// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hierarchyUsersHash() => r'b2a4f839aeecc2061173d11c94a83cec79d44aa0';

/// Every active org user, completely unscoped — the raw input
/// [assignableUsers] narrows down for the Assign-lead picker. Do NOT use
/// this for the Leads Owner filter (see [scopedUsersProvider]) — despite
/// the similar name this is a different list with different visibility
/// rules, not a "full" version of the same data.
///
/// Copied from [hierarchyUsers].
@ProviderFor(hierarchyUsers)
final hierarchyUsersProvider = FutureProvider<List<HierarchyUser>>.internal(
  hierarchyUsers,
  name: r'hierarchyUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hierarchyUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HierarchyUsersRef = FutureProviderRef<List<HierarchyUser>>;
String _$scopedUsersHash() => r'864384ae6d0254a9ded5294d8d869fe72bb371ab';

/// Users already scoped server-side to what the caller is allowed to see
/// (self + subordinates + managed team/branch members, or everyone for
/// admin/super_admin — see `getVisibleUserIds` on the backend). This is
/// what the Leads list's Owner filter should read, matching
/// Dad-frontend's `pages/leads/index.tsx` Owner filter (`getUsers()`), not
/// [hierarchyUsersProvider]'s unrestricted list.
///
/// Copied from [scopedUsers].
@ProviderFor(scopedUsers)
final scopedUsersProvider = FutureProvider<List<HierarchyUser>>.internal(
  scopedUsers,
  name: r'scopedUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scopedUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ScopedUsersRef = FutureProviderRef<List<HierarchyUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
