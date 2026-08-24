// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadProductItemImpl _$$LeadProductItemImplFromJson(
  Map<String, dynamic> json,
) => _$LeadProductItemImpl(
  id: json['id'] as String,
  productId: json['productId'] as String,
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  price: (json['price'] as num).toDouble(),
  customName: json['customName'] as String?,
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LeadProductItemImplToJson(
  _$LeadProductItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'quantity': instance.quantity,
  'price': instance.price,
  'customName': instance.customName,
  'product': instance.product,
};

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String?,
      basePrice: (json['basePrice'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'INR',
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'basePrice': instance.basePrice,
      'currency': instance.currency,
    };
