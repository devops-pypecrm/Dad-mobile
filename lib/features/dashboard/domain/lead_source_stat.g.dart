// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_source_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadSourceStatImpl _$$LeadSourceStatImplFromJson(Map<String, dynamic> json) =>
    _$LeadSourceStatImpl(
      source: json['source'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadSourceStatImplToJson(
  _$LeadSourceStatImpl instance,
) => <String, dynamic>{'source': instance.source, 'count': instance.count};
