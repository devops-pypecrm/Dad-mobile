import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

/// Subset of the Prisma `Branch` model needed for the dashboard filter
/// dropdown — mirrors the `Branch` interface in
/// Dad-frontend/src/pages/Dashboard.tsx:42-46 (id/name only; extra fields
/// like location/manager/_count are ignored on parse). Populated from
/// either `GET /api/branches` or `GET /api/users/my-team`'s
/// `managedBranches`, same as the web app.
@freezed
class Branch with _$Branch {
  const factory Branch({
    required String id,
    required String name,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}
