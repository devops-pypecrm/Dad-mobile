// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emi_schedule_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmiScheduleSummaryImpl _$$EmiScheduleSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$EmiScheduleSummaryImpl(
  id: json['id'] as String,
  totalAmount: (json['totalAmount'] as num).toDouble(),
  paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
  remainingAmount: (json['remainingAmount'] as num).toDouble(),
  status: json['status'] as String? ?? 'active',
  opportunity: EmiOpportunityRef.fromJson(
    json['opportunity'] as Map<String, dynamic>,
  ),
  installments:
      (json['installments'] as List<dynamic>?)
          ?.map((e) => EmiInstallment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EmiInstallment>[],
);

Map<String, dynamic> _$$EmiScheduleSummaryImplToJson(
  _$EmiScheduleSummaryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'totalAmount': instance.totalAmount,
  'paidAmount': instance.paidAmount,
  'remainingAmount': instance.remainingAmount,
  'status': instance.status,
  'opportunity': instance.opportunity,
  'installments': instance.installments,
};

_$EmiOpportunityRefImpl _$$EmiOpportunityRefImplFromJson(
  Map<String, dynamic> json,
) => _$EmiOpportunityRefImpl(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$$EmiOpportunityRefImplToJson(
  _$EmiOpportunityRefImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
