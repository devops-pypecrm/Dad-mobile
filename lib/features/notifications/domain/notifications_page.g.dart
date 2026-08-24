// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsPageImpl _$$NotificationsPageImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationsPageImpl(
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
  currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$NotificationsPageImplToJson(
  _$NotificationsPageImpl instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'unreadCount': instance.unreadCount,
  'total': instance.total,
  'totalPages': instance.totalPages,
  'currentPage': instance.currentPage,
};
