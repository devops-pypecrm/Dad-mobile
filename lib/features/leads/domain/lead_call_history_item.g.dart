// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_call_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadCallHistoryItemImpl _$$LeadCallHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$LeadCallHistoryItemImpl(
  id: json['id'] as String,
  direction: json['direction'] as String?,
  subject: json['subject'] as String,
  description: json['description'] as String?,
  date: DateTime.parse(json['date'] as String),
  duration: (json['duration'] as num?)?.toDouble(),
  recordingDuration: (json['recordingDuration'] as num?)?.toDouble(),
  hardwareDuration: (json['hardwareDuration'] as num?)?.toDouble(),
  callStatus: json['callStatus'] as String?,
  recordingUrl: json['recordingUrl'] as String?,
);

Map<String, dynamic> _$$LeadCallHistoryItemImplToJson(
  _$LeadCallHistoryItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'direction': instance.direction,
  'subject': instance.subject,
  'description': instance.description,
  'date': instance.date.toIso8601String(),
  'duration': instance.duration,
  'recordingDuration': instance.recordingDuration,
  'hardwareDuration': instance.hardwareDuration,
  'callStatus': instance.callStatus,
  'recordingUrl': instance.recordingUrl,
};
