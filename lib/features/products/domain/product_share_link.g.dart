// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_share_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductShareLinkImpl _$$ProductShareLinkImplFromJson(
  Map<String, dynamic> json,
) => _$ProductShareLinkImpl(
  url: json['url'] as String?,
  slug: json['slug'] as String?,
  views: (json['views'] as num?)?.toInt() ?? 0,
  youtubeUrl: json['youtubeUrl'] as String?,
  customTitle: json['customTitle'] as String?,
  customDescription: json['customDescription'] as String?,
);

Map<String, dynamic> _$$ProductShareLinkImplToJson(
  _$ProductShareLinkImpl instance,
) => <String, dynamic>{
  'url': instance.url,
  'slug': instance.slug,
  'views': instance.views,
  'youtubeUrl': instance.youtubeUrl,
  'customTitle': instance.customTitle,
  'customDescription': instance.customDescription,
};
