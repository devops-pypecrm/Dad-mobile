import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/text_format.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/lead.dart';
import '../../providers/lead_detail_provider.dart';
import '../../providers/lead_status_controller.dart';
import '../widgets/assign_lead_sheet.dart';
import '../widgets/lead_quick_actions.dart';

class LeadDetailScreen extends ConsumerWidget {
  const LeadDetailScreen({super.key, required this.leadId});

  final String leadId;

  Future<void> _pickStatus(BuildContext context, WidgetRef ref, Lead lead) async {
    final options = ref.read(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;
    final statusIds = (options != null && options.isNotEmpty)
        ? options.map((o) => o.label ?? o.id).toList()
        : const ['new', 'contacted', 'qualified', 'converted', 'lost'];
    // Map back to raw ids when a custom pipeline is configured.
    final idFor = {
      for (final o in (options ?? const [])) (o.label ?? o.id): o.id,
    };

    final selectedLabel = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: statusIds
              .map(
                (label) => ListTile(
                  title: Text(label),
                  onTap: () => Navigator.of(context).pop(label),
                ),
              )
              .toList(),
        ),
      ),
    );
    if (selectedLabel == null) return;

    final newStatus = idFor[selectedLabel] ?? selectedLabel;

    if (kProductGatedStatuses.contains(newStatus) && !lead.hasProducts) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add Products First'),
            content: const Text(
              'This lead has no products attached. A lead can only move to '
              '"qualified" or "converted" once at least one product is added.',
            ),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
            ],
          ),
        );
      }
      return;
    }

    await ref.read(leadStatusControllerProvider(leadId).notifier).updateStatus(newStatus);
  }

  Future<void> _pickNextFollowUp(BuildContext context, WidgetRef ref) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date == null || !context.mounted) return;

    final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (!context.mounted) return;

    final dueDate = DateTime(date.year, date.month, date.day, time?.hour ?? 9, time?.minute ?? 0);
    await ref.read(leadStatusControllerProvider(leadId).notifier).scheduleNextFollowUp(dueDate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leadAsync = ref.watch(leadDetailProvider(leadId));
    final actionState = ref.watch(leadStatusControllerProvider(leadId));
    final theme = Theme.of(context);

    ref.listen(leadStatusControllerProvider(leadId), (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.toString())));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(leadAsync.valueOrNull?.fullName ?? 'Lead'),
        actions: [
          if (leadAsync.hasValue) ...[
            IconButton(
              tooltip: 'Assign',
              icon: const Icon(Icons.person_add_alt_outlined),
              onPressed: () => showAssignLeadSheet(context, ref, leadAsync.value!),
            ),
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Icons.edit_outlined),
              onPressed: () => context.push('/leads/$leadId/edit', extra: leadAsync.value),
            ),
          ],
        ],
      ),
      floatingActionButton: leadAsync.hasValue
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/checkins/new?leadId=$leadId'),
              icon: const Icon(Icons.location_on_outlined),
              label: const Text('Check-In Here'),
            )
          : null,
      body: leadAsync.when(
        data: (lead) => RefreshIndicator(
          onRefresh: () => ref.refresh(leadDetailProvider(leadId).future),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(lead.fullName, style: theme.textTheme.headlineSmall)),
                  if (lead.isReEnquiry)
                    Chip(
                      label: Text('Re-enquiry ×${lead.reEnquiryCount}'),
                      backgroundColor: theme.colorScheme.tertiaryContainer,
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
              if (lead.company != null && lead.company!.isNotEmpty)
                Text(lead.company!, style: theme.textTheme.bodyLarge),
              if (lead.lastEnquiryDate != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Last enquiry: ${lead.lastEnquiryDate!.toLocal().toString().split(' ').first}',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ),
              const SizedBox(height: 16),
              LeadQuickActions(phone: lead.phone, email: lead.email),
              if (lead.secondaryPhone != null && lead.secondaryPhone!.isNotEmpty) ...[
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () async {
                    final uri = Uri(scheme: 'tel', path: lead.secondaryPhone);
                    if (await canLaunchUrl(uri)) await launchUrl(uri);
                  },
                  icon: const Icon(Icons.call, size: 18),
                  label: Text('Call secondary: ${lead.secondaryPhone}'),
                ),
              ],
              const SizedBox(height: 24),

              // Contact info card — owner, source/campaign, enquiry about.
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Details', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 12),
                      _DetailRow(
                        label: 'Owner',
                        value: lead.assignedTo != null
                            ? '${lead.assignedTo!.firstName} ${lead.assignedTo!.lastName}'
                            : 'Unassigned',
                      ),
                      _DetailRow(label: 'Source', value: humanizeSnakeCase(lead.displaySource)),
                      if (lead.campaignName != null && lead.campaignName!.isNotEmpty)
                        _DetailRow(label: 'Campaign', value: lead.campaignName!),
                      if (lead.enquiryAbout != null && lead.enquiryAbout!.isNotEmpty)
                        _DetailRow(label: 'Enquiry About', value: lead.enquiryAbout!),
                      if (lead.createdAt != null)
                        _DetailRow(
                          label: 'Created',
                          value: lead.createdAt!.toLocal().toString().split('.').first,
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Status', style: theme.textTheme.labelLarge),
                          ),
                          Chip(label: Text(lead.status)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: actionState.isLoading ? null : () => _pickStatus(context, ref, lead),
                        child: const Text('Change Status'),
                      ),
                      const Divider(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: Text('Next Follow-up', style: theme.textTheme.labelLarge),
                          ),
                          Text(
                            lead.nextFollowUp != null
                                ? '${lead.nextFollowUp!.toLocal()}'.split('.').first
                                : 'Not scheduled',
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: actionState.isLoading ? null : () => _pickNextFollowUp(context, ref),
                        child: const Text('Schedule Follow-up'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (lead.potentialValue > 0)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.payments_outlined),
                    title: const Text('Potential Value'),
                    trailing: Text(lead.potentialValue.toStringAsFixed(0)),
                  ),
                ),
              const SizedBox(height: 16),
              Text('Products', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              if (!lead.hasProducts)
                const Text('No products attached yet.')
              else
                ...lead.products!.map(
                  (p) => Card(
                    child: ListTile(
                      title: Text(p.customName ?? p.product?.name ?? 'Product'),
                      subtitle: Text('Qty: ${p.quantity}'),
                      trailing: Text(p.price.toStringAsFixed(0)),
                    ),
                  ),
                ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(leadDetailProvider(leadId)),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          ),
          Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
