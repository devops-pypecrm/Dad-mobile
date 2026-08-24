import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/hex_color.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/lead.dart';

/// Same card language as `FollowUpCard` (Follow Ups tab): a colored top
/// accent bar for an attention-worthy state, a colored status chip, a
/// muted metadata box, and a compact action row — kept visually consistent
/// across the two list screens rather than each having its own ad hoc
/// `Card`+`Chip` styling.
class LeadCard extends ConsumerWidget {
  const LeadCard({super.key, required this.lead, required this.onTap});

  final Lead lead;
  final VoidCallback onTap;

  Future<void> _launch(Uri uri) async {
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final leadStatuses = ref.watch(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;

    String statusLabel = lead.status;
    Color statusColor = hexToColor(null);
    final match = leadStatuses?.where((o) => o.id == lead.status);
    if (match != null && match.isNotEmpty) {
      statusLabel = match.first.label ?? lead.status;
      statusColor = hexToColor(match.first.color);
    }

    final accentColor = lead.isHotLead
        ? const Color(0xFFEA580C)
        : lead.isReEnquiry
            ? const Color(0xFFF59E0B)
            : null;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (accentColor != null) Container(height: 3, color: accentColor),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text(statusLabel),
                        backgroundColor: statusColor.withValues(alpha: 0.12),
                        labelStyle: TextStyle(color: statusColor, fontWeight: FontWeight.w600, fontSize: 11),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        side: BorderSide.none,
                      ),
                      const Spacer(),
                      if (lead.isReEnquiry)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            'RE-ENQUIRY ×${lead.reEnquiryCount}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: const Color(0xFFF59E0B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (lead.isHotLead)
                        const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(Icons.local_fire_department, color: Color(0xFFEA580C), size: 18),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    lead.fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  if (lead.company != null && lead.company!.isNotEmpty)
                    Text(
                      lead.company!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_outline, size: 14, color: theme.colorScheme.onSurfaceVariant),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                lead.assignedTo != null ? lead.assignedTo!.firstName : 'Unassigned',
                                style: theme.textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (lead.potentialValue > 0)
                              Text(
                                lead.potentialValue.toStringAsFixed(0),
                                style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                              ),
                          ],
                        ),
                        if (lead.campaignName != null && lead.campaignName!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.campaign_outlined, size: 14, color: theme.colorScheme.onSurfaceVariant),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  lead.campaignName!,
                                  style: theme.textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _launch(Uri(scheme: 'tel', path: lead.phone)),
                          icon: const Icon(Icons.call, size: 16),
                          label: const Text('Call'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _launch(
                            Uri.parse('https://wa.me/${lead.phone.replaceAll(RegExp(r'[^0-9]'), '')}'),
                          ),
                          icon: const Icon(Icons.chat, size: 16),
                          label: const Text('WhatsApp'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
