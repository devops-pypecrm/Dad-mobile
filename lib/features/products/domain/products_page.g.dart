// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsPageImpl _$$ProductsPageImplFromJson(Map<String, dynamic> json) =>
    _$ProductsPageImpl(
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Product>[],
      page: (json['page'] as num?)?.toInt() ?? 1,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
      totalProducts: (json['totalProducts'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProductsPageImplToJson(_$ProductsPageImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'totalProducts': instance.totalProducts,
    };
