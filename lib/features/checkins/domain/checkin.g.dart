// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInImpl _$$CheckInImplFromJson(Map<String, dynamic> json) =>
    _$CheckInImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      leadId: json['leadId'] as String?,
      contactId: json['contactId'] as String?,
      accountId: json['accountId'] as String?,
      user: json['user'] == null
          ? null
          : CheckInUserRef.fromJson(json['user'] as Map<String, dynamic>),
      lead: json['lead'] == null
          ? null
          : CheckInEntityRef.fromJson(json['lead'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : CheckInEntityRef.fromJson(json['contact'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : CheckInEntityRef.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckInImplToJson(_$CheckInImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'notes': instance.notes,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'leadId': instance.leadId,
      'contactId': instance.contactId,
      'accountId': instance.accountId,
      'user': instance.user,
      'lead': instance.lead,
      'contact': instance.contact,
      'account': instance.account,
    };
