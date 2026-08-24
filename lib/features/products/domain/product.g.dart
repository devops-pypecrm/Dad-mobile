// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'INR',
      category: json['category'] as String?,
      isActive: json['isActive'] as bool? ?? false,
      isCustom: json['isCustom'] as bool? ?? false,
      brochureUrl: json['brochureUrl'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'basePrice': instance.basePrice,
      'currency': instance.currency,
      'category': instance.category,
      'isActive': instance.isActive,
      'isCustom': instance.isCustom,
      'brochureUrl': instance.brochureUrl,
    };
