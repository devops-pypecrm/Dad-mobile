import 'package:freezed_annotation/freezed_annotation.dart';

part 'hierarchy_user.freezed.dart';
part 'hierarchy_user.g.dart';

/// One entry from `GET /api/hierarchy`'s flat `users` array
/// (Dad-backend/src/controllers/hierarchyController.ts:20-36) — every
/// active user in the org, each carrying `reportsToId` so the client can
/// walk the reporting tree (same shape `AssignLeadDialog.tsx` and the web
/// Leads list's Owner filter both consume).
@freezed
class HierarchyUser with _$HierarchyUser {
  const HierarchyUser._();

  const factory HierarchyUser({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? role,
    String? reportsToId,
  }) = _HierarchyUser;

  factory HierarchyUser.fromJson(Map<String, dynamic> json) => _$HierarchyUserFromJson(json);

  String get fullName => '$firstName $lastName'.trim();
}
