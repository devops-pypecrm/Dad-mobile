import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/confirm_dialog.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/utils/text_format.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/opportunity.dart';
import '../../domain/opportunity_payments.dart';
import '../../providers/opportunity_actions_controller.dart';
import '../../providers/opportunity_detail_provider.dart';
import '../../providers/opportunity_notes_controller.dart';
import '../../providers/opportunity_timeline_provider.dart';
import '../widgets/close_deal_sheet.dart';
import '../widgets/opportunity_timeline_section.dart';

/// App brand color — matches the green theme used everywhere else (nav bar,
/// FABs, Follow Ups stat cards). This screen previously used a leftover
/// purple (`#5B21B6`) from before the app-wide recolor; every accent here
/// now matches.
const _brandColor = Color(0xFF578732);

/// Fallback pipeline when the org hasn't configured
/// `Organisation.opportunityLeadStatuses` — same idea as leads' fallback
/// status list, just for the opportunity side of the pipeline. Deliberately
/// excludes `closed_won`/`closed_lost` — those two need the dedicated
/// Close Won/Lost sheets (payment type, EMI installments, lost reason),
/// not a bare stage change with none of that data attached, which would
/// leave the deal in an inconsistent state (closed but with no payment
/// recorded — see `OpportunitiesRepository.closeWon`'s doc comment).
const _kFallbackStages = [
  'prospecting',
  'qualification',
  'proposal',
  'negotiation',
];

class OpportunityDetailScreen extends ConsumerWidget {
  const OpportunityDetailScreen({super.key, required this.opportunityId});

  final String opportunityId;

  Future<void> _pickStage(
    BuildContext context,
    WidgetRef ref,
    Opportunity opportunity,
  ) async {
    final options =
        (ref
                    .read(sessionControllerProvider)
                    .valueOrNull
                    ?.organisation
                    .opportunityStages ??
                const [])
            .where((o) => !kTerminalOpportunityStages.contains(o.id))
            .toList();
    final stageIds = options.isNotEmpty
        ? options.map((o) => o.label ?? o.id).toList()
        : _kFallbackStages;
    final idFor = {for (final o in options) (o.label ?? o.id): o.id};

    final selectedLabel = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: safeBottomInset(context)),
          children: stageIds
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
    if (!context.mounted) return;

    final confirmed = await showConfirmDialog(
      context,
      title: 'Change stage?',
      message: 'Move this opportunity to "$selectedLabel"?',
    );
    if (!confirmed) return;

    await ref
        .read(opportunityActionsControllerProvider(opportunityId).notifier)
        .updateStage(idFor[selectedLabel] ?? selectedLabel);
  }

  Future<void> _editDetails(
    BuildContext context,
    WidgetRef ref,
    Opportunity opportunity,
  ) async {
    final amountController = TextEditingController(
      text: opportunity.amount.toStringAsFixed(0),
    );
    final probabilityController = TextEditingController(
      text: opportunity.probability.toStringAsFixed(0),
    );
    var closeDate = opportunity.closeDate;

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(
            bottom: sheetBottomPadding(context, extra: 0),
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Opportunity',
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
                subtitle: Text(
                  closeDate != null ? '${closeDate!.toLocal()}'.split(' ').first : 'Not set',
                ),
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
                  style: FilledButton.styleFrom(backgroundColor: _brandColor),
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

    await ref
        .read(opportunityActionsControllerProvider(opportunityId).notifier)
        .updateDetails(
          amount: double.tryParse(amountController.text.trim()),
          probability: double.tryParse(probabilityController.text.trim()),
          closeDate: closeDate,
        );
  }

  Future<void> _pickLeadStatus(
    BuildContext context,
    WidgetRef ref,
    String? current,
  ) async {
    final options = ref.read(sessionControllerProvider).valueOrNull?.organisation.leadStatuses;
    final statusIds = (options != null && options.isNotEmpty)
        ? options.map((o) => o.label ?? o.id).toList()
        : const ['new', 'contacted', 'qualified', 'converted', 'lost'];
    final idFor = {for (final o in (options ?? const [])) (o.label ?? o.id): o.id};

    final selectedLabel = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: safeBottomInset(context)),
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
    if (!context.mounted) return;

    final confirmed = await showConfirmDialog(
      context,
      title: 'Change lead status?',
      message: 'Set this lead\'s status to "$selectedLabel"?',
    );
    if (!confirmed) return;

    await ref
        .read(opportunityActionsControllerProvider(opportunityId).notifier)
        .updateLeadStatus(idFor[selectedLabel] ?? selectedLabel);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunityAsync = ref.watch(opportunityDetailProvider(opportunityId));
    final actionState = ref.watch(opportunityActionsControllerProvider(opportunityId));
    final currency = ref.watch(sessionControllerProvider).valueOrNull?.organisation.currency;
    final theme = Theme.of(context);

    ref.listen(opportunityActionsControllerProvider(opportunityId), (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        showAppSnackBar(context, error.toString(), isError: true);
      }
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            opportunityAsync.valueOrNull?.name ?? 'Opportunity',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
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
          bottom: TabBar(
            labelColor: _brandColor,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
            indicatorColor: _brandColor,
            tabs: const [
              Tab(text: 'Details'),
              Tab(text: 'Timeline & Files'),
            ],
          ),
        ),
        body: opportunityAsync.when(
          data: (opportunity) => TabBarView(
            children: [
              RefreshIndicator(
                onRefresh: () => ref.refresh(opportunityDetailProvider(opportunityId).future),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, safeBottomInset(context) + 16),
                  children: [
                    if (opportunity.account != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(opportunity.account!.name, style: theme.textTheme.bodyLarge),
                      ),
                    _StageAndActionsCard(
                      opportunity: opportunity,
                      actionState: actionState,
                      onChangeStage: () => _pickStage(context, ref, opportunity),
                    ),
                    const SizedBox(height: 16),
                    _ValueAndCloseDateRow(opportunity: opportunity, currency: currency),
                    if (opportunity.owner != null) ...[
                      const SizedBox(height: 16),
                      _OwnerCard(opportunity: opportunity),
                    ],
                    if (opportunity.lead != null) ...[
                      const SizedBox(height: 16),
                      _LinkedLeadCard(
                        opportunity: opportunity,
                        actionState: actionState,
                        onChangeLeadStatus: () =>
                            _pickLeadStatus(context, ref, opportunity.lead!.status),
                      ),
                    ],
                    if (opportunity.description != null && opportunity.description!.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text('Description', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 8),
                      // Plain, unbounded Text — the full description always
                      // reads in full, never clipped with an ellipsis.
                      Text(opportunity.description!),
                    ],
                    if (opportunity.contacts.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text('Contacts', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 8),
                      ...opportunity.contacts.map(
                        (c) => Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                      _AssociatedProductsSection(
                        opportunity: opportunity,
                        actionState: actionState,
                        currency: currency,
                      ),
                    ],
                    if (opportunity.emiSchedule != null) ...[
                      const SizedBox(height: 16),
                      _EmiScheduleSection(opportunity: opportunity, currency: currency),
                    ],
                    if (opportunity.paymentRecords.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text('Payment Records', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 8),
                      ...opportunity.paymentRecords.map(
                        (p) => Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            leading: const Icon(Icons.payments_outlined),
                            title: Text(CurrencyFormatter.format(p.amount, currency)),
                            subtitle: Text(
                              '${p.paymentType} · ${'${p.paymentDate.toLocal()}'.split(' ').first}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: () async =>
                    ref.invalidate(opportunityTimelineProvider(opportunityId)),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, safeBottomInset(context) + 16),
                  children: [
                    _AddNoteComposer(opportunityId: opportunityId),
                    const SizedBox(height: 16),
                    OpportunityTimelineSection(opportunityId: opportunityId),
                  ],
                ),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => ErrorStateView(
            error: error,
            onRetry: () => ref.invalidate(opportunityDetailProvider(opportunityId)),
          ),
        ),
      ),
    );
  }
}

/// Inline note composer, above the merged timeline feed — matches web's
/// always-visible textarea + button (not a popup dialog): type, tap "Add
/// Note", it lands in the timeline below (as an `interaction`/`note` row)
/// once the timeline provider is invalidated.
class _AddNoteComposer extends ConsumerStatefulWidget {
  const _AddNoteComposer({required this.opportunityId});

  final String opportunityId;

  @override
  ConsumerState<_AddNoteComposer> createState() => _AddNoteComposerState();
}

class _AddNoteComposerState extends ConsumerState<_AddNoteComposer> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSaving = ref.watch(opportunityNotesControllerProvider(widget.opportunityId)).isLoading;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _controller,
            minLines: 2,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Add a note to this deal…',
              border: InputBorder.none,
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _brandColor),
            onPressed: isSaving || _controller.text.trim().isEmpty
                ? null
                : () async {
                    final text = _controller.text.trim();
                    await ref
                        .read(opportunityNotesControllerProvider(widget.opportunityId).notifier)
                        .addNote(text);
                    _controller.clear();
                    setState(() {});
                  },
            child: isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Text('Add Note'),
          ),
        ],
      ),
    );
  }
}

class _StageAndActionsCard extends StatelessWidget {
  const _StageAndActionsCard({
    required this.opportunity,
    required this.actionState,
    required this.onChangeStage,
  });

  final Opportunity opportunity;
  final AsyncValue<void> actionState;
  final VoidCallback onChangeStage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (bg, fg) = switch (opportunity.stage) {
      'closed_won' => (const Color(0xFF16A34A), Colors.white),
      'closed_lost' => (const Color(0xFFDC2626), Colors.white),
      _ => (_brandColor.withValues(alpha: 0.12), _brandColor),
    };

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stage',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          humanizeSnakeCase(opportunity.stage),
                          softWrap: true,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: fg,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Probability',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.track_changes, size: 16, color: _brandColor),
                        const SizedBox(width: 4),
                        Text(
                          '${opportunity.probability.toStringAsFixed(0)}%',
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            if (opportunity.stage == 'closed_lost' &&
                opportunity.lostReason != null &&
                opportunity.lostReason!.isNotEmpty) ...[
              const Divider(height: 24),
              Text(
                'Lost Reason',
                style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 4),
              Text(opportunity.lostReason!),
            ],
            // Once closed_won/closed_lost the backend refuses any further
            // change (400) — hide every action rather than let every tap
            // fail.
            if (!kTerminalOpportunityStages.contains(opportunity.stage)) ...[
              const Divider(height: 24),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: _brandColor,
                  side: const BorderSide(color: _brandColor),
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: actionState.isLoading ? null : onChangeStage,
                child: const Text('Change Stage'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                        minimumSize: const Size.fromHeight(44),
                      ),
                      onPressed: actionState.isLoading
                          ? null
                          : () => showCloseWonSheet(context, opportunity),
                      icon: const Icon(Icons.emoji_events_outlined, size: 18),
                      label: const Text('Close Won'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFDC2626),
                        minimumSize: const Size.fromHeight(44),
                      ),
                      onPressed: actionState.isLoading
                          ? null
                          : () => showCloseLostSheet(context, opportunity.id),
                      icon: const Icon(Icons.cancel_outlined, size: 18),
                      label: const Text('Close Lost'),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Value & Close Date — a 2-column grid of tinted tiles, same content/order
/// as Dad-frontend's detail page. `Wrap`+`Flexible` text (not a fixed-height
/// `Row`) so a long formatted currency string (a large amount in a currency
/// with a wide symbol, e.g. "AED") wraps instead of overflowing off the
/// tile's edge.
class _ValueAndCloseDateRow extends StatelessWidget {
  const _ValueAndCloseDateRow({required this.opportunity, required this.currency});

  final Opportunity opportunity;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _MetricTile(
              icon: Icons.attach_money,
              iconColor: const Color(0xFF16A34A),
              label: 'Value',
              value: CurrencyFormatter.format(opportunity.amount, currency),
              valueStyle: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _MetricTile(
              icon: Icons.calendar_today_outlined,
              iconColor: const Color(0xFF9333EA),
              label: 'Close Date',
              value: opportunity.closeDate != null
                  ? '${opportunity.closeDate!.toLocal()}'.split(' ').first
                  : 'N/A',
              valueStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.valueStyle,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // No maxLines/ellipsis — a long value (a big amount, a long
          // localized date) wraps onto a second line inside the tile
          // instead of being cut off.
          Text(value, softWrap: true, style: valueStyle),
        ],
      ),
    );
  }
}

class _OwnerCard extends StatelessWidget {
  const _OwnerCard({required this.opportunity});

  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final owner = opportunity.owner!;
    final initials = [
      (owner.firstName?.isNotEmpty ?? false) ? owner.firstName![0] : '',
      (owner.lastName?.isNotEmpty ?? false) ? owner.lastName![0] : '',
    ].join();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _brandColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _brandColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person_outline, size: 16, color: _brandColor),
              const SizedBox(width: 6),
              Text(
                'Opportunity Owner',
                style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: _brandColor.withValues(alpha: 0.15),
                child: Text(
                  initials,
                  style: const TextStyle(color: _brandColor, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      [owner.firstName, owner.lastName].where((p) => p != null && p.isNotEmpty).join(' '),
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                      softWrap: true,
                    ),
                    if (owner.email != null)
                      Text(
                        owner.email!,
                        softWrap: true,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LinkedLeadCard extends StatelessWidget {
  const _LinkedLeadCard({
    required this.opportunity,
    required this.actionState,
    required this.onChangeLeadStatus,
  });

  final Opportunity opportunity;
  final AsyncValue<void> actionState;
  final VoidCallback onChangeLeadStatus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lead = opportunity.lead!;
    final status = lead.status ?? 'unknown';
    // Once the deal is closed_won/closed_lost, the backend has already
    // back-synced the lead's real status to 'won'/'lost' (see
    // `updateOpportunity`'s back-sync block) — changing it again here would
    // silently fight that outcome, and this screen already hides Change
    // Stage/Close Won/Close Lost for the same terminal-stage reason, so this
    // action should stop being editable too rather than staying tappable.
    final canChangeStatus = !kTerminalOpportunityStages.contains(opportunity.stage);
    final (bg, fg) = switch (status) {
      'converted' => (const Color(0xFF16A34A), Colors.white),
      'lost' => (const Color(0xFFDC2626), Colors.white),
      _ => (const Color(0xFF16A34A).withValues(alpha: 0.12), const Color(0xFF15803D)),
    };

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => context.push('/leads/${lead.id}'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF16A34A).withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF16A34A).withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_search_outlined, size: 16, color: Color(0xFF16A34A)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Linked Lead',
                    style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ),
                const Icon(Icons.chevron_right, size: 18, color: Color(0xFF16A34A)),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              [lead.firstName, lead.lastName].where((p) => p != null && p.isNotEmpty).join(' '),
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              softWrap: true,
            ),
            if (lead.assignedTo != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Owner: ${[lead.assignedTo!.firstName, lead.assignedTo!.lastName].where((p) => p != null && p.isNotEmpty).join(' ')}',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  softWrap: true,
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Unassigned',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ),
            const SizedBox(height: 10),
            // A tappable status chip rather than the web's inline `Select`
            // (no room for a dropdown trigger this small on mobile without
            // clipping the label) — opens the same status-picker sheet
            // `_pickLeadStatus` already provides.
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: (canChangeStatus && !actionState.isLoading) ? onChangeLeadStatus : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'Status: $status',
                        softWrap: true,
                        style: theme.textTheme.labelMedium?.copyWith(color: fg, fontWeight: FontWeight.w700),
                      ),
                    ),
                    // The sync icon is the only visual cue that this chip is
                    // tappable — dropping it once the deal is closed makes
                    // clear (without extra text) that the status is now
                    // final, not just temporarily disabled.
                    if (canChangeStatus) ...[
                      const SizedBox(width: 4),
                      Icon(Icons.sync_alt, size: 14, color: fg),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssociatedProductsSection extends ConsumerWidget {
  const _AssociatedProductsSection({
    required this.opportunity,
    required this.actionState,
    required this.currency,
  });

  final Opportunity opportunity;
  final AsyncValue<void> actionState;
  final String? currency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final products = opportunity.account!.accountProducts;
    final total = products.fold<double>(0, (sum, p) => sum + p.price * p.quantity);
    final inSync = (total - opportunity.amount).abs() < 0.01;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.inventory_2_outlined, size: 18, color: _brandColor),
                const SizedBox(width: 8),
                Text('Associated Products', style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 8),
            for (final p in products)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.customName ?? p.product?.name ?? 'Product',
                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                            softWrap: true,
                          ),
                          Text(
                            'Qty: ${p.quantity.toStringAsFixed(0)} × ${CurrencyFormatter.format(p.price, currency)}',
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      CurrencyFormatter.format(p.price * p.quantity, currency),
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            const Divider(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Product Value', style: theme.textTheme.labelMedium),
                      if (!inSync)
                        Text(
                          'Differs from Opportunity Amount',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: const Color(0xFFB45309),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  CurrencyFormatter.format(total, currency),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF16A34A),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            if (!inSync) ...[
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFB45309),
                    side: const BorderSide(color: Color(0xFFFCD34D)),
                  ),
                  onPressed: actionState.isLoading
                      ? null
                      : () async {
                          final confirmed = await showConfirmDialog(
                            context,
                            title: 'Sync amount?',
                            message:
                                'Set the opportunity amount to ${CurrencyFormatter.format(total, currency)} (the current product total)?',
                          );
                          if (!confirmed) return;
                          await ref
                              .read(opportunityActionsControllerProvider(opportunity.id).notifier)
                              .syncAmount(total);
                        },
                  icon: const Icon(Icons.sync, size: 16),
                  label: const Text('Sync Amount'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmiScheduleSection extends ConsumerWidget {
  const _EmiScheduleSection({required this.opportunity, required this.currency});

  final Opportunity opportunity;
  final String? currency;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, EmiInstallment installment) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Delete installment?',
      message:
          'Installment #${installment.installmentNumber} (${CurrencyFormatter.format(installment.amount, currency)}) will be removed from this schedule.',
      confirmLabel: 'Delete',
      destructive: true,
    );
    if (!confirmed) return;
    await ref
        .read(opportunityActionsControllerProvider(opportunity.id).notifier)
        .deleteInstallment(installment.id);
  }

  Future<void> _confirmPay(BuildContext context, WidgetRef ref, EmiInstallment installment) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Mark as paid?',
      message:
          'Mark installment #${installment.installmentNumber} (${CurrencyFormatter.format(installment.amount, currency)}) as paid?',
      confirmLabel: 'Mark Paid',
    );
    if (!confirmed) return;
    await ref
        .read(opportunityActionsControllerProvider(opportunity.id).notifier)
        .payInstallment(installment.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final emi = opportunity.emiSchedule!;
    final actionState = ref.watch(opportunityActionsControllerProvider(opportunity.id));
    final progress = emi.totalAmount > 0 ? (emi.paidAmount / emi.totalAmount).clamp(0.0, 1.0) : 0.0;
    final sortedInstallments = [...emi.installments]
      ..sort((a, b) => a.installmentNumber.compareTo(b.installmentNumber));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text('EMI Schedule', style: theme.textTheme.titleMedium)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: emi.status == 'completed'
                    ? const Color(0xFF16A34A).withValues(alpha: 0.12)
                    : _brandColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                humanizeSnakeCase(emi.status),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: emi.status == 'completed' ? const Color(0xFF15803D) : _brandColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Total / Paid / Remaining as three tiles in one row, same
                // shape as the Value/Close Date tiles above, instead of the
                // old plain label:value list rows.
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _EmiStatTile(
                          label: 'Total',
                          value: CurrencyFormatter.format(emi.totalAmount, currency),
                          color: theme.colorScheme.onSurface,
                          background: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _EmiStatTile(
                          label: 'Paid',
                          value: CurrencyFormatter.format(emi.paidAmount, currency),
                          color: const Color(0xFF15803D),
                          background: const Color(0xFF16A34A).withValues(alpha: 0.1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _EmiStatTile(
                          label: 'Remaining',
                          value: CurrencyFormatter.format(emi.remainingAmount, currency),
                          color: const Color(0xFFB45309),
                          background: const Color(0xFFF59E0B).withValues(alpha: 0.12),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Payment Progress',
                        style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                    Text(
                      '${(progress * 100).round()}%',
                      style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF16A34A)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Installments (${sortedInstallments.length})',
          style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        for (final installment in sortedInstallments)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _InstallmentTile(
              installment: installment,
              currency: currency,
              isBusy: actionState.isLoading,
              onPay: () => _confirmPay(context, ref, installment),
              onDelete: () => _confirmDelete(context, ref, installment),
            ),
          ),
      ],
    );
  }
}

class _EmiStatTile extends StatelessWidget {
  const _EmiStatTile({
    required this.label,
    required this.value,
    required this.color,
    required this.background,
  });

  final String label;
  final String value;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4),
          // No maxLines/ellipsis — a large formatted amount wraps to a
          // second line inside the tile rather than being clipped.
          Text(
            value,
            softWrap: true,
            style: theme.textTheme.titleSmall?.copyWith(color: color, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

const _kInstallmentStatusStyle = <String, (IconData, Color, String)>{
  'pending': (Icons.schedule, Color(0xFFB45309), 'Pending'),
  'paid': (Icons.check_circle, Color(0xFF16A34A), 'Paid'),
  'overdue': (Icons.error_outline, Color(0xFFDC2626), 'Overdue'),
  'cancelled': (Icons.cancel_outlined, Colors.grey, 'Cancelled'),
  'missed': (Icons.cancel_outlined, Color(0xFFDC2626), 'Missed'),
};

class _InstallmentTile extends StatelessWidget {
  const _InstallmentTile({
    required this.installment,
    required this.currency,
    required this.isBusy,
    required this.onPay,
    required this.onDelete,
  });

  final EmiInstallment installment;
  final String? currency;
  final bool isBusy;
  final VoidCallback onPay;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, color, label) =
        _kInstallmentStatusStyle[installment.status] ?? (Icons.schedule, Colors.grey, installment.status);
    final canAct = installment.status == 'pending' || installment.status == 'overdue';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${installment.installmentNumber} — ${CurrencyFormatter.format(installment.amount, currency)}',
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                  softWrap: true,
                ),
                const SizedBox(height: 2),
                Text(
                  installment.paidDate != null
                      ? 'Due ${'${installment.dueDate.toLocal()}'.split(' ').first} · Paid ${'${installment.paidDate!.toLocal()}'.split(' ').first}'
                      : 'Due ${'${installment.dueDate.toLocal()}'.split(' ').first}',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  softWrap: true,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 13, color: color),
                      const SizedBox(width: 4),
                      Text(
                        label,
                        style: theme.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (canAct) ...[
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF16A34A),
                    side: const BorderSide(color: Color(0xFF16A34A)),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: isBusy ? null : onPay,
                  icon: const Icon(Icons.check, size: 14),
                  label: const Text('Pay'),
                ),
                const SizedBox(height: 6),
                IconButton(
                  tooltip: 'Delete installment',
                  visualDensity: VisualDensity.compact,
                  onPressed: isBusy ? null : onDelete,
                  icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFDC2626)),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

