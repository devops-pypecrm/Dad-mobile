// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_ownership_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadOwnershipHistoryItemImpl _$$LeadOwnershipHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$LeadOwnershipHistoryItemImpl(
  id: json['id'] as String,
  oldOwner: json['oldOwner'] == null
      ? null
      : LeadHistoryUser.fromJson(json['oldOwner'] as Map<String, dynamic>),
  newOwner: json['newOwner'] == null
      ? null
      : LeadHistoryUser.fromJson(json['newOwner'] as Map<String, dynamic>),
  changedBy: json['changedBy'] == null
      ? null
      : LeadHistoryUser.fromJson(json['changedBy'] as Map<String, dynamic>),
  reason: json['reason'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$LeadOwnershipHistoryItemImplToJson(
  _$LeadOwnershipHistoryItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'oldOwner': instance.oldOwner,
  'newOwner': instance.newOwner,
  'changedBy': instance.changedBy,
  'reason': instance.reason,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$LeadHistoryUserImpl _$$LeadHistoryUserImplFromJson(
  Map<String, dynamic> json,
) => _$LeadHistoryUserImpl(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$$LeadHistoryUserImplToJson(
  _$LeadHistoryUserImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
