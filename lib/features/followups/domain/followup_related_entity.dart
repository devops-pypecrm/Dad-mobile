import 'package:freezed_annotation/freezed_annotation.dart';

part 'followup_related_entity.freezed.dart';
part 'followup_related_entity.g.dart';

/// The backend resolves the polymorphic `leadId`/`contactId`/`accountId`/
/// `opportunityId` FK into a pre-fetched `relatedTo` object + `onModel`
/// discriminator on every FollowUp response
/// (Dad-backend/src/controllers/followUpController.ts). Shape varies by
/// entity type (Lead/Contact have `firstName`+`lastName`, Account/Opportunity
/// have `name`), so every field here is optional.
@freezed
class FollowUpRelatedEntity with _$FollowUpRelatedEntity {
  const FollowUpRelatedEntity._();

  const factory FollowUpRelatedEntity({
    required String id,
    String? firstName,
    String? lastName,
    String? name,
    String? company,
    String? phone,
  }) = _FollowUpRelatedEntity;

  factory FollowUpRelatedEntity.fromJson(Map<String, dynamic> json) =>
      _$FollowUpRelatedEntityFromJson(json);

  String get displayName {
    final personName = [firstName, lastName].where((p) => p != null && p.trim().isNotEmpty).join(' ');
    if (personName.isNotEmpty) return personName;
    if (name != null && name!.isNotEmpty) return name!;
    return 'Untitled';
  }
}
