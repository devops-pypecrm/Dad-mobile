// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_refs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInUserRefImpl _$$CheckInUserRefImplFromJson(Map<String, dynamic> json) =>
    _$CheckInUserRefImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      branch: json['branch'] == null
          ? null
          : CheckInBranchRef.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckInUserRefImplToJson(
  _$CheckInUserRefImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'branch': instance.branch,
};

_$CheckInBranchRefImpl _$$CheckInBranchRefImplFromJson(
  Map<String, dynamic> json,
) => _$CheckInBranchRefImpl(name: json['name'] as String?);

Map<String, dynamic> _$$CheckInBranchRefImplToJson(
  _$CheckInBranchRefImpl instance,
) => <String, dynamic>{'name': instance.name};

_$CheckInEntityRefImpl _$$CheckInEntityRefImplFromJson(
  Map<String, dynamic> json,
) => _$CheckInEntityRefImpl(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  name: json['name'] as String?,
  company: json['company'] as String?,
);

Map<String, dynamic> _$$CheckInEntityRefImplToJson(
  _$CheckInEntityRefImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'name': instance.name,
  'company': instance.company,
};
