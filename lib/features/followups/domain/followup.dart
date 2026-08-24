import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dashboard/domain/branch.dart';
import 'followup_assignee.dart';
import 'followup_related_entity.dart';

part 'followup.freezed.dart';
part 'followup.g.dart';

/// Real, backend-bound enum values (unlike `Lead.status`) — see
/// Dad-backend/prisma/schema.prisma `FollowUpStatus`. Kept as free strings
/// here (not a Dart enum) so an unexpected server value never breaks
/// `fromJson`; UI code should switch on these constants.
const kFollowUpNotStarted = 'not_started';
const kFollowUpInProgress = 'in_progress';
const kFollowUpCompleted = 'completed';
const kFollowUpDeferred = 'deferred';

const kFollowUpStatuses = [kFollowUpNotStarted, kFollowUpInProgress, kFollowUpCompleted, kFollowUpDeferred];

/// Mirrors `Dad-backend/prisma/schema.prisma`'s `FollowUp` model plus the
/// server-injected `relatedTo`/`onModel` fields
/// (Dad-backend/src/controllers/followUpController.ts). `branch` reuses the
/// dashboard feature's `Branch` model — same `{id, name}` shape the backend
/// sends for every entity's branch relation, no need for a duplicate type.
@freezed
class FollowUp with _$FollowUp {
  const FollowUp._();

  const factory FollowUp({
    required String id,
    required String subject,
    String? description,
    @Default(kFollowUpNotStarted) String status,
    @Default('medium') String priority,
    required DateTime dueDate,
    FollowUpRelatedEntity? relatedTo,
    String? onModel,
    FollowUpAssignee? assignedTo,
    Branch? branch,
  }) = _FollowUp;

  factory FollowUp.fromJson(Map<String, dynamic> json) => _$FollowUpFromJson(json);

  bool get isCompleted => status == kFollowUpCompleted;

  /// Only Lead-linked follow-ups get the Call/View-Lead actions — matches
  /// `FollowUpMobileCard.tsx`'s `leadId` derivation.
  String? get leadId => onModel == 'Lead' ? relatedTo?.id : null;
}
