// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_re_enquiry_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadReEnquiryEventImpl _$$LeadReEnquiryEventImplFromJson(
  Map<String, dynamic> json,
) => _$LeadReEnquiryEventImpl(
  eventIndex: (json['eventIndex'] as num?)?.toInt(),
  date: DateTime.parse(json['date'] as String),
  type: json['type'] as String? ?? 're_enquiry',
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  source: json['source'] as String?,
  enquiryAbout: json['enquiryAbout'] as String?,
  hasFullSnapshot: json['hasFullSnapshot'] as bool? ?? false,
  alreadySplitLeadId: json['alreadySplitLeadId'] as String?,
  followUp: json['followUp'] == null
      ? null
      : ReEnquiryFollowUpRef.fromJson(json['followUp'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LeadReEnquiryEventImplToJson(
  _$LeadReEnquiryEventImpl instance,
) => <String, dynamic>{
  'eventIndex': instance.eventIndex,
  'date': instance.date.toIso8601String(),
  'type': instance.type,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'source': instance.source,
  'enquiryAbout': instance.enquiryAbout,
  'hasFullSnapshot': instance.hasFullSnapshot,
  'alreadySplitLeadId': instance.alreadySplitLeadId,
  'followUp': instance.followUp,
};

_$ReEnquiryFollowUpRefImpl _$$ReEnquiryFollowUpRefImplFromJson(
  Map<String, dynamic> json,
) => _$ReEnquiryFollowUpRefImpl(
  id: json['id'] as String,
  subject: json['subject'] as String?,
  description: json['description'] as String?,
  status: json['status'] as String?,
  priority: json['priority'] as String?,
  assignedTo: json['assignedTo'] == null
      ? null
      : LeadAssignee.fromJson(json['assignedTo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ReEnquiryFollowUpRefImplToJson(
  _$ReEnquiryFollowUpRefImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'subject': instance.subject,
  'description': instance.description,
  'status': instance.status,
  'priority': instance.priority,
  'assignedTo': instance.assignedTo,
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
