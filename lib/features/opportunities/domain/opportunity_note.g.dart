// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpportunityNoteImpl _$$OpportunityNoteImplFromJson(
  Map<String, dynamic> json,
) => _$OpportunityNoteImpl(
  id: json['id'] as String,
  opportunityId: json['opportunityId'] as String?,
  subject: json['subject'] as String?,
  description: json['description'] as String?,
  date: DateTime.parse(json['date'] as String),
  createdBy: json['createdBy'] == null
      ? null
      : OpportunityNoteAuthor.fromJson(
          json['createdBy'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$OpportunityNoteImplToJson(
  _$OpportunityNoteImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'opportunityId': instance.opportunityId,
  'subject': instance.subject,
  'description': instance.description,
  'date': instance.date.toIso8601String(),
  'createdBy': instance.createdBy,
};

_$OpportunityNoteAuthorImpl _$$OpportunityNoteAuthorImplFromJson(
  Map<String, dynamic> json,
) => _$OpportunityNoteAuthorImpl(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$$OpportunityNoteAuthorImplToJson(
  _$OpportunityNoteAuthorImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
