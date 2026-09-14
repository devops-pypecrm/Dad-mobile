// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_health.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadHealthImpl _$$LeadHealthImplFromJson(Map<String, dynamic> json) =>
    _$LeadHealthImpl(
      unattendedLeads: (json['unattendedLeads'] as num?)?.toInt() ?? 0,
      noActivityLeads: (json['noActivityLeads'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadHealthImplToJson(_$LeadHealthImpl instance) =>
    <String, dynamic>{
      'unattendedLeads': instance.unattendedLeads,
      'noActivityLeads': instance.noActivityLeads,
    };
