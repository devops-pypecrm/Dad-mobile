// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowUpImpl _$$FollowUpImplFromJson(Map<String, dynamic> json) =>
    _$FollowUpImpl(
      id: json['id'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String?,
      status: json['status'] as String? ?? kFollowUpNotStarted,
      priority: json['priority'] as String? ?? 'medium',
      dueDate: DateTime.parse(json['dueDate'] as String),
      relatedTo: json['relatedTo'] == null
          ? null
          : FollowUpRelatedEntity.fromJson(
              json['relatedTo'] as Map<String, dynamic>,
            ),
      onModel: json['onModel'] as String?,
      assignedTo: json['assignedTo'] == null
          ? null
          : FollowUpAssignee.fromJson(
              json['assignedTo'] as Map<String, dynamic>,
            ),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowUpImplToJson(_$FollowUpImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'description': instance.description,
      'status': instance.status,
      'priority': instance.priority,
      'dueDate': instance.dueDate.toIso8601String(),
      'relatedTo': instance.relatedTo,
      'onModel': instance.onModel,
      'assignedTo': instance.assignedTo,
      'branch': instance.branch,
    };
