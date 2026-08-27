// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpportunityImpl _$$OpportunityImplFromJson(Map<String, dynamic> json) =>
    _$OpportunityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      stage: json['stage'] as String? ?? 'prospecting',
      probability: (json['probability'] as num?)?.toDouble() ?? 10,
      closeDate: json['closeDate'] == null
          ? null
          : DateTime.parse(json['closeDate'] as String),
      leadSource: json['leadSource'] as String?,
      description: json['description'] as String?,
      paymentStatus: json['paymentStatus'] as String? ?? 'pending',
      type: json['type'] as String? ?? 'NEW_BUSINESS',
      accountId: json['accountId'] as String?,
      account: json['account'] == null
          ? null
          : AccountRef.fromJson(json['account'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : OwnerRef.fromJson(json['owner'] as Map<String, dynamic>),
      contacts:
          (json['contacts'] as List<dynamic>?)
              ?.map((e) => ContactRef.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ContactRef>[],
      lead: json['lead'] == null
          ? null
          : LeadRef.fromJson(json['lead'] as Map<String, dynamic>),
      emiSchedule: json['emiSchedule'] == null
          ? null
          : EmiSchedule.fromJson(json['emiSchedule'] as Map<String, dynamic>),
      paymentRecords:
          (json['paymentRecords'] as List<dynamic>?)
              ?.map((e) => PaymentRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PaymentRecord>[],
    );

Map<String, dynamic> _$$OpportunityImplToJson(_$OpportunityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'stage': instance.stage,
      'probability': instance.probability,
      'closeDate': instance.closeDate?.toIso8601String(),
      'leadSource': instance.leadSource,
      'description': instance.description,
      'paymentStatus': instance.paymentStatus,
      'type': instance.type,
      'accountId': instance.accountId,
      'account': instance.account,
      'owner': instance.owner,
      'contacts': instance.contacts,
      'lead': instance.lead,
      'emiSchedule': instance.emiSchedule,
      'paymentRecords': instance.paymentRecords,
    };
