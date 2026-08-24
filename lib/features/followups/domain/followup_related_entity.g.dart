// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followup_related_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowUpRelatedEntityImpl _$$FollowUpRelatedEntityImplFromJson(
  Map<String, dynamic> json,
) => _$FollowUpRelatedEntityImpl(
  id: json['id'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  name: json['name'] as String?,
  company: json['company'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$$FollowUpRelatedEntityImplToJson(
  _$FollowUpRelatedEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'name': instance.name,
  'company': instance.company,
  'phone': instance.phone,
};
