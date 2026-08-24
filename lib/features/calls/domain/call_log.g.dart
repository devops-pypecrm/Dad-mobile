// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallLogImpl _$$CallLogImplFromJson(Map<String, dynamic> json) =>
    _$CallLogImpl(
      id: json['id'] as String,
      direction: json['direction'] as String? ?? 'outbound',
      subject: json['subject'] as String?,
      date: DateTime.parse(json['date'] as String),
      duration: (json['duration'] as num?)?.toDouble(),
      recordingDuration: (json['recordingDuration'] as num?)?.toInt(),
      recordingUrl: json['recordingUrl'] as String?,
      callStatus: json['callStatus'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : CallLogAgent.fromJson(json['createdBy'] as Map<String, dynamic>),
      lead: json['lead'] == null
          ? null
          : CallLogLead.fromJson(json['lead'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : CallLogContact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CallLogImplToJson(_$CallLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'direction': instance.direction,
      'subject': instance.subject,
      'date': instance.date.toIso8601String(),
      'duration': instance.duration,
      'recordingDuration': instance.recordingDuration,
      'recordingUrl': instance.recordingUrl,
      'callStatus': instance.callStatus,
      'phoneNumber': instance.phoneNumber,
      'createdBy': instance.createdBy,
      'lead': instance.lead,
      'contact': instance.contact,
    };
