// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followups_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowUpsPageImpl _$$FollowUpsPageImplFromJson(Map<String, dynamic> json) =>
    _$FollowUpsPageImpl(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => FollowUp.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalTasks: (json['totalTasks'] as num).toInt(),
      counts: FollowUpCounts.fromJson(json['counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowUpsPageImplToJson(_$FollowUpsPageImpl instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'totalTasks': instance.totalTasks,
      'counts': instance.counts,
    };

_$FollowUpCountsImpl _$$FollowUpCountsImplFromJson(Map<String, dynamic> json) =>
    _$FollowUpCountsImpl(
      active: (json['active'] as num?)?.toInt() ?? 0,
      overdue: (json['overdue'] as num?)?.toInt() ?? 0,
      today: (json['today'] as num?)?.toInt() ?? 0,
      upcoming: (json['upcoming'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FollowUpCountsImplToJson(
  _$FollowUpCountsImpl instance,
) => <String, dynamic>{
  'active': instance.active,
  'overdue': instance.overdue,
  'today': instance.today,
  'upcoming': instance.upcoming,
};
