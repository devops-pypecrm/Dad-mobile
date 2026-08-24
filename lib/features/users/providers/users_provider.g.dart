// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hierarchyUsersHash() => r'b2a4f839aeecc2061173d11c94a83cec79d44aa0';

/// All active org users. `keepAlive` — this list changes rarely within a
/// session and is reused by both the Leads Owner filter (full list, same
/// as web) and [assignableUsers] (subordinate-filtered).
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
