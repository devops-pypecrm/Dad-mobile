import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/domain/user_session.dart';
import '../../domain/dashboard_summary.dart';

const _brandPurple = Color(0xFF5B21B6);

String _greeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) return 'Good morning';
  if (hour < 17) return 'Good afternoon';
  return 'Good evening';
}

/// Win-rate tiers shown in the pill badge under the percentage. No
/// equivalent exists in Dad-frontend (it only ever renders the raw
/// percentage, see UserSales.tsx) — these thresholds/labels are a mobile-
/// only, purely cosmetic read of a number the backend already computed, not
/// business logic being duplicated client-side.
({String label, IconData icon}) _winRateTier(double winRate) {
  if (winRate >= 75) return (label: 'Excellent!', icon: Icons.trending_up);
  if (winRate >= 50) return (label: 'Good', icon: Icons.trending_up);
  if (winRate >= 25) return (label: 'Average', icon: Icons.trending_flat);
  return (label: 'Needs focus', icon: Icons.trending_down);
}

/// Dashboard landing header: greeting/name/role on the left, win rate +
/// qualitative badge on the right, over a solid brand-purple background
/// with a faint watermark of the app logo's ring mark in the corner.
class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key, required this.session, required this.summaryAsync});

  final UserSession? session;
  final AsyncValue<DashboardSummary> summaryAsync;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      // Card's default margin (EdgeInsets.all(4)) would otherwise inset this
      // 4px further than the non-Card content below it (filter pills, "Add
      // Lead" button) that shares the same ListView padding — this screen's
      // own SizedBox gaps already handle spacing between sections.
      margin: EdgeInsets.zero,
      color: _brandPurple,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
            right: -50,
            top: -60,
            child: Opacity(
              opacity: 0.1,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                child: Image.asset('assets/images/app_logo.png', width: 220, height: 220),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_greeting()} !!',
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
                      ),
                      Text(
                        session != null ? '${session!.firstName} ${session!.lastName}' : 'there',
                        style: theme.textTheme.titleLarge
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      if (session != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            session!.displayTitle,
                            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
                          ),
                        ),
                    ],
                  ),
                ),
                summaryAsync.when(
                  data: (summary) {
                    final tier = _winRateTier(summary.stats.winRate);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'WIN RATE',
                          style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, letterSpacing: 0.5),
                        ),
                        Text(
                          '${summary.stats.winRate.toStringAsFixed(1)}%',
                          style: theme.textTheme.headlineMedium
                              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(tier.icon, size: 14, color: _brandPurple),
                              const SizedBox(width: 4),
                              Text(
                                tier.label,
                                style: theme.textTheme.labelSmall
                                    ?.copyWith(color: _brandPurple, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white70),
                  ),
                  error: (_, _) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
