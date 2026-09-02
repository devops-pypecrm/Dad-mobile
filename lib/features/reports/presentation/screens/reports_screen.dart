import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/two_column_grid.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/user_performance.dart';
import '../../providers/reports_providers.dart';
import '../widgets/lead_funnel_chart.dart';

const _managerRoles = {
  'manager',
  'admin',
  'super_admin',
  'branch_manager',
  'org_admin',
};
const _brandColor = Color(0xFF578732);

Widget _divider() =>
    Container(width: 1, height: 44, color: Colors.grey.withValues(alpha: 0.2));

/// Section title + a short brand-purple underline accent, replacing a plain
/// `Text(style: titleLarge)` throughout this screen.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Container(
          width: 28,
          height: 3,
          decoration: BoxDecoration(
            color: _brandColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

/// A faint decorative wavy line tucked into a stat card's corner — purely
/// cosmetic, no data behind it.
class _Sparkline extends StatelessWidget {
  const _Sparkline({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 26,
      child: CustomPaint(painter: _SparklinePainter(color)),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(0, size.height * 0.65)
      ..cubicTo(
        size.width * 0.22,
        size.height * 0.1, //
        size.width * 0.32,
        size.height * 0.95,
        size.width * 0.52,
        size.height * 0.4,
      )
      ..cubicTo(
        size.width * 0.68,
        size.height * 0.0, //
        size.width * 0.82,
        size.height * 0.85,
        size.width,
        size.height * 0.3,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) =>
      oldDelegate.color != color;
}

/// A circular progress ring — a light full-circle track plus a colored arc
/// for `progress` (0..1), starting at 12 o'clock and sweeping clockwise.
/// Used both as the real conversion-rate indicator next to each team
/// member's percentage, and (with a small fixed `progress`) as a purely
/// decorative flourish around the rank avatar.
class _ArcRing extends StatelessWidget {
  const _ArcRing({
    required this.size,
    required this.strokeWidth,
    required this.progress,
    required this.color,
  });

  final double size;
  final double strokeWidth;
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ArcRingPainter(
          progress: progress,
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _ArcRingPainter extends CustomPainter {
  _ArcRingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - strokeWidth) / 2;
    final trackPaint = Paint()
      ..color = color.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, trackPaint);

    final arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcRingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role =
        ref.watch(sessionControllerProvider).valueOrNull?.role.toLowerCase() ??
        '';
    final isManagerRole = _managerRoles.any(role.contains);

    // A role-name check alone misses a plain "sales_rep" who nonetheless has
    // people reporting to them in the hierarchy (a team lead in practice,
    // just not in title) — the backend's `getUserPerformance()` already
    // returns that person's subordinates via `getVisibleUserIds`'s
    // reportsTo-chain walk regardless of role string, so the mobile side
    // only needs to actually ask and see whether more than just "me" comes
    // back, rather than gating the whole Team tab on role name up front.
    final teamAsync = ref.watch(teamPerformanceProvider);
    final hasVisibleTeam = (teamAsync.valueOrNull?.length ?? 0) > 1;
    final showTeamTab = isManagerRole || hasVisibleTeam;

    return DefaultTabController(
      length: showTeamTab ? 2 : 1,
      child: Scaffold(
        appBar: const GlobalAppBar(title: 'Reports'),
        // The Me/Team tab bar used to live in the AppBar's `bottom` slot;
        // now a plain section at the top of the body, since the AppBar is
        // shared across every tab and carries no screen-specific controls.
        body: showTeamTab
            ? const Column(
                children: [
                  Material(
                    child: TabBar(
                      tabs: [
                        Tab(text: 'Me'),
                        Tab(text: 'Team'),
                      ],
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: _brandColor,
                      indicatorWeight: 3,
                      labelColor: _brandColor,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [_MyPerformanceTab(), _TeamTab()],
                    ),
                  ),
                ],
              )
            : const _MyPerformanceTab(),
      ),
    );
  }
}

class _MyPerformanceTab extends ConsumerWidget {
  const _MyPerformanceTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUserId = ref.watch(sessionControllerProvider).valueOrNull?.id;
    final performanceAsync = ref.watch(myPerformanceProvider);
    final funnelAsync = ref.watch(myLeadsFunnelProvider);
    final salesBookAsync = ref.watch(salesBookThisMonthProvider);

    return RefreshIndicator(
      onRefresh: () => Future.wait([
        ref.refresh(myPerformanceProvider.future),
        ref.refresh(myLeadsFunnelProvider.future),
        ref.refresh(salesBookThisMonthProvider.future),
      ]),
      child: ListView(
        // Bottom padding clears the floating bottom nav bar (see AppShell —
        // its ~75px bar + 8px margin isn't accounted for by this screen's
        // own Scaffold), same value Dashboard's main list uses.
        // See Leads' `_LoadMoreFooter` comment — a flat 100 falls short of
        // AppShell's floating nav bar once its own safety floor pushes it
        // taller on affected OEM skins; this tracks the bar's real height.
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          math.max(MediaQuery.paddingOf(context).bottom + 12, 95),
        ),
        children: [
          const _SectionHeader('My Performance'),
          const SizedBox(height: 12),
          performanceAsync.when(
            data: (entries) {
              // The backend's `userId` query param on getUserPerformance is
              // not applied server-side — it always returns every visible
              // user (self + subordinates) in unspecified order, so picking
              // `.first` risked showing a subordinate's stats as "mine".
              // Find the caller's own entry explicitly instead.
              final own = entries.where((e) => e.user.id == myUserId);
              final metrics = own.isEmpty ? null : own.first.metrics;
              if (metrics == null) {
                return const EmptyStateView(
                  message: 'No performance data yet.',
                  icon: Icons.insights_outlined,
                );
              }
              return TwoColumnGrid(
                children: [
                  _StatCard(
                    label: 'Leads Assigned',
                    value: '${metrics.leadsAssigned}',
                    icon: Icons.person_outline,
                    color: _brandColor,
                  ),
                  _StatCard(
                    label: 'Leads Converted',
                    value: '${metrics.leadsConverted}',
                    icon: Icons.trending_up,
                    color: const Color(0xFF16A34A),
                  ),
                  _StatCard(
                    label: 'Conversion Rate',
                    value: '${metrics.conversionRate.toStringAsFixed(1)}%',
                    icon: Icons.pie_chart_outline,
                    color: const Color(0xFFEA580C),
                  ),
                  _StatCard(
                    label: 'Calls Made',
                    value: '${metrics.callsMade}',
                    icon: Icons.call_outlined,
                    color: const Color(0xFF2563EB),
                  ),
                  _StatCard(
                    label: 'Meetings Held',
                    value: '${metrics.meetingsHeld}',
                    icon: Icons.calendar_today_outlined,
                    color: _brandColor,
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
              onRetry: () => ref.invalidate(myPerformanceProvider),
            ),
          ),
          const SizedBox(height: 24),
          const _SectionHeader('Lead Funnel'),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: funnelAsync.when(
              data: (summary) => LeadFunnelChart(
                byStage: summary.summary.byStage,
                total: summary.summary.total,
              ),
              loading: () => const SizedBox(
                height: 220,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(8),
                child: ErrorStateView(
                  error: error,
                  onRetry: () => ref.invalidate(myLeadsFunnelProvider),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const _SectionHeader('Sales Book (This Month)'),
          const SizedBox(height: 12),
          salesBookAsync.when(
            data: (summary) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: _SalesBookMetric(
                        icon: Icons.handshake_outlined,
                        label: 'Deals',
                        value: '${summary.summary.totalDeals}',
                      ),
                    ),
                    _divider(),
                    Expanded(
                      child: _SalesBookMetric(
                        icon: Icons.attach_money,
                        label: 'Total Value',
                        value: summary.summary.totalValue.toStringAsFixed(0),
                      ),
                    ),
                    _divider(),
                    Expanded(
                      child: _SalesBookMetric(
                        icon: Icons.bar_chart_outlined,
                        label: 'Avg Deal',
                        value: summary.summary.averageDealSize.toStringAsFixed(
                          0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => ErrorStateView(
              error: error,
              onRetry: () => ref.invalidate(salesBookThisMonthProvider),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamTab extends ConsumerWidget {
  const _TeamTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamAsync = ref.watch(teamPerformanceProvider);

    return teamAsync.when(
      data: (entries) {
        if (entries.isEmpty) {
          return const EmptyStateView(
            message: 'No team data found.',
            icon: Icons.groups_outlined,
          );
        }
        final sorted = [...entries]
          ..sort(
            (a, b) =>
                b.metrics.conversionRate.compareTo(a.metrics.conversionRate),
          );
        return RefreshIndicator(
          onRefresh: () => ref.refresh(teamPerformanceProvider.future),
          child: ListView(
            // Same bottom clearance as the Me tab above — see its comment.
            // See Leads' `_LoadMoreFooter` comment — a flat 100 falls short of
            // AppShell's floating nav bar once its own safety floor pushes it
            // taller on affected OEM skins; this tracks the bar's real height.
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              math.max(MediaQuery.paddingOf(context).bottom + 12, 95),
            ),
            children: [
              const _SectionHeader('Team Summary'),
              const SizedBox(height: 12),
              _TeamSummaryCard(entries: entries),
              const SizedBox(height: 24),
              const _SectionHeader('Team Members'),
              const SizedBox(height: 12),
              for (var i = 0; i < sorted.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _TeamPerformanceTile(rank: i + 1, entry: sorted[i]),
                ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorStateView(
        error: error,
        onRetry: () => ref.invalidate(teamPerformanceProvider),
      ),
    );
  }
}

/// Aggregate totals across every visible team member (self included, same
/// set the list below ranks) — leads/calls/meetings summed, plus an
/// overall conversion rate computed from the summed counts rather than
/// averaging each member's own rate (avoids skewing toward whoever has the
/// fewest leads assigned).
class _TeamSummaryCard extends StatelessWidget {
  const _TeamSummaryCard({required this.entries});

  final List<PerformanceEntry> entries;

  @override
  Widget build(BuildContext context) {
    final totalAssigned = entries.fold(
      0,
      (sum, e) => sum + e.metrics.leadsAssigned,
    );
    final totalConverted = entries.fold(
      0,
      (sum, e) => sum + e.metrics.leadsConverted,
    );
    final totalCalls = entries.fold(0, (sum, e) => sum + e.metrics.callsMade);
    final totalMeetings = entries.fold(
      0,
      (sum, e) => sum + e.metrics.meetingsHeld,
    );
    final overallRate = totalAssigned > 0
        ? (totalConverted / totalAssigned) * 100
        : 0.0;

    return TwoColumnGrid(
      children: [
        _StatCard(
          label: 'Team Size',
          value: '${entries.length}',
          icon: Icons.groups_outlined,
          color: _brandColor,
        ),
        _StatCard(
          label: 'Leads Assigned',
          value: '$totalAssigned',
          icon: Icons.person_outline,
          color: _brandColor,
        ),
        _StatCard(
          label: 'Leads Converted',
          value: '$totalConverted',
          icon: Icons.trending_up,
          color: const Color(0xFF16A34A),
        ),
        _StatCard(
          label: 'Conversion Rate',
          value: '${overallRate.toStringAsFixed(1)}%',
          icon: Icons.pie_chart_outline,
          color: const Color(0xFFEA580C),
        ),
        _StatCard(
          label: 'Calls Made',
          value: '$totalCalls',
          icon: Icons.call_outlined,
          color: const Color(0xFF2563EB),
        ),
        _StatCard(
          label: 'Meetings Held',
          value: '$totalMeetings',
          icon: Icons.calendar_today_outlined,
          color: _brandColor,
        ),
      ],
    );
  }
}

class _TeamPerformanceTile extends StatelessWidget {
  const _TeamPerformanceTile({required this.rank, required this.entry});

  final int rank;
  final PerformanceEntry entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = entry.metrics;
    final progress = metrics.conversionRate / 100;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Purely decorative — a fixed flourish echoing the real
                  // percentage ring below, not itself data-bound.
                  const _ArcRing(
                    size: 52,
                    strokeWidth: 2.5,
                    progress: 0.22,
                    color: _brandColor,
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: _brandColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$rank',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: _brandColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  entry.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '${metrics.conversionRate.toStringAsFixed(0)}%',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: _brandColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              _ArcRing(
                size: 34,
                strokeWidth: 3,
                progress: progress,
                color: _brandColor,
              ),
            ],
          ),
          const Divider(height: 28),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  icon: Icons.person_outline,
                  color: _brandColor,
                  value: '${metrics.leadsAssigned}',
                  label: 'Assigned',
                ),
              ),
              Expanded(
                child: _MiniStat(
                  icon: Icons.trending_up,
                  color: const Color(0xFF16A34A),
                  value: '${metrics.leadsConverted}',
                  label: 'Converted',
                ),
              ),
              Expanded(
                child: _MiniStat(
                  icon: Icons.call_outlined,
                  color: const Color(0xFF2563EB),
                  value: '${metrics.callsMade}',
                  label: 'Calls',
                ),
              ),
              Expanded(
                child: _MiniStat(
                  icon: Icons.calendar_today_outlined,
                  color: const Color(0xFFEA580C),
                  value: '${metrics.meetingsHeld}',
                  label: 'Meetings',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(right: 10, bottom: 8, child: _Sparkline(color: color)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesBookMetric extends StatelessWidget {
  const _SalesBookMetric({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _brandColor.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: _brandColor, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: _brandColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        _Sparkline(color: _brandColor),
      ],
    );
  }
}
