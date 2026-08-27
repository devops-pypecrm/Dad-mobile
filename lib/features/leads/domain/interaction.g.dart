// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteractionImpl _$$InteractionImplFromJson(Map<String, dynamic> json) =>
    _$InteractionImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      subject: json['subject'] as String?,
      description: json['description'] as String?,
      date: DateTime.parse(json['date'] as String),
      createdBy: json['createdBy'] == null
          ? null
          : InteractionAuthor.fromJson(
              json['createdBy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$InteractionImplToJson(_$InteractionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'subject': instance.subject,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'createdBy': instance.createdBy,
    };

_$InteractionAuthorImpl _$$InteractionAuthorImplFromJson(
  Map<String, dynamic> json,
) => _$InteractionAuthorImpl(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$$InteractionAuthorImplToJson(
  _$InteractionAuthorImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
