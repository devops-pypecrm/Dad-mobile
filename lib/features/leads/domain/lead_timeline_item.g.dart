// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_timeline_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadTimelineItemImpl _$$LeadTimelineItemImplFromJson(
  Map<String, dynamic> json,
) => _$LeadTimelineItemImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  subType: json['subType'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  date: DateTime.parse(json['date'] as String),
  actor: json['actor'] == null
      ? null
      : LeadTimelineActor.fromJson(json['actor'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : LeadTimelineMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LeadTimelineItemImplToJson(
  _$LeadTimelineItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'subType': instance.subType,
  'title': instance.title,
  'description': instance.description,
  'date': instance.date.toIso8601String(),
  'actor': instance.actor,
  'meta': instance.meta,
};

_$LeadTimelineActorImpl _$$LeadTimelineActorImplFromJson(
  Map<String, dynamic> json,
) => _$LeadTimelineActorImpl(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$$LeadTimelineActorImplToJson(
  _$LeadTimelineActorImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};

_$LeadTimelineMetaImpl _$$LeadTimelineMetaImplFromJson(
  Map<String, dynamic> json,
) => _$LeadTimelineMetaImpl(
  direction: json['direction'] as String?,
  duration: (json['duration'] as num?)?.toDouble(),
  recordingDuration: (json['recordingDuration'] as num?)?.toDouble(),
  hardwareDuration: (json['hardwareDuration'] as num?)?.toDouble(),
  recordingUrl: json['recordingUrl'] as String?,
  priority: json['priority'] as String?,
  location: json['location'] as String?,
  fileUrl: json['fileUrl'] as String?,
  fileType: json['fileType'] as String?,
  fileSize: (json['fileSize'] as num?)?.toDouble(),
  callType: json['callType'] as String?,
);

Map<String, dynamic> _$$LeadTimelineMetaImplToJson(
  _$LeadTimelineMetaImpl instance,
) => <String, dynamic>{
  'direction': instance.direction,
  'duration': instance.duration,
  'recordingDuration': instance.recordingDuration,
  'hardwareDuration': instance.hardwareDuration,
  'recordingUrl': instance.recordingUrl,
  'priority': instance.priority,
  'location': instance.location,
  'fileUrl': instance.fileUrl,
  'fileType': instance.fileType,
  'fileSize': instance.fileSize,
  'callType': instance.callType,
};
