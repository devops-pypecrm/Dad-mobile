// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_assignee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadAssigneeImpl _$$LeadAssigneeImplFromJson(Map<String, dynamic> json) =>
    _$LeadAssigneeImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$LeadAssigneeImplToJson(_$LeadAssigneeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
