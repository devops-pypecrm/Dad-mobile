import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/two_column_grid.dart';
import '../../../auth/providers/session_provider.dart';
// Field Force / Check-in module: temporarily hidden from the dashboard,
// see the commented-out usages below. Route (`/checkins`) and the
// underlying feature are untouched — only these dashboard entry points
// are disabled for now.
// import '../../../checkins/providers/checkins_feed_provider.dart';
import '../../../followups/providers/my_day_provider.dart';
import '../../../notifications/providers/push_notifications_controller.dart';
import '../../../reports/providers/reports_providers.dart';
import '../../../targets/presentation/widgets/daily_motivation_sheet.dart';
import '../../../targets/providers/daily_achievement_controller.dart';
import '../../providers/dashboard_provider.dart';
import '../widgets/branch_month_filter.dart';
import '../widgets/greeting_card.dart';
import '../widgets/lead_source_chart.dart';
import '../widgets/quick_report_tile.dart';
import '../widgets/stat_tile.dart';
import '../widgets/target_progress_card.dart';

const _monthNames = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

/// Brand purple, matching the nav bar/login button/greeting card — used here
/// instead of `theme.colorScheme.primary` (a Material3-seeded blue, not this
/// brand color) so the Today card and Exp. Revenue tile read as on-brand
/// rather than an accidental off-shade.
const _brandPurple = Color(0xFF5B21B6);

/// The primary landing screen. Layout mirrors
/// Dad-frontend/src/pages/Dashboard.tsx: a branch+month filter row driving
/// the same 6 Performance Overview tiles (Exp. Revenue, Pipeline,
/// Follow-ups, Won, Lost, Revenue — Pipeline is deliberately the *count*
/// of active opportunities, not a value sum, matching `stats.activeOpportunities`
/// on web) plus the Lead Sources donut, both re-fetched on branch/month
/// change exactly like the web app's TanStack Query keys.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Side-effect watch: starts FCM permission request + device-token
    // registration once the user reaches the authenticated area. Ignored
    // here — permission denial is a normal, silent outcome, not an error
    // worth surfacing on the dashboard.
    ref.watch(pushNotificationsControllerProvider);

    // One-shot: shows the daily motivation sheet the first time this build
    // learns the backend wants to (see SALES_TARGET_ANALYSIS.MD). Only
    // fires on an actual state transition, not every rebuild.
    ref.listen(dailyAchievementControllerProvider, (previous, next) {
      final data = next.valueOrNull;
      if (data != null && data.showNotification && data.target != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          showModalBottomSheet(
            context: context,
            builder: (_) => DailyMotivationSheet(target: data.target!),
          ).then((_) => ref.read(dailyAchievementControllerProvider.notifier).acknowledge());
        });
      }
    });

    final summaryAsync = ref.watch(dashboardSummaryProvider);
    final forecastAsync = ref.watch(dashboardForecastProvider);
    final myDayAsync = ref.watch(myDayProvider);
    final leadSourcesAsync = ref.watch(leadSourcesProvider);
    final salesBookAsync = ref.watch(salesBookThisMonthProvider);
    // final checkInsAsync = ref.watch(checkInsFeedProvider); // Field Force hidden for now
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final selectedMonth = ref.watch(dashboardMonthProvider);
    final selectedBranchId = ref.watch(dashboardBranchProvider);
    final branches = ref.watch(dashboardBranchesProvider).valueOrNull ?? const [];
    final theme = Theme.of(context);
    final currency = session?.organisation.currency;

    String monthLabel() {
      if (selectedMonth == null) return 'All Time';
      final parts = selectedMonth.split('-');
      return '${_monthNames[int.parse(parts[1]) - 1]} ${parts[0]}';
    }

    String branchLabel() {
      if (selectedBranchId == null) return 'All Branches';
      final match = branches.where((b) => b.id == selectedBranchId);
      return match.isEmpty ? 'All Branches' : match.first.name;
    }

    Future<void> handleRefresh() async {
      await Future.wait([
        ref.refresh(dashboardSummaryProvider.future),
        ref.refresh(dashboardForecastProvider.future),
        ref.refresh(leadSourcesProvider.future),
        ref.refresh(salesBookThisMonthProvider.future),
        ref.read(myDayProvider.notifier).refresh(),
        // ref.read(checkInsFeedProvider.notifier).refresh(), // Field Force hidden for now
      ]);
    }

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Dashboard'),
      // Check-in module hidden for now.
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => context.push('/checkins/new'),
      //   icon: const Icon(Icons.add_location_alt_outlined),
      //   label: const Text('Check In'),
      // ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          // Extra bottom padding: the bottom-nav shell (AppShell) uses
          // `extendBody: true` + a transparent curved bar so scrolled
          // content shows through its notch — but that also means THIS
          // screen's own Scaffold body has no awareness of the floating
          // bar's ~75px height at all, so without this the last card
          // (Lead Sources) scrolls out from under the bar rather than
          // stopping above it.
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          children: [
            // --- Header: greeting + role + win rate --------------------
            GreetingCard(session: session, summaryAsync: summaryAsync),
            const SizedBox(height: 12),

            // --- Branch + month filter, matching Dashboard.tsx:206-250 ---
            const BranchMonthFilter(),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: () => context.push(AppRoutes.leads),
                style: FilledButton.styleFrom(backgroundColor: _brandPurple, foregroundColor: Colors.white),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add Lead'),
              ),
            ),
            const SizedBox(height: 24),

            Text('Today', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            myDayAsync.when(
              data: (page) {
                final pendingToday = page.counts.today + page.counts.overdue;
                return Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: _brandPurple.withValues(alpha: 0.12),
                      child: Icon(Icons.checklist, color: _brandPurple),
                    ),
                    title: Text(
                      '$pendingToday follow-up${pendingToday == 1 ? '' : 's'} need attention',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${page.counts.overdue} overdue · ${page.counts.today} due today'),
                    trailing: CircleAvatar(
                      radius: 16,
                      backgroundColor: _brandPurple.withValues(alpha: 0.12),
                      child: Icon(Icons.chevron_right, color: _brandPurple, size: 20),
                    ),
                    onTap: () => context.push('/followups'),
                  ),
                );
              },
              loading: () => Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: LinearProgressIndicator(),
                ),
              ),
              error: (error, stack) => Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Icon(Icons.error_outline, color: theme.colorScheme.error),
                  title: const Text("Couldn't load today's follow-ups"),
                  subtitle: Text(error.toString(), maxLines: 2, overflow: TextOverflow.ellipsis),
                  trailing: IconButton(
                    icon: const Icon(Icons.refresh),
                    tooltip: 'Retry',
                    onPressed: () => ref.read(myDayProvider.notifier).refresh(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            summaryAsync.when(
              data: (summary) => TargetProgressCard(target: summary.currentTarget),
              loading: () => const Card(
                margin: EdgeInsets.zero,
                child: Padding(padding: EdgeInsets.all(16), child: LinearProgressIndicator()),
              ),
              error: (error, stack) => Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  leading: Icon(Icons.error_outline, color: theme.colorScheme.error),
                  title: const Text("Couldn't load target progress"),
                  trailing: IconButton(
                    icon: const Icon(Icons.refresh),
                    tooltip: 'Retry',
                    onPressed: () => ref.invalidate(dashboardSummaryProvider),
                  ),
                ),
              ),
            ),

            // --- Performance Overview -----------------------------------
            // Same 6 tiles, same fields, as Dad-frontend's Quick Stats Row
            // (Dashboard.tsx:290-370): Exp. Revenue (forecast.totalPipeline),
            // Pipeline (activeOpportunities COUNT, not a value sum), Follow-
            // ups, Won, Lost Deals, Revenue (revenueThisMonth).
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Performance Overview', style: theme.textTheme.titleLarge),
                Text(
                  '${monthLabel()} · ${branchLabel()}',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 8),
            summaryAsync.when(
              data: (summary) {
                final stats = summary.stats;
                return TwoColumnGrid(
                  children: [
                    StatTile(
                      label: 'Exp. Revenue',
                      value: forecastAsync.valueOrNull != null
                          ? CurrencyFormatter.compact(forecastAsync.valueOrNull!.totalPipeline, currency)
                          : '—',
                      icon: Icons.trending_up,
                      color: _brandPurple,
                      onTap: () => context.push(AppRoutes.opportunities),
                    ),
                    StatTile(
                      label: 'Pipeline',
                      value: '${stats.activeOpportunities}',
                      icon: Icons.check_circle_outline,
                      color: const Color(0xFF6366F1),
                      onTap: () => context.push(AppRoutes.opportunities),
                    ),
                    StatTile(
                      label: 'Follow-ups',
                      value: '${stats.pendingFollowUps}',
                      icon: Icons.schedule,
                      color: const Color(0xFFF43F5E),
                      onTap: () => context.push('/followups'),
                    ),
                    StatTile(
                      label: 'Won',
                      value: '${stats.opportunities?.won ?? 0}',
                      icon: Icons.emoji_events_outlined,
                      color: const Color(0xFF22C55E),
                      onTap: () => context.push(AppRoutes.opportunities),
                    ),
                    StatTile(
                      label: 'Lost Deals',
                      value: '${stats.opportunities?.lost ?? 0}',
                      icon: Icons.error_outline,
                      color: const Color(0xFFEF4444),
                      onTap: () => context.push(AppRoutes.opportunities),
                    ),
                    StatTile(
                      label: 'Revenue',
                      value: CurrencyFormatter.compact(stats.revenueThisMonth, currency),
                      icon: Icons.trending_up,
                      color: const Color(0xFFF59E0B),
                      onTap: () => context.push(AppRoutes.payments),
                    ),
                  ],
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.invalidate(dashboardSummaryProvider),
              ),
            ),

            // --- Quick Reports -------------------------------------------
            const SizedBox(height: 24),
            Text('Quick Reports', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            TwoColumnGrid(
              children: [
                QuickReportTile(
                  title: 'Sales Book',
                  subtitle: 'Transaction logs & history',
                  icon: Icons.menu_book_outlined,
                  color: const Color(0xFF3B82F6),
                  badge: salesBookAsync.valueOrNull != null
                      ? '${salesBookAsync.valueOrNull!.summary.totalDeals} entries'
                      : null,
                  onTap: () => context.push(AppRoutes.reports),
                ),
                QuickReportTile(
                  title: 'User Sales',
                  subtitle: 'Performance leaderboard',
                  icon: Icons.emoji_events_outlined,
                  color: const Color(0xFFF59E0B),
                  badge: 'Top 5',
                  onTap: () => context.push(AppRoutes.topPerformers),
                ),
                // Field Force tile hidden for now.
                // QuickReportTile(
                //   title: 'Field Force',
                //   subtitle: 'Agent tracking & activity',
                //   icon: Icons.location_on_outlined,
                //   color: const Color(0xFF06B6D4),
                //   badge: checkInsAsync.valueOrNull != null
                //       ? '${checkInsAsync.valueOrNull!.map((c) => c.user?.firstName).toSet().length} active'
                //       : null,
                //   onTap: () => context.push(AppRoutes.checkins),
                // ),
              ],
            ),

            // --- Lead Sources ---------------------------------------------
            const SizedBox(height: 24),
            Text('Lead Sources', style: theme.textTheme.titleLarge),
            Text(
              'Acquisition channel distribution',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: leadSourcesAsync.when(
                  data: (stats) => LeadSourceChart(stats: stats),
                  loading: () => const SizedBox(
                    height: 140,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, stack) => ErrorStateView(
                    error: error,
                    onRetry: () => ref.invalidate(leadSourcesProvider),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
