// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsPageImpl _$$AccountsPageImplFromJson(Map<String, dynamic> json) =>
    _$AccountsPageImpl(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$AccountsPageImplToJson(_$AccountsPageImpl instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'page': instance.page,
      'pages': instance.pages,
      'total': instance.total,
    };
