// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_whatsapp_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadWhatsAppActivityImpl _$$LeadWhatsAppActivityImplFromJson(
  Map<String, dynamic> json,
) => _$LeadWhatsAppActivityImpl(
  id: json['id'] as String,
  source: json['source'] as String,
  direction: json['direction'] as String?,
  messageType: json['messageType'] as String?,
  content: json['content'] as String?,
  status: json['status'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  date: DateTime.parse(json['date'] as String),
  actor: json['actor'] as String?,
  subject: json['subject'] as String?,
  description: json['description'] as String?,
  duration: (json['duration'] as num?)?.toDouble(),
  recordingDuration: (json['recordingDuration'] as num?)?.toDouble(),
  hardwareDuration: (json['hardwareDuration'] as num?)?.toDouble(),
  callStatus: json['callStatus'] as String?,
  recordingUrl: json['recordingUrl'] as String?,
);

Map<String, dynamic> _$$LeadWhatsAppActivityImplToJson(
  _$LeadWhatsAppActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'source': instance.source,
  'direction': instance.direction,
  'messageType': instance.messageType,
  'content': instance.content,
  'status': instance.status,
  'phoneNumber': instance.phoneNumber,
  'date': instance.date.toIso8601String(),
  'actor': instance.actor,
  'subject': instance.subject,
  'description': instance.description,
  'duration': instance.duration,
  'recordingDuration': instance.recordingDuration,
  'hardwareDuration': instance.hardwareDuration,
  'callStatus': instance.callStatus,
  'recordingUrl': instance.recordingUrl,
};
