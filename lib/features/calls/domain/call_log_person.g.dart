// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallLogAgentImpl _$$CallLogAgentImplFromJson(Map<String, dynamic> json) =>
    _$CallLogAgentImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CallLogAgentImplToJson(_$CallLogAgentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

_$CallLogLeadImpl _$$CallLogLeadImplFromJson(Map<String, dynamic> json) =>
    _$CallLogLeadImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$$CallLogLeadImplToJson(_$CallLogLeadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'company': instance.company,
    };

_$CallLogContactImpl _$$CallLogContactImplFromJson(Map<String, dynamic> json) =>
    _$CallLogContactImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$CallLogContactImplToJson(
  _$CallLogContactImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
