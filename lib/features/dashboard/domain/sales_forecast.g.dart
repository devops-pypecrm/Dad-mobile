// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesForecastImpl _$$SalesForecastImplFromJson(Map<String, dynamic> json) =>
    _$SalesForecastImpl(
      weightedForecast: (json['weightedForecast'] as num?)?.toDouble() ?? 0,
      totalPipeline: (json['totalPipeline'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$SalesForecastImplToJson(_$SalesForecastImpl instance) =>
    <String, dynamic>{
      'weightedForecast': instance.weightedForecast,
      'totalPipeline': instance.totalPipeline,
    };
