import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/opportunity.dart';
import '../../providers/opportunity_actions_controller.dart';
import '../../providers/opportunity_detail_provider.dart';
import '../widgets/opportunity_notes_section.dart';

/// Fallback pipeline when the org hasn't configured
/// `Organisation.opportunityLeadStatuses` — same idea as leads' fallback
/// status list, just for the opportunity side of the pipeline.
const _kFallbackStages = ['prospecting', 'qualification', 'proposal', 'negotiation', 'closed_won', 'closed_lost'];

class OpportunityDetailScreen extends ConsumerWidget {
  const OpportunityDetailScreen({super.key, required this.opportunityId});

  final String opportunityId;

  Future<void> _pickStage(BuildContext context, WidgetRef ref, Opportunity opportunity) async {
    final options = ref.read(sessionControllerProvider).valueOrNull?.organisation.opportunityStages;
    final stageIds = (options != null && options.isNotEmpty)
        ? options.map((o) => o.label ?? o.id).toList()
        : _kFallbackStages;
    final idFor = {for (final o in (options ?? const [])) (o.label ?? o.id): o.id};

    final selectedLabel = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: stageIds.map((label) => ListTile(title: Text(label), onTap: () => Navigator.of(context).pop(label))).toList(),
        ),
      ),
    );
    if (selectedLabel == null) return;

    await ref
        .read(opportunityActionsControllerProvider(opportunityId).notifier)
        .updateStage(idFor[selectedLabel] ?? selectedLabel);
  }

  Future<void> _editDetails(BuildContext context, WidgetRef ref, Opportunity opportunity) async {
    final amountController = TextEditingController(text: opportunity.amount.toStringAsFixed(0));
    final probabilityController = TextEditingController(text: opportunity.probability.toStringAsFixed(0));
    var closeDate = opportunity.closeDate;

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Edit Opportunity', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: probabilityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Probability (%)'),
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Close Date'),
                subtitle: Text(closeDate != null ? '${closeDate!.toLocal()}'.split(' ').first : 'Not set'),
                trailing: const Icon(Icons.calendar_today_outlined),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
                    initialDate: closeDate ?? DateTime.now(),
                  );
                  if (picked != null) setSheetState(() => closeDate = picked);
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Save'),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
    if (saved != true) return;

    await ref.read(opportunityActionsControllerProvider(opportunityId).notifier).updateDetails(
          amount: double.tryParse(amountController.text.trim()),
          probability: double.tryParse(probabilityController.text.trim()),
          closeDate: closeDate,
        );
  }

  Future<void> _pickLeadStatus(BuildContext context, WidgetRef ref, String? current) async {
    final options = ref.read(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;
    final statusIds = (options != null && options.isNotEmpty)
        ? options.map((o) => o.label ?? o.id).toList()
        : const ['new', 'contacted', 'qualified', 'converted', 'lost'];
    final idFor = {for (final o in (options ?? const [])) (o.label ?? o.id): o.id};

    final selectedLabel = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: statusIds.map((label) => ListTile(title: Text(label), onTap: () => Navigator.of(context).pop(label))).toList(),
        ),
      ),
    );
    if (selectedLabel == null) return;

    await ref
        .read(opportunityActionsControllerProvider(opportunityId).notifier)
        .updateLeadStatus(idFor[selectedLabel] ?? selectedLabel);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunityAsync = ref.watch(opportunityDetailProvider(opportunityId));
    final actionState = ref.watch(opportunityActionsControllerProvider(opportunityId));
    final theme = Theme.of(context);

    ref.listen(opportunityActionsControllerProvider(opportunityId), (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.toString())));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(opportunityAsync.valueOrNull?.name ?? 'Opportunity'),
        actions: [
          if (opportunityAsync.hasValue &&
              !kTerminalOpportunityStages.contains(opportunityAsync.value!.stage))
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Icons.edit_outlined),
              onPressed: actionState.isLoading
                  ? null
                  : () => _editDetails(context, ref, opportunityAsync.value!),
            ),
        ],
      ),
      body: opportunityAsync.when(
        data: (opportunity) => RefreshIndicator(
          onRefresh: () => ref.refresh(opportunityDetailProvider(opportunityId).future),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(opportunity.name, style: theme.textTheme.headlineSmall),
              if (opportunity.account != null)
                Text(opportunity.account!.name, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('Stage', style: theme.textTheme.labelLarge)),
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
                      // Once closed_won/closed_lost the backend refuses any
                      // further change (400) — hide the affordance rather
                      // than let every tap fail.
                      if (!kTerminalOpportunityStages.contains(opportunity.stage)) ...[
                        const SizedBox(height: 12),
                        OutlinedButton(
                          onPressed: actionState.isLoading ? null : () => _pickStage(context, ref, opportunity),
                          child: const Text('Change Stage'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (opportunity.lead != null) ...[
                const SizedBox(height: 16),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.person_search_outlined),
                    title: Text(
                      [opportunity.lead!.firstName, opportunity.lead!.lastName]
                          .where((p) => p != null && p.isNotEmpty)
                          .join(' '),
                    ),
                    subtitle: Text('Lead status: ${opportunity.lead!.status ?? 'unknown'}'),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          tooltip: 'Change lead status',
                          icon: const Icon(Icons.sync_alt),
                          onPressed: actionState.isLoading
                              ? null
                              : () => _pickLeadStatus(context, ref, opportunity.lead!.status),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    onTap: () => context.push('/leads/${opportunity.lead!.id}'),
                  ),
                ),
              ],
              if (opportunity.description != null && opportunity.description!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Description', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(opportunity.description!),
              ],
              if (opportunity.contacts.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Contacts', style: theme.textTheme.titleMedium),
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
              if ((opportunity.account?.accountProducts ?? const []).isNotEmpty) ...[
                const SizedBox(height: 16),
                _AssociatedProductsSection(opportunity: opportunity, actionState: actionState),
              ],
              if (opportunity.emiSchedule != null) ...[
                const SizedBox(height: 16),
                Text('EMI Schedule', style: theme.textTheme.titleMedium),
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
                Text('Payment Records', style: theme.textTheme.titleMedium),
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
              const SizedBox(height: 16),
              OpportunityNotesSection(opportunityId: opportunityId),
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

class _AssociatedProductsSection extends ConsumerWidget {
  const _AssociatedProductsSection({required this.opportunity, required this.actionState});

  final Opportunity opportunity;
  final AsyncValue<void> actionState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final products = opportunity.account!.accountProducts;
    final total = products.fold<double>(0, (sum, p) => sum + p.price * p.quantity);
    final inSync = (total - opportunity.amount).abs() < 0.01;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Associated Products', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        ...products.map(
          (p) => Card(
            child: ListTile(
              title: Text(p.customName ?? p.product?.name ?? 'Product'),
              subtitle: Text('Qty: ${p.quantity.toStringAsFixed(0)}'),
              trailing: Text((p.price * p.quantity).toStringAsFixed(0)),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                'Total: ${total.toStringAsFixed(0)}',
                style: theme.textTheme.titleSmall,
              ),
            ),
            if (!inSync)
              TextButton(
                onPressed: actionState.isLoading
                    ? null
                    : () => ref
                        .read(opportunityActionsControllerProvider(opportunity.id).notifier)
                        .syncAmount(total),
                child: const Text('Sync Amount'),
              ),
          ],
        ),
      ],
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
