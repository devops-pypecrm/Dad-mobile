// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallSettingsImpl _$$CallSettingsImplFromJson(Map<String, dynamic> json) =>
    _$CallSettingsImpl(
      autoRecordOutbound: json['autoRecordOutbound'] as bool? ?? false,
      autoRecordInbound: json['autoRecordInbound'] as bool? ?? false,
      recordingQuality: json['recordingQuality'] as String? ?? 'high',
      storageType: json['storageType'] as String? ?? 'local',
      retentionDays: (json['retentionDays'] as num?)?.toInt() ?? 90,
      autoDeleteEnabled: json['autoDeleteEnabled'] as bool? ?? false,
      popupOnIncoming: json['popupOnIncoming'] as bool? ?? true,
      autoFollowupReminder: json['autoFollowupReminder'] as bool? ?? true,
      followupDelayMinutes:
          (json['followupDelayMinutes'] as num?)?.toInt() ?? 30,
      syncNonCrmContacts: json['syncNonCrmContacts'] as bool? ?? true,
    );

Map<String, dynamic> _$$CallSettingsImplToJson(_$CallSettingsImpl instance) =>
    <String, dynamic>{
      'autoRecordOutbound': instance.autoRecordOutbound,
      'autoRecordInbound': instance.autoRecordInbound,
      'recordingQuality': instance.recordingQuality,
      'storageType': instance.storageType,
      'retentionDays': instance.retentionDays,
      'autoDeleteEnabled': instance.autoDeleteEnabled,
      'popupOnIncoming': instance.popupOnIncoming,
      'autoFollowupReminder': instance.autoFollowupReminder,
      'followupDelayMinutes': instance.followupDelayMinutes,
      'syncNonCrmContacts': instance.syncNonCrmContacts,
    };
