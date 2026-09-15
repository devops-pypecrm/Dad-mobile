// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDeviceSessionImpl _$$UserDeviceSessionImplFromJson(
  Map<String, dynamic> json,
) => _$UserDeviceSessionImpl(
  id: json['id'] as String,
  platform: json['platform'] as String?,
  deviceName: json['deviceName'] as String?,
  appVersion: json['appVersion'] as String?,
  ipAddress: json['ipAddress'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastActiveAt: DateTime.parse(json['lastActiveAt'] as String),
  isCurrentDevice: json['isCurrentDevice'] as bool? ?? false,
);

Map<String, dynamic> _$$UserDeviceSessionImplToJson(
  _$UserDeviceSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'platform': instance.platform,
  'deviceName': instance.deviceName,
  'appVersion': instance.appVersion,
  'ipAddress': instance.ipAddress,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastActiveAt': instance.lastActiveAt.toIso8601String(),
  'isCurrentDevice': instance.isCurrentDevice,
};
