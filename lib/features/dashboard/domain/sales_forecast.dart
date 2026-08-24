import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_forecast.freezed.dart';
part 'sales_forecast.g.dart';

/// `GET /api/analytics/forecast` response
/// (Dad-backend/src/controllers/analyticsController.ts:517-574). Backs the
/// Dashboard's "Exp. Revenue" tile on both web (`Dashboard.tsx:299`,
/// `forecast?.totalPipeline`) and here — note the backend currently sets
/// `weightedForecast` to the same value as `totalPipeline` (an existing
/// backend quirk, not something to silently "fix" client-side).
@freezed
class SalesForecast with _$SalesForecast {
  const factory SalesForecast({
    @Default(0) double weightedForecast,
    @Default(0) double totalPipeline,
  }) = _SalesForecast;

  factory SalesForecast.fromJson(Map<String, dynamic> json) => _$SalesForecastFromJson(json);
}
