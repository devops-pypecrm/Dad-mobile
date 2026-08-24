// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountProductItemImpl _$$AccountProductItemImplFromJson(
  Map<String, dynamic> json,
) => _$AccountProductItemImpl(
  id: json['id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  customName: json['customName'] as String?,
  status: json['status'] as String?,
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AccountProductItemImplToJson(
  _$AccountProductItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'price': instance.price,
  'customName': instance.customName,
  'status': instance.status,
  'product': instance.product,
};
