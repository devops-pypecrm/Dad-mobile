import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error_state_view.dart';
import '../../providers/opportunity_detail_provider.dart';

class OpportunityDetailScreen extends ConsumerWidget {
  const OpportunityDetailScreen({super.key, required this.opportunityId});

  final String opportunityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunityAsync = ref.watch(opportunityDetailProvider(opportunityId));

    return Scaffold(
      appBar: AppBar(title: Text(opportunityAsync.valueOrNull?.name ?? 'Opportunity')),
      body: opportunityAsync.when(
        data: (opportunity) => RefreshIndicator(
          onRefresh: () => ref.refresh(opportunityDetailProvider(opportunityId).future),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(opportunity.name, style: Theme.of(context).textTheme.headlineSmall),
              if (opportunity.account != null)
                Text(opportunity.account!.name, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('Stage', style: Theme.of(context).textTheme.labelLarge)),
                          Chip(label: Text(opportunity.stage)),
                        ],
                      ),
                      const Divider(height: 24),
                      _InfoRow(label: 'Amount', value: opportunity.amount.toStringAsFixed(0)),
                      _InfoRow(label: 'Probability', value: '${opportunity.probability.toStringAsFixed(0)}%'),
                      _InfoRow(label: 'Payment Status', value: opportunity.paymentStatus),
                      _InfoRow(label: 'Type', value: opportunity.type),
                      if (opportunity.closeDate != null)
                        _InfoRow(
                          label: 'Close Date',
                          value: '${opportunity.closeDate!.toLocal()}'.split(' ').first,
                        ),
                      if (opportunity.owner != null)
                        _InfoRow(
                          label: 'Owner',
                          value: [opportunity.owner!.firstName, opportunity.owner!.lastName]
                              .where((p) => p != null && p.isNotEmpty)
                              .join(' '),
                        ),
                    ],
                  ),
                ),
              ),
              if (opportunity.description != null && opportunity.description!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Description', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(opportunity.description!),
              ],
              if (opportunity.contacts.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Contacts', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...opportunity.contacts.map(
                  (c) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: Text('${c.firstName} ${c.lastName}'),
                      subtitle: c.email != null ? Text(c.email!) : null,
                    ),
                  ),
                ),
              ],
              if (opportunity.emiSchedule != null) ...[
                const SizedBox(height: 16),
                Text('EMI Schedule', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InfoRow(
                          label: 'Total',
                          value: opportunity.emiSchedule!.totalAmount.toStringAsFixed(0),
                        ),
                        _InfoRow(
                          label: 'Paid',
                          value: opportunity.emiSchedule!.paidAmount.toStringAsFixed(0),
                        ),
                        _InfoRow(
                          label: 'Remaining',
                          value: opportunity.emiSchedule!.remainingAmount.toStringAsFixed(0),
                        ),
                      ],
                    ),
                  ),
                ),
                ...opportunity.emiSchedule!.installments.map(
                  (i) => Card(
                    child: ListTile(
                      title: Text('Installment #${i.installmentNumber}'),
                      subtitle: Text('Due ${'${i.dueDate.toLocal()}'.split(' ').first}'),
                      trailing: Chip(label: Text(i.status), visualDensity: VisualDensity.compact),
                    ),
                  ),
                ),
              ],
              if (opportunity.paymentRecords.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Payment Records', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...opportunity.paymentRecords.map(
                  (p) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.payments_outlined),
                      title: Text(p.amount.toStringAsFixed(0)),
                      subtitle: Text('${p.paymentType} · ${'${p.paymentDate.toLocal()}'.split(' ').first}'),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(opportunityDetailProvider(opportunityId)),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
          Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
