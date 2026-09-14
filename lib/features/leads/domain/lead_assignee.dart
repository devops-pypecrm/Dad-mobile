import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_assignee.freezed.dart';
part 'lead_assignee.g.dart';

/// The `assignedTo` relation on a Lead. Note the backend is inconsistent:
/// the list endpoint (`GET /api/leads`) includes `id`, the detail endpoint
/// (`GET /api/leads/:id`) does not — hence `id` is nullable here.
///
/// `firstName`/`lastName`/`email` are non-nullable columns on the backend's
/// `User` model, but are defaulted to `''` rather than `required` here —
/// a crash-hardening measure, not a sign any of these are expected to be
/// missing: a forced-cast crash (`type 'Null' is not a subtype of type
/// 'String'`) taking down the whole Leads screen over a cosmetic display
/// field is a worse failure mode than rendering a blank name, and this
/// guards against any endpoint/shape drift we haven't caught yet.
@freezed
class LeadAssignee with _$LeadAssignee {
  const factory LeadAssignee({
    String? id,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
  }) = _LeadAssignee;

  factory LeadAssignee.fromJson(Map<String, dynamic> json) =>
      _$LeadAssigneeFromJson(json);
}
