// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      industry: json['industry'] as String?,
      website: json['website'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as String? ?? 'prospect',
      address: json['address'] as Map<String, dynamic>?,
      owner: json['owner'] == null
          ? null
          : OwnerRef.fromJson(json['owner'] as Map<String, dynamic>),
      contacts:
          (json['contacts'] as List<dynamic>?)
              ?.map((e) => ContactRef.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ContactRef>[],
      opportunities:
          (json['opportunities'] as List<dynamic>?)
              ?.map(
                (e) =>
                    AccountOpportunityRef.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <AccountOpportunityRef>[],
      accountProducts:
          (json['accountProducts'] as List<dynamic>?)
              ?.map(
                (e) => AccountProductItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <AccountProductItem>[],
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'industry': instance.industry,
      'website': instance.website,
      'phone': instance.phone,
      'type': instance.type,
      'address': instance.address,
      'owner': instance.owner,
      'contacts': instance.contacts,
      'opportunities': instance.opportunities,
      'accountProducts': instance.accountProducts,
    };
