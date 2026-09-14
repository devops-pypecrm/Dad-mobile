// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_timeline_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpportunityTimelineItemImpl _$$OpportunityTimelineItemImplFromJson(
  Map<String, dynamic> json,
) => _$OpportunityTimelineItemImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  subType: json['subType'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  date: DateTime.parse(json['date'] as String),
  actor: json['actor'] == null
      ? null
      : TimelineActor.fromJson(json['actor'] as Map<String, dynamic>),
  meta: json['meta'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$$OpportunityTimelineItemImplToJson(
  _$OpportunityTimelineItemImpl instance,
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

_$TimelineActorImpl _$$TimelineActorImplFromJson(Map<String, dynamic> json) =>
    _$TimelineActorImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$TimelineActorImplToJson(_$TimelineActorImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
