import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../domain/campaign_report_row.dart';
import '../../providers/reports_providers.dart';

final _dateFormat = DateFormat('MMM d, yyyy');

/// Mobile equivalent of Dad-frontend's `/reports/campaigns` page — same
/// `GET /api/campaigns` data, no filters (web's page has none either).
class CampaignsReportScreen extends ConsumerWidget {
  const CampaignsReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaignsAsync = ref.watch(campaignsReportProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Campaign Reports')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(campaignsReportProvider.future),
        child: campaignsAsync.when(
          data: (campaigns) {
            if (campaigns.isEmpty) {
              return const EmptyStateView(message: 'No campaigns found.', icon: Icons.campaign_outlined);
            }
            final sent = campaigns.where((c) => c.status == 'sent').length;
            final draft = campaigns.where((c) => c.status == 'draft').length;
            final scheduled = campaigns.where((c) => c.status == 'scheduled').length;
            final recent = [...campaigns]
              ..sort((a, b) => (b.createdAt ?? DateTime(0)).compareTo(a.createdAt ?? DateTime(0)));

            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              children: [
                Row(
                  children: [
                    Expanded(child: _StatTile(label: 'Total', value: campaigns.length, color: theme.colorScheme.primary)),
                    const SizedBox(width: 8),
                    Expanded(child: _StatTile(label: 'Sent', value: sent, color: const Color(0xFF9654B5))),
                    const SizedBox(width: 8),
                    Expanded(child: _StatTile(label: 'Draft', value: draft, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Expanded(child: _StatTile(label: 'Scheduled', value: scheduled, color: const Color(0xFF00A8D6))),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Recent Campaigns', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 10),
                for (final c in recent.take(10))
                  Padding(padding: const EdgeInsets.only(bottom: 8), child: _CampaignRow(campaign: c)),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => ErrorStateView(error: error, onRetry: () => ref.invalidate(campaignsReportProvider)),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value, required this.color});

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Text('$value', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color)),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _CampaignRow extends StatelessWidget {
  const _CampaignRow({required this.campaign});

  final CampaignReportRow campaign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (label, color) = switch (campaign.status) {
      'sent' => ('Sent', const Color(0xFF9654B5)),
      'scheduled' => ('Scheduled', const Color(0xFF00A8D6)),
      _ => ('Draft', Colors.grey),
    };

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  campaign.name,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
                child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          if ((campaign.subject ?? '').isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              campaign.subject!,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (campaign.createdAt != null) ...[
            const SizedBox(height: 4),
            Text(
              _dateFormat.format(campaign.createdAt!),
              style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
        ],
      ),
    );
  }
}
