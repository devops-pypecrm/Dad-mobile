// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingCheckInImpl _$$PendingCheckInImplFromJson(Map<String, dynamic> json) =>
    _$PendingCheckInImpl(
      localId: json['localId'] as String,
      type: json['type'] as String,
      notes: json['notes'] as String?,
      leadId: json['leadId'] as String?,
      contactId: json['contactId'] as String?,
      accountId: json['accountId'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      localPhotoPath: json['localPhotoPath'] as String?,
      photoUrl: json['photoUrl'] as String?,
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PendingCheckInImplToJson(
  _$PendingCheckInImpl instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'type': instance.type,
  'notes': instance.notes,
  'leadId': instance.leadId,
  'contactId': instance.contactId,
  'accountId': instance.accountId,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'address': instance.address,
  'localPhotoPath': instance.localPhotoPath,
  'photoUrl': instance.photoUrl,
  'capturedAt': instance.capturedAt.toIso8601String(),
  'attempts': instance.attempts,
};
