import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_assignee.freezed.dart';
part 'lead_assignee.g.dart';

/// The `assignedTo` relation on a Lead. Note the backend is inconsistent:
/// the list endpoint (`GET /api/leads`) includes `id`, the detail endpoint
/// (`GET /api/leads/:id`) does not — hence `id` is nullable here.
@freezed
class LeadAssignee with _$LeadAssignee {
  const factory LeadAssignee({
    String? id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _LeadAssignee;

  factory LeadAssignee.fromJson(Map<String, dynamic> json) =>
      _$LeadAssigneeFromJson(json);
}
