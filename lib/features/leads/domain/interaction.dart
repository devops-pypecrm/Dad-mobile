import 'package:freezed_annotation/freezed_annotation.dart';

part 'interaction.freezed.dart';
part 'interaction.g.dart';

/// A note/activity row from `GET /api/interactions/leads/:leadId/interactions`
/// (Dad-backend/src/controllers/interactionController.ts `getLeadInteractions`).
/// That endpoint returns a full `Interaction` row per the Prisma model, but
/// this only models what a plain-text note needs to display — `type` is
/// always `'note'` here since that's the only kind mobile creates, though
/// the backend's `InteractionType` enum also covers call/email/meeting/
/// whatsapp entries that may show up in this same feed if logged elsewhere.
@freezed
class Interaction with _$Interaction {
  const factory Interaction({
    required String id,
    required String type,
    String? subject,
    String? description,
    required DateTime date,
    InteractionAuthor? createdBy,
  }) = _Interaction;

  factory Interaction.fromJson(Map<String, dynamic> json) =>
      _$InteractionFromJson(json);
}

@freezed
class InteractionAuthor with _$InteractionAuthor {
  const factory InteractionAuthor({String? firstName, String? lastName}) =
      _InteractionAuthor;

  factory InteractionAuthor.fromJson(Map<String, dynamic> json) =>
      _$InteractionAuthorFromJson(json);
}
