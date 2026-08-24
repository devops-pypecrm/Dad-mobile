import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_book_summary.freezed.dart';
part 'sales_book_summary.g.dart';

/// `GET /api/reports/sales-book` response — modeling only `period` and
/// `summary` for the mobile glanceable card; the line-item `sales[]` array
/// is intentionally left unparsed (per .claude/skills/ui.md: summary cards
/// over dense tables — the web portal is where you'd want the full list).
@freezed
class SalesBookSummary with _$SalesBookSummary {
  const factory SalesBookSummary({
    required String period,
    required SalesBookTotals summary,
  }) = _SalesBookSummary;

  factory SalesBookSummary.fromJson(Map<String, dynamic> json) => _$SalesBookSummaryFromJson(json);
}

@freezed
class SalesBookTotals with _$SalesBookTotals {
  const factory SalesBookTotals({
    @Default(0) int totalDeals,
    @Default(0) double totalValue,
    @Default(0) double averageDealSize,
  }) = _SalesBookTotals;

  factory SalesBookTotals.fromJson(Map<String, dynamic> json) => _$SalesBookTotalsFromJson(json);
}
