import 'package:freezed_annotation/freezed_annotation.dart';

part 'followup_assignee.freezed.dart';
part 'followup_assignee.g.dart';

/// The `assignedTo` relation on a FollowUp — `{ firstName, lastName, email }`
/// only, no `id` (Dad-backend/src/controllers/followUpController.ts:114
/// `select: { firstName: true, lastName: true, email: true }`).
@freezed
class FollowUpAssignee with _$FollowUpAssignee {
  const FollowUpAssignee._();

  const factory FollowUpAssignee({
    required String firstName,
    String? lastName,
    String? email,
  }) = _FollowUpAssignee;

  factory FollowUpAssignee.fromJson(Map<String, dynamic> json) => _$FollowUpAssigneeFromJson(json);

  String get fullName => [firstName, lastName].where((p) => p != null && p.trim().isNotEmpty).join(' ');
}
