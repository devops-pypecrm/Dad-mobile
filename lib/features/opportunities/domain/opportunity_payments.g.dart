// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_payments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmiScheduleImpl _$$EmiScheduleImplFromJson(Map<String, dynamic> json) =>
    _$EmiScheduleImpl(
      id: json['id'] as String,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
      paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
      remainingAmount: (json['remainingAmount'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? 'active',
      installments:
          (json['installments'] as List<dynamic>?)
              ?.map((e) => EmiInstallment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EmiInstallment>[],
    );

Map<String, dynamic> _$$EmiScheduleImplToJson(_$EmiScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'remainingAmount': instance.remainingAmount,
      'status': instance.status,
      'installments': instance.installments,
    };

_$EmiInstallmentImpl _$$EmiInstallmentImplFromJson(Map<String, dynamic> json) =>
    _$EmiInstallmentImpl(
      id: json['id'] as String,
      installmentNumber: (json['installmentNumber'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: json['status'] as String? ?? 'pending',
      paidDate: json['paidDate'] == null
          ? null
          : DateTime.parse(json['paidDate'] as String),
    );

Map<String, dynamic> _$$EmiInstallmentImplToJson(
  _$EmiInstallmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'installmentNumber': instance.installmentNumber,
  'amount': instance.amount,
  'paidAmount': instance.paidAmount,
  'dueDate': instance.dueDate.toIso8601String(),
  'status': instance.status,
  'paidDate': instance.paidDate?.toIso8601String(),
};

_$PaymentRecordImpl _$$PaymentRecordImplFromJson(Map<String, dynamic> json) =>
    _$PaymentRecordImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      paymentType: json['paymentType'] as String? ?? 'full',
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$PaymentRecordImplToJson(_$PaymentRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'paymentDate': instance.paymentDate.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'paymentType': instance.paymentType,
      'notes': instance.notes,
    };
