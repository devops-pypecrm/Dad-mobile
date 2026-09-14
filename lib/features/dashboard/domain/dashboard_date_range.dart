import 'package:intl/intl.dart';

/// Mirrors the preset subset Dad-frontend/src/pages/DashboardV2.tsx passes to
/// its `DateRangeDropdown` (`presets={['allTime', 'thisMonth', 'lastMonth', 'custom']}`)
/// — the web dashboard's actual current filter, not the older single
/// YYYY-MM month picker `Dashboard.tsx` (now `/old-dashboard`) used, which
/// this replaces on mobile.
enum DashboardRangePeriod { allTime, thisMonth, lastMonth, custom }

/// [startDate]/[endDate] are null only for [DashboardRangePeriod.allTime] —
/// every other period always carries both, exactly like
/// `DateRangeDropdown.tsx`'s `resolvePreset`.
class DashboardDateRange {
  const DashboardDateRange({required this.period, this.startDate, this.endDate});

  final DashboardRangePeriod period;
  final DateTime? startDate;
  final DateTime? endDate;

  factory DashboardDateRange.allTime() => const DashboardDateRange(period: DashboardRangePeriod.allTime);

  /// 1st of the current month through today — matches `resolvePreset("thisMonth")`
  /// (NOT the whole calendar month; stops at "now" so it never claims data
  /// from days that haven't happened yet).
  factory DashboardDateRange.thisMonth() {
    final now = DateTime.now();
    return DashboardDateRange(
      period: DashboardRangePeriod.thisMonth,
      startDate: DateTime(now.year, now.month, 1),
      endDate: now,
    );
  }

  /// The full previous calendar month — matches `resolvePreset("lastMonth")`.
  factory DashboardDateRange.lastMonth() {
    final now = DateTime.now();
    return DashboardDateRange(
      period: DashboardRangePeriod.lastMonth,
      startDate: DateTime(now.year, now.month - 1, 1),
      endDate: DateTime(now.year, now.month, 0), // day 0 = last day of previous month
    );
  }

  factory DashboardDateRange.custom(DateTime start, DateTime end) =>
      DashboardDateRange(period: DashboardRangePeriod.custom, startDate: start, endDate: end);

  /// `YYYY-MM-DD`, what the backend's `getDateFilter` (analyticsController.ts)
  /// expects for `startDate`/`endDate` query params.
  static final _apiFormat = DateFormat('yyyy-MM-dd');
  String? get apiStartDate => startDate == null ? null : _apiFormat.format(startDate!);
  String? get apiEndDate => endDate == null ? null : _apiFormat.format(endDate!);

  static final _labelFormat = DateFormat('MMM d');
  static final _labelFormatWithYear = DateFormat('MMM d, y');

  /// Matches `getDateRangeLabel` in DateRangeDropdown.tsx.
  String get label {
    switch (period) {
      case DashboardRangePeriod.allTime:
        return 'All Time';
      case DashboardRangePeriod.thisMonth:
        return 'This Month';
      case DashboardRangePeriod.lastMonth:
        return 'Last Month';
      case DashboardRangePeriod.custom:
        final s = startDate!, e = endDate!;
        final sameYear = s.year == e.year && e.year == DateTime.now().year;
        final format = sameYear ? _labelFormat : _labelFormatWithYear;
        return '${format.format(s)} - ${format.format(e)}';
    }
  }
}
