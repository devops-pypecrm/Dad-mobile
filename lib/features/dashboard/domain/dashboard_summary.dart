import 'package:freezed_annotation/freezed_annotation.dart';

import 'dashboard_stats.dart';
import 'sales_target.dart';

part 'dashboard_summary.freezed.dart';

/// Pure client-side bundling of two independent, verbatim API responses so
/// the Dashboard screen can load them together — NOT a computed/aggregated
/// metric. `stats` and `currentTarget` each come straight from their own
/// endpoint untouched (see [DashboardRepository]).
@freezed
class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required DashboardStats stats,
    SalesTarget? currentTarget,
  }) = _DashboardSummary;
}
