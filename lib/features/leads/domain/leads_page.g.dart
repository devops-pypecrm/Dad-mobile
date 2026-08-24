// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadsPageImpl _$$LeadsPageImplFromJson(Map<String, dynamic> json) =>
    _$LeadsPageImpl(
      leads: (json['leads'] as List<dynamic>)
          .map((e) => Lead.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$LeadsPageImplToJson(_$LeadsPageImpl instance) =>
    <String, dynamic>{
      'leads': instance.leads,
      'page': instance.page,
      'pages': instance.pages,
      'total': instance.total,
    };
