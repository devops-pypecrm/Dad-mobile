// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_re_enquiry_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadReEnquiryEventImpl _$$LeadReEnquiryEventImplFromJson(
  Map<String, dynamic> json,
) => _$LeadReEnquiryEventImpl(
  eventIndex: (json['eventIndex'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  source: json['source'] as String?,
  hasFullSnapshot: json['hasFullSnapshot'] as bool? ?? false,
  alreadySplitLeadId: json['alreadySplitLeadId'] as String?,
);

Map<String, dynamic> _$$LeadReEnquiryEventImplToJson(
  _$LeadReEnquiryEventImpl instance,
) => <String, dynamic>{
  'eventIndex': instance.eventIndex,
  'date': instance.date.toIso8601String(),
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'source': instance.source,
  'hasFullSnapshot': instance.hasFullSnapshot,
  'alreadySplitLeadId': instance.alreadySplitLeadId,
};

_$LeadReEnquiryHistoryImpl _$$LeadReEnquiryHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$LeadReEnquiryHistoryImpl(
  leadId: json['leadId'] as String,
  currentName: json['currentName'] as String,
  currentPhone: json['currentPhone'] as String,
  currentEmail: json['currentEmail'] as String?,
  reEnquiryCount: (json['reEnquiryCount'] as num?)?.toInt() ?? 0,
  events:
      (json['events'] as List<dynamic>?)
          ?.map((e) => LeadReEnquiryEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$LeadReEnquiryHistoryImplToJson(
  _$LeadReEnquiryHistoryImpl instance,
) => <String, dynamic>{
  'leadId': instance.leadId,
  'currentName': instance.currentName,
  'currentPhone': instance.currentPhone,
  'currentEmail': instance.currentEmail,
  'reEnquiryCount': instance.reEnquiryCount,
  'events': instance.events,
};
