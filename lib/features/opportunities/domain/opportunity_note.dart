import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_note.freezed.dart';
part 'opportunity_note.g.dart';

/// A note row from the generic `GET /api/interactions` feed
/// (Dad-backend/src/controllers/interactionController.ts
/// `getAllInteractions`), filtered client-side to this opportunity's id.
///
/// Unlike leads (`GET /interactions/leads/:leadId/interactions`), there is
/// no dedicated per-opportunity listing endpoint or `?opportunity=` filter
/// param on the backend — the generic endpoint is org/hierarchy-scoped and
/// capped at its `limit` query param (default 50) most-recent-first, so a
/// very active org could theoretically push an opportunity's older notes
/// past that window. Good enough for "recent notes on this opportunity,"
/// not a guaranteed-complete history — flagging here rather than silently
/// presenting it as one.
@freezed
class OpportunityNote with _$OpportunityNote {
  const factory OpportunityNote({
    required String id,
    String? opportunityId,
    String? subject,
    String? description,
    required DateTime date,
    OpportunityNoteAuthor? createdBy,
  }) = _OpportunityNote;

  factory OpportunityNote.fromJson(Map<String, dynamic> json) => _$OpportunityNoteFromJson(json);
}

@freezed
class OpportunityNoteAuthor with _$OpportunityNoteAuthor {
  const factory OpportunityNoteAuthor({String? firstName, String? lastName}) = _OpportunityNoteAuthor;

  factory OpportunityNoteAuthor.fromJson(Map<String, dynamic> json) => _$OpportunityNoteAuthorFromJson(json);
}
