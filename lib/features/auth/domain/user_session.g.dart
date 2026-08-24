// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSessionImpl _$$UserSessionImplFromJson(Map<String, dynamic> json) =>
    _$UserSessionImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      position: json['position'] as String?,
      isBranchManager: json['isBranchManager'] as bool? ?? false,
      organisation: Organisation.fromJson(
        json['organisation'] as Map<String, dynamic>,
      ),
      branchId: json['branchId'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserSessionImplToJson(_$UserSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'position': instance.position,
      'isBranchManager': instance.isBranchManager,
      'organisation': instance.organisation,
      'branchId': instance.branchId,
      'token': instance.token,
    };
