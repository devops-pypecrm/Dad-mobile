// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_refs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountRefImpl _$$AccountRefImplFromJson(Map<String, dynamic> json) =>
    _$AccountRefImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      accountProducts:
          (json['accountProducts'] as List<dynamic>?)
              ?.map(
                (e) => AccountProductRef.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <AccountProductRef>[],
    );

Map<String, dynamic> _$$AccountRefImplToJson(_$AccountRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountProducts': instance.accountProducts,
    };

_$AccountProductRefImpl _$$AccountProductRefImplFromJson(
  Map<String, dynamic> json,
) => _$AccountProductRefImpl(
  id: json['id'] as String,
  quantity: (json['quantity'] as num?)?.toDouble() ?? 1,
  price: (json['price'] as num?)?.toDouble() ?? 0,
  customName: json['customName'] as String?,
  product: json['product'] == null
      ? null
      : ProductRef.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AccountProductRefImplToJson(
  _$AccountProductRefImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'price': instance.price,
  'customName': instance.customName,
  'product': instance.product,
};

_$ProductRefImpl _$$ProductRefImplFromJson(Map<String, dynamic> json) =>
    _$ProductRefImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$ProductRefImplToJson(_$ProductRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'basePrice': instance.basePrice,
    };

_$OwnerRefImpl _$$OwnerRefImplFromJson(Map<String, dynamic> json) =>
    _$OwnerRefImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$OwnerRefImplToJson(_$OwnerRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

_$ContactRefImpl _$$ContactRefImplFromJson(Map<String, dynamic> json) =>
    _$ContactRefImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ContactRefImplToJson(_$ContactRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

_$LeadRefImpl _$$LeadRefImplFromJson(Map<String, dynamic> json) =>
    _$LeadRefImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      status: json['status'] as String?,
      assignedTo: json['assignedTo'] == null
          ? null
          : LeadAssigneeRef.fromJson(
              json['assignedTo'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$LeadRefImplToJson(_$LeadRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'status': instance.status,
      'assignedTo': instance.assignedTo,
    };

_$LeadAssigneeRefImpl _$$LeadAssigneeRefImplFromJson(
  Map<String, dynamic> json,
) => _$LeadAssigneeRefImpl(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$$LeadAssigneeRefImplToJson(
  _$LeadAssigneeRefImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
