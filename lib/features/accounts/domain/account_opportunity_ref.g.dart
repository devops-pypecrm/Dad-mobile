// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_opportunity_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountOpportunityRefImpl _$$AccountOpportunityRefImplFromJson(
  Map<String, dynamic> json,
) => _$AccountOpportunityRefImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
  stage: json['stage'] as String,
);

Map<String, dynamic> _$$AccountOpportunityRefImplToJson(
  _$AccountOpportunityRefImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
  'stage': instance.stage,
};
