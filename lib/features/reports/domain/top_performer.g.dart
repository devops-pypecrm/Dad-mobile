// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_performer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopPerformerImpl _$$TopPerformerImplFromJson(Map<String, dynamic> json) =>
    _$TopPerformerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      image: json['image'] as String?,
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble() ?? 0,
      dealsWon: (json['dealsWon'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TopPerformerImplToJson(_$TopPerformerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'totalRevenue': instance.totalRevenue,
      'dealsWon': instance.dealsWon,
    };
