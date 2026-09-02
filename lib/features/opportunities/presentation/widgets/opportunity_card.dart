import 'package:flutter/material.dart';

import '../../domain/opportunity.dart';

/// Icon + color pairing per pipeline stage — trophy/green for a win, a
/// "loss" icon/red for `closed_lost`, an in-progress icon/amber for
/// everything still open (prospecting through negotiation — the same
/// bucket the Deal Stage filter calls "Expected").
({IconData icon, Color fg, Color bg}) _stageVisual(String stage) {
  switch (stage) {
    case 'closed_won':
      const fg = Color(0xFF16A34A);
      return (icon: Icons.emoji_events_rounded, fg: fg, bg: fg.withValues(alpha: 0.12));
    case 'closed_lost':
      const fg = Color(0xFFDC2626);
      return (icon: Icons.cancel_rounded, fg: fg, bg: fg.withValues(alpha: 0.12));
    default:
      const fg = Color(0xFFD97706);
      return (icon: Icons.hourglass_top_rounded, fg: fg, bg: fg.withValues(alpha: 0.12));
  }
}

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({super.key, required this.opportunity, required this.onTap});

  final Opportunity opportunity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final visual = _stageVisual(opportunity.stage);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Stage-colored left stripe — the at-a-glance won/lost/open
              // signal the reference design uses instead of a plain chip.
              Container(width: 4, color: visual.fg),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: visual.bg,
                            child: Icon(visual.icon, color: visual.fg, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  opportunity.name,
                                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (opportunity.account != null)
                                  Text(
                                    opportunity.account!.name,
                                    style: theme.textTheme.bodyMedium
                                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: visual.bg,
                            child: Icon(Icons.chevron_right, color: visual.fg, size: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: visual.bg, borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(color: visual.fg, shape: BoxShape.circle),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  opportunity.stage,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: visual.fg,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            opportunity.amount.toStringAsFixed(0),
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: visual.fg),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
