// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_refs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountRefImpl _$$AccountRefImplFromJson(Map<String, dynamic> json) =>
    _$AccountRefImpl(id: json['id'] as String?, name: json['name'] as String);

Map<String, dynamic> _$$AccountRefImplToJson(_$AccountRefImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$OwnerRefImpl _$$OwnerRefImplFromJson(Map<String, dynamic> json) =>
    _$OwnerRefImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$OwnerRefImplToJson(_$OwnerRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

_$ContactRefImpl _$$ContactRefImplFromJson(Map<String, dynamic> json) =>
    _$ContactRefImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ContactRefImplToJson(_$ContactRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
