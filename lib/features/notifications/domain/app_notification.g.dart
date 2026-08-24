// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$AppNotificationImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  message: json['message'] as String,
  type: json['type'] as String? ?? 'info',
  relatedResource: json['relatedResource'] as String?,
  relatedId: json['relatedId'] as String?,
  isRead: json['isRead'] as bool? ?? false,
  recipientId: json['recipientId'] as String,
  organisationId: json['organisationId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$AppNotificationImplToJson(
  _$AppNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'message': instance.message,
  'type': instance.type,
  'relatedResource': instance.relatedResource,
  'relatedId': instance.relatedId,
  'isRead': instance.isRead,
  'recipientId': instance.recipientId,
  'organisationId': instance.organisationId,
  'createdAt': instance.createdAt.toIso8601String(),
};
