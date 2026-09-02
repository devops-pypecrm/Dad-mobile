import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_ownership_history_item.freezed.dart';
part 'lead_ownership_history_item.g.dart';

/// One row from `GET /api/leads/:id/history`
/// (Dad-backend/src/controllers/leadController.ts `getLeadHistory`) — a
/// `LeadHistory` row, most-recent first. Despite the "Ownership History" tab
/// label, this covers any tracked field change (not just owner
/// reassignment) — `oldOwner`/`newOwner` are only populated when the change
/// was actually an assignment change.
@freezed
class LeadOwnershipHistoryItem with _$LeadOwnershipHistoryItem {
  const factory LeadOwnershipHistoryItem({
    required String id,
    LeadHistoryUser? oldOwner,
    LeadHistoryUser? newOwner,
    LeadHistoryUser? changedBy,
    String? reason,
    required DateTime createdAt,
  }) = _LeadOwnershipHistoryItem;

  factory LeadOwnershipHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$LeadOwnershipHistoryItemFromJson(json);
}

@freezed
class LeadHistoryUser with _$LeadHistoryUser {
  const factory LeadHistoryUser({required String firstName, String? lastName}) =
      _LeadHistoryUser;

  factory LeadHistoryUser.fromJson(Map<String, dynamic> json) =>
      _$LeadHistoryUserFromJson(json);
}
