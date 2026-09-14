import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/role_utils.dart';
import '../../auth/providers/session_provider.dart';
import '../../reports/domain/top_performer.dart';
import '../data/dashboard_repository.dart';
import '../domain/branch.dart';
import '../domain/dashboard_date_range.dart';
import '../domain/dashboard_summary.dart';
import '../domain/lead_health.dart';
import '../domain/lead_source_stat.dart';
import '../domain/sales_forecast.dart';
import '../domain/sales_target.dart';

part 'dashboard_provider.g.dart';

/// Drives the Performance Overview grid — mirrors the *current* web
/// dashboard (Dad-frontend/src/pages/DashboardV2.tsx's `DateRangeDropdown`
/// with `presets={['allTime', 'thisMonth', 'lastMonth', 'custom']}`), not
/// the older single-month picker `Dashboard.tsx` (now `/old-dashboard`)
/// used. Defaults to "This Month", matching `getDefaultDateRange()` there.
final dashboardDateRangeProvider = StateProvider<DashboardDateRange>(
  (ref) => DashboardDateRange.thisMonth(),
);

/// Selected branch id, or null for "All Branches" — mirrors
/// `selectedBranchId` in Dashboard.tsx (never sent to the backend as a
/// literal `"all"` string, just omitted).
final dashboardBranchProvider = StateProvider<String?>((ref) => null);

/// Branch list for the filter dropdown. Mirrors `Dashboard.tsx`'s
/// `fetchBranches`: admins/super_admins get the full org branch list
/// (`GET /api/branches`); everyone else gets only the branches they
/// manage (`GET /api/users/my-team`'s `managedBranches`, which may be
/// empty). An empty result means the dropdown itself should be hidden,
/// same as the web app's `branches.length > 0` gate.
@riverpod
Future<List<Branch>> dashboardBranches(AutoDisposeFutureProviderRef<List<Branch>> ref) async {
  final session = ref.watch(sessionControllerProvider).valueOrNull;
  if (session == null) return const [];
  final repository = ref.watch(dashboardRepositoryProvider);
  return isAdminRole(session.role) ? repository.getBranches() : repository.getManagedBranches();
}

@riverpod
Future<DashboardSummary> dashboardSummary(AutoDisposeFutureProviderRef<DashboardSummary> ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  final range = ref.watch(dashboardDateRangeProvider);
  final branchId = ref.watch(dashboardBranchProvider);

  final stats = await repository.getStats(
    startDate: range.apiStartDate,
    endDate: range.apiEndDate,
    branchId: branchId,
  );
  final targets = await repository.getMyTargets();

  SalesTarget? currentTarget;
  for (final target in targets) {
    if (target.isCurrent) {
      currentTarget = target;
      break;
    }
  }
  currentTarget ??= targets.isNotEmpty ? targets.first : null;

  return DashboardSummary(stats: stats, currentTarget: currentTarget);
}

@riverpod
Future<SalesForecast> dashboardForecast(AutoDisposeFutureProviderRef<SalesForecast> ref) {
  final range = ref.watch(dashboardDateRangeProvider);
  final branchId = ref.watch(dashboardBranchProvider);
  return ref
      .watch(dashboardRepositoryProvider)
      .getForecast(startDate: range.apiStartDate, endDate: range.apiEndDate, branchId: branchId);
}

/// Backs the "Unattended Leads"/"No Activity Leads" tiles — watching the
/// same date-range/branch providers as [dashboardForecast] is what makes
/// those tiles automatically respect the dashboard's existing filter, no
/// separate plumbing needed.
@riverpod
Future<LeadHealth> dashboardLeadHealth(AutoDisposeFutureProviderRef<LeadHealth> ref) {
  final range = ref.watch(dashboardDateRangeProvider);
  final branchId = ref.watch(dashboardBranchProvider);
  return ref
      .watch(dashboardRepositoryProvider)
      .getLeadHealth(startDate: range.apiStartDate, endDate: range.apiEndDate, branchId: branchId);
}

@riverpod
Future<List<LeadSourceStat>> leadSources(AutoDisposeFutureProviderRef<List<LeadSourceStat>> ref) {
  final branchId = ref.watch(dashboardBranchProvider);
  return ref.watch(dashboardRepositoryProvider).getLeadSources(branchId: branchId);
}

@riverpod
Future<List<TopPerformer>> topPerformers(AutoDisposeFutureProviderRef<List<TopPerformer>> ref) {
  final branchId = ref.watch(dashboardBranchProvider);
  return ref.watch(dashboardRepositoryProvider).getTopPerformers(branchId: branchId);
}
