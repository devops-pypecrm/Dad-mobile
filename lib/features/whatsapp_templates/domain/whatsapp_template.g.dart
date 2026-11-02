// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whatsapp_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WhatsAppTemplateImpl _$$WhatsAppTemplateImplFromJson(
  Map<String, dynamic> json,
) => _$WhatsAppTemplateImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$WhatsAppTemplateImplToJson(
  _$WhatsAppTemplateImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'createdAt': instance.createdAt.toIso8601String(),
};
