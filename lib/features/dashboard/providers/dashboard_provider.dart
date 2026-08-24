import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/role_utils.dart';
import '../../auth/providers/session_provider.dart';
import '../../reports/domain/top_performer.dart';
import '../data/dashboard_repository.dart';
import '../domain/branch.dart';
import '../domain/dashboard_summary.dart';
import '../domain/lead_source_stat.dart';
import '../domain/sales_forecast.dart';
import '../domain/sales_target.dart';

part 'dashboard_provider.g.dart';

/// `YYYY-MM`, defaults to the current month. Drives the Performance
/// Overview grid; null means "all-time" (backend's default when the
/// `month` query param is omitted) — mirrors `selectedMonth` in
/// Dad-frontend/src/pages/Dashboard.tsx, where `"all"` in the UI maps to
/// an omitted param, same as here.
final dashboardMonthProvider = StateProvider<String?>(
  (ref) {
    final now = DateTime.now();
    return '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}';
  },
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
  final month = ref.watch(dashboardMonthProvider);
  final branchId = ref.watch(dashboardBranchProvider);

  final stats = await repository.getStats(month: month, branchId: branchId);
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
  final month = ref.watch(dashboardMonthProvider);
  final branchId = ref.watch(dashboardBranchProvider);
  return ref.watch(dashboardRepositoryProvider).getForecast(month: month, branchId: branchId);
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
