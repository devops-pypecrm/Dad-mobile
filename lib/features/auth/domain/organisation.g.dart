// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganisationImpl _$$OrganisationImplFromJson(Map<String, dynamic> json) =>
    _$OrganisationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String?,
      logo: json['logo'] as String?,
      currency: json['currency'] as String?,
      leadStatuses: (json['leadStatuses'] as List<dynamic>?)
          ?.map((e) => LeadStatusOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      opportunityStages: (json['opportunityLeadStatuses'] as List<dynamic>?)
          ?.map((e) => LeadStatusOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrganisationImplToJson(_$OrganisationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
      'currency': instance.currency,
      'leadStatuses': instance.leadStatuses,
      'opportunityLeadStatuses': instance.opportunityStages,
    };

_$LeadStatusOptionImpl _$$LeadStatusOptionImplFromJson(
  Map<String, dynamic> json,
) => _$LeadStatusOptionImpl(
  id: json['id'] as String,
  label: json['label'] as String?,
  color: json['color'] as String?,
  isDefault: json['isDefault'] as bool? ?? false,
);

Map<String, dynamic> _$$LeadStatusOptionImplToJson(
  _$LeadStatusOptionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'color': instance.color,
  'isDefault': instance.isDefault,
};
