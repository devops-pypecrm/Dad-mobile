// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_logs_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallLogsPageImpl _$$CallLogsPageImplFromJson(Map<String, dynamic> json) =>
    _$CallLogsPageImpl(
      calls:
          (json['calls'] as List<dynamic>?)
              ?.map((e) => CallLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CallLog>[],
      pagination: CallLogsPagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$CallLogsPageImplToJson(_$CallLogsPageImpl instance) =>
    <String, dynamic>{
      'calls': instance.calls,
      'pagination': instance.pagination,
    };

_$CallLogsPaginationImpl _$$CallLogsPaginationImplFromJson(
  Map<String, dynamic> json,
) => _$CallLogsPaginationImpl(
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
  total: (json['total'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$CallLogsPaginationImplToJson(
  _$CallLogsPaginationImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'totalPages': instance.totalPages,
};
