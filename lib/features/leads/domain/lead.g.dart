// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadImpl _$$LeadImplFromJson(Map<String, dynamic> json) => _$LeadImpl(
  id: json['id'] as String,
  firstName: json['firstName'] as String? ?? '',
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String,
  secondaryPhone: json['secondaryPhone'] as String?,
  company: json['company'] as String?,
  jobTitle: json['jobTitle'] as String?,
  enquiryAbout: json['enquiryAbout'] as String?,
  status: json['status'] as String? ?? 'new',
  source: json['source'] as String? ?? 'manual',
  sourceDetails: json['sourceDetails'] == null
      ? null
      : LeadSourceDetails.fromJson(
          json['sourceDetails'] as Map<String, dynamic>,
        ),
  potentialValue: (json['potentialValue'] as num?)?.toDouble() ?? 0,
  leadScore: (json['leadScore'] as num?)?.toInt() ?? 0,
  isHotLead: json['isHotLead'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  isReEnquiry: json['isReEnquiry'] as bool? ?? false,
  reEnquiryCount: (json['reEnquiryCount'] as num?)?.toInt() ?? 0,
  lastEnquiryDate: json['lastEnquiryDate'] == null
      ? null
      : DateTime.parse(json['lastEnquiryDate'] as String),
  nextFollowUp: json['nextFollowUp'] == null
      ? null
      : DateTime.parse(json['nextFollowUp'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  branchId: json['branchId'] as String?,
  assignedTo: json['assignedTo'] == null
      ? null
      : LeadAssignee.fromJson(json['assignedTo'] as Map<String, dynamic>),
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => LeadProductItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$LeadImplToJson(_$LeadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'secondaryPhone': instance.secondaryPhone,
      'company': instance.company,
      'jobTitle': instance.jobTitle,
      'enquiryAbout': instance.enquiryAbout,
      'status': instance.status,
      'source': instance.source,
      'sourceDetails': instance.sourceDetails,
      'potentialValue': instance.potentialValue,
      'leadScore': instance.leadScore,
      'isHotLead': instance.isHotLead,
      'tags': instance.tags,
      'isReEnquiry': instance.isReEnquiry,
      'reEnquiryCount': instance.reEnquiryCount,
      'lastEnquiryDate': instance.lastEnquiryDate?.toIso8601String(),
      'nextFollowUp': instance.nextFollowUp?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'branchId': instance.branchId,
      'assignedTo': instance.assignedTo,
      'products': instance.products,
    };
