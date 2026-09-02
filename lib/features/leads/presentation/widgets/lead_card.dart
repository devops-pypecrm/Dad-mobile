import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/hex_color.dart';
import '../../../../core/utils/url_launch_helper.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/lead.dart';

const _brandColor = Color(0xFF578732);

/// Short "2h ago"/"1d ago" form — distinct from `formatRelativeDate`
/// (which does day-level "Today"/"Yesterday"/"N days ago" for the search
/// screen); this card needs hour-level granularity for freshly-added leads.
String _shortTimeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inMinutes < 1) return 'just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  return '${diff.inDays}d ago';
}

/// One lead row: a status-colored left accent bar, a status pill + optional
/// re-enquiry marker, name, assignee/campaign block, call/WhatsApp quick
/// actions, and a bottom "Added"/"Last contacted" pill — all colored off
/// the same `statusColor` so a warm (orange/red) status like "Not
/// Responding" reads as a visibly tinted card while a cool one (purple)
/// stays close to plain white, without hardcoding which statuses are
/// "urgent" (statuses are a free, org-configurable string, see
/// Dad-backend/CLAUDE.md's gotchas — this card has no business trying to
/// know which ones mean "pay attention").
class LeadCard extends ConsumerWidget {
  const LeadCard({super.key, required this.lead, required this.onTap});

  final Lead lead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final leadStatuses = ref
        .watch(sessionControllerProvider)
        .valueOrNull
        ?.organisation
        .leadStatuses;

    String statusLabel = lead.status;
    Color statusColor = hexToColor(null);
    final match = leadStatuses?.where((o) => o.id == lead.status);
    if (match != null && match.isNotEmpty) {
      statusLabel = match.first.label ?? lead.status;
      statusColor = hexToColor(match.first.color);
    }

    final isFreshLead = lead.status.toLowerCase() == 'new';
    final timeAgoLabel = isFreshLead ? 'Added' : 'Last contacted';
    final timeAgoDate = isFreshLead
        ? lead.createdAt
        : (lead.updatedAt ?? lead.createdAt);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          // `CrossAxisAlignment.stretch` needs a bounded height to stretch
          // the colored left bar to — everything above this (Material,
          // InkWell, the outer Container) sizes itself to content inside a
          // ListView, so without IntrinsicHeight the incoming constraint is
          // unbounded and this Row throws at layout time (a runtime crash,
          // not something `flutter analyze` catches — it broke rendering
          // for every card, not just this one, hence the whole list going
          // blank rather than one bad row).
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 4, color: statusColor),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                statusLabel,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: statusColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Spacer(),
                            if (lead.isReEnquiry)
                              Text(
                                'RE-ENQUIRY ×${lead.reEnquiryCount}',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: const Color(0xFFEA580C),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (lead.isHotLead)
                              const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.local_fire_department,
                                  color: Color(0xFFEA580C),
                                  size: 18,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          lead.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        size: 15,
                                        color:
                                            theme.colorScheme.onSurfaceVariant,
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          lead.assignedTo != null
                                              ? lead.assignedTo!.firstName
                                              : 'Unassigned',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (lead.campaignName != null &&
                                      lead.campaignName!.isNotEmpty) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.campaign_outlined,
                                          size: 15,
                                          color: theme
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            lead.campaignName!,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  color: theme
                                                      .colorScheme
                                                      .onSurfaceVariant,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            _RoundIconButton(
                              icon: const Icon(
                                Icons.call,
                                size: 18,
                                color: _brandColor,
                              ),
                              background: _brandColor.withValues(alpha: 0.12),
                              onTap: () => launchUriWithFeedback(
                                context,
                                Uri(scheme: 'tel', path: lead.phone),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 1,
                              height: 24,
                              color: theme.colorScheme.outlineVariant,
                            ),
                            const SizedBox(width: 8),
                            _RoundIconButton(
                              // `FontAwesomeIcons.whatsapp` is an `FaIconData`,
                              // not a plain `IconData` (font_awesome_flutter
                              // 11+ deliberately stopped implementing
                              // `IconData` — see pubspec.yaml's comment), so it
                              // needs the dedicated `FaIcon` widget rather than
                              // a plain `Icon`.
                              icon: const FaIcon(
                                FontAwesomeIcons.whatsapp,
                                size: 18,
                                color: Colors.white,
                              ),
                              background: const Color(0xFF25D366),
                              onTap: () => launchUriWithFeedback(
                                context,
                                Uri.parse(
                                  'https://wa.me/${lead.phone.replaceAll(RegExp(r'[^0-9]'), '')}',
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.chevron_right,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                        if (timeAgoDate != null) ...[
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 13,
                                  color: statusColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '$timeAgoLabel ${_shortTimeAgo(timeAgoDate)}',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: statusColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.background,
    required this.onTap,
  });

  /// A pre-built `Icon`/`FaIcon` (size/color already set by the caller) —
  /// not an `IconData`, since `FontAwesomeIcons.whatsapp` (an `FaIconData`
  /// in font_awesome_flutter 11+) isn't one and needs its own `FaIcon`
  /// widget rather than the plain Material `Icon`.
  final Widget icon;
  final Color background;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Center(child: icon),
      ),
    );
  }
}
