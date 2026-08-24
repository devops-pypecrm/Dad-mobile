// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hierarchy_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HierarchyUserImpl _$$HierarchyUserImplFromJson(Map<String, dynamic> json) =>
    _$HierarchyUserImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      role: json['role'] as String?,
      reportsToId: json['reportsToId'] as String?,
    );

Map<String, dynamic> _$$HierarchyUserImplToJson(_$HierarchyUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'reportsToId': instance.reportsToId,
    };
