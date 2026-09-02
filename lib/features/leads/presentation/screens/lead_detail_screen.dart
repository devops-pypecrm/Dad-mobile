import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/hex_color.dart';
import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/utils/text_format.dart';
import '../../../../core/utils/url_launch_helper.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/fading_wheel_picker.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/lead.dart';
import '../../providers/lead_detail_provider.dart';
import '../../providers/lead_status_controller.dart';
import '../widgets/assign_lead_sheet.dart';
import '../widgets/convert_lead_sheet.dart';
import '../widgets/lead_activity_tabs.dart';
import '../widgets/lead_notes_section.dart';
import '../widgets/lead_products_editor_sheet.dart';
import '../widgets/lead_quick_actions.dart';

const _brandColor = Color(0xFF578732);

class LeadDetailScreen extends ConsumerWidget {
  const LeadDetailScreen({super.key, required this.leadId});

  final String leadId;

  Future<void> _pickStatus(
    BuildContext context,
    WidgetRef ref,
    Lead lead,
  ) async {
    final options = ref
        .read(sessionControllerProvider)
        .valueOrNull
        ?.organisation
        .leadStatuses;
    final statusIds = (options != null && options.isNotEmpty)
        ? options.map((o) => o.label ?? o.id).toList()
        : const ['new', 'contacted', 'qualified', 'converted', 'lost'];
    // Map back to raw ids when a custom pipeline is configured.
    final idFor = {
      for (final o in (options ?? const [])) (o.label ?? o.id): o.id,
    };

    // Current status's label (not raw id) — `statusIds` above is already
    // built from labels, so the active row needs the same mapping to match.
    final currentLabel = idFor.entries
        .firstWhere(
          (e) => e.value == lead.status,
          orElse: () => MapEntry(lead.status, lead.status),
        )
        .key;
    final activeIndex = statusIds
        .indexOf(currentLabel)
        .clamp(0, statusIds.length - 1);

    // Same centered, scroll-to-select wheel popup as the Dashboard's
    // Branch/Month filters — opens with the current status already active
    // in the middle instead of a bottom-sheet list the user has to scroll
    // through from the top to find where they are.
    final pickedIndex = await showWheelSelectPopup(
      context,
      title: 'Status',
      items: statusIds,
      initialIndex: activeIndex,
      accentColor: _brandColor,
    );
    // Same value back means either the sheet was dismissed without
    // confirming, or the user confirmed the status they already had —
    // both are a no-op, nothing to update either way.
    if (pickedIndex == activeIndex) return;

    final selectedLabel = statusIds[pickedIndex];
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
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      return;
    }

    await ref
        .read(leadStatusControllerProvider(leadId).notifier)
        .updateStatus(newStatus);
  }

  Future<void> _pickNextFollowUp(BuildContext context, WidgetRef ref) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date == null || !context.mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (!context.mounted) return;

    final dueDate = DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? 9,
      time?.minute ?? 0,
    );
    await ref
        .read(leadStatusControllerProvider(leadId).notifier)
        .scheduleNextFollowUp(dueDate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leadAsync = ref.watch(leadDetailProvider(leadId));
    final actionState = ref.watch(leadStatusControllerProvider(leadId));
    final theme = Theme.of(context);
    final leadStatuses = ref
        .watch(sessionControllerProvider)
        .valueOrNull
        ?.organisation
        .leadStatuses;

    ref.listen(leadStatusControllerProvider(leadId), (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.toString())));
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(leadAsync.valueOrNull?.firstName ?? 'Lead'),
        actions: [
          if (leadAsync.hasValue) ...[
            IconButton(
              tooltip: 'Assign',
              icon: const Icon(
                Icons.person_add_alt_outlined,
                color: _brandColor,
              ),
              onPressed: () =>
                  showAssignLeadSheet(context, ref, leadAsync.value!),
            ),
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Icons.edit_outlined, color: _brandColor),
              onPressed: () =>
                  context.push('/leads/$leadId/edit', extra: leadAsync.value),
            ),
          ],
        ],
      ),
      body: leadAsync.when(
        data: (lead) {
          String statusLabel = lead.status;
          Color statusColor = hexToColor(null);
          final match = leadStatuses?.where((o) => o.id == lead.status);
          if (match != null && match.isNotEmpty) {
            statusLabel = match.first.label ?? lead.status;
            statusColor = hexToColor(match.first.color);
          }

          return RefreshIndicator(
            onRefresh: () => ref.refresh(leadDetailProvider(leadId).future),
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                safeBottomInset(context) + 16,
              ),
              children: [
                // --- Header: avatar + name/company block ------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: _brandColor.withValues(alpha: 0.15),
                      child: Text(
                        lead.firstName.isNotEmpty
                            ? lead.firstName[0].toUpperCase()
                            : '?',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: _brandColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  lead.firstName.isNotEmpty
                                      ? lead.firstName
                                      : lead.fullName,
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (lead.isReEnquiry)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFEA580C,
                                    ).withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Re-enquiry ×${lead.reEnquiryCount}',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: const Color(0xFFEA580C),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          _IconLine(
                            icon: Icons.person_outline,
                            text: lead.fullName,
                          ),
                          if (lead.company != null &&
                              lead.company!.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            _IconLine(
                              icon: Icons.apartment_outlined,
                              text: lead.company!,
                            ),
                          ],
                          // `lastEnquiryDate` is set to `now` server-side
                          // exactly when a re-enquiry is detected (see
                          // duplicateLeadService.ts), so gating on
                          // `isReEnquiry` here — not just a non-null date —
                          // is what actually means "this lead re-enquired",
                          // and keeping the time (not just the date, like
                          // Next Follow-up below) is the whole point of
                          // showing it, not just a duplicate of the date.
                          if (lead.isReEnquiry &&
                              lead.lastEnquiryDate != null) ...[
                            const SizedBox(height: 2),
                            _IconLine(
                              icon: Icons.replay_outlined,
                              text:
                                  'Last re-enquiry: ${lead.lastEnquiryDate!.toLocal().toString().split('.').first} '
                                  '(×${lead.reEnquiryCount})',
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // --- Quick actions: Call / WhatsApp / Email ---------------
                LeadQuickActions(phone: lead.phone, email: lead.email),
                if (lead.secondaryPhone != null &&
                    lead.secondaryPhone!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _brandColor,
                        side: BorderSide(
                          color: theme.colorScheme.outlineVariant,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => launchUriWithFeedback(
                        context,
                        Uri(scheme: 'tel', path: lead.secondaryPhone),
                      ),
                      icon: const Icon(Icons.call, size: 18),
                      label: Text('Call secondary: ${lead.secondaryPhone}'),
                    ),
                  ),
                ],
                const SizedBox(height: 20),

                // --- Details ------------------------------------------------
                _SectionCard(
                  icon: Icons.description_outlined,
                  title: 'Details',
                  children: [
                    _DetailRow(
                      icon: Icons.person_outline,
                      label: 'Owner',
                      value: lead.assignedTo != null
                          ? '${lead.assignedTo!.firstName} ${lead.assignedTo!.lastName}'
                          : 'Unassigned',
                    ),
                    _DetailRow(
                      icon: Icons.track_changes_outlined,
                      label: 'Source',
                      value: humanizeSnakeCase(lead.displaySource),
                    ),
                    if (lead.campaignName != null &&
                        lead.campaignName!.isNotEmpty)
                      _DetailRow(
                        icon: Icons.campaign_outlined,
                        label: 'Campaign',
                        value: lead.campaignName!,
                      ),
                    if (lead.enquiryAbout != null &&
                        lead.enquiryAbout!.isNotEmpty)
                      _DetailRow(
                        icon: Icons.info_outline,
                        label: 'Enquiry About',
                        value: lead.enquiryAbout!,
                        longText: true,
                        isLast: lead.createdAt == null,
                      ),
                    if (lead.createdAt != null)
                      _DetailRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Created',
                        value: lead.createdAt!
                            .toLocal()
                            .toString()
                            .split('.')
                            .first,
                        isLast: true,
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // --- Status + follow-up -------------------------------------
                _SectionCard(
                  icon: Icons.flag_outlined,
                  title: 'Status',
                  trailing: Container(
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
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          statusLabel,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: statusColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: [
                    const SizedBox(height: 4),
                    _ChevronButton(
                      label: 'Change Status',
                      onTap: actionState.isLoading
                          ? null
                          : () => _pickStatus(context, ref, lead),
                    ),
                    const Divider(height: 28),
                    _DetailRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Next Follow-up',
                      value: lead.nextFollowUp != null
                          ? '${lead.nextFollowUp!.toLocal()}'.split('.').first
                          : 'Not scheduled',
                      isLast: true,
                    ),
                    const SizedBox(height: 12),
                    _ChevronButton(
                      label: 'Schedule Follow-up',
                      onTap: actionState.isLoading
                          ? null
                          : () => _pickNextFollowUp(context, ref),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // --- Move to Pipeline ----------------------------------------
                // Converts this lead into an Account + Contact + Opportunity
                // server-side. Disabled until at least one product is attached
                // (backend hard-blocks this too, see showConvertLeadSheet's
                // doc comment).
                _ChevronButton(
                  label: 'Move to Pipeline',
                  leadingIcon: Icons.trending_up,
                  filled: true,
                  onTap: () async {
                    final opportunityId = await showConvertLeadSheet(
                      context,
                      ref,
                      lead,
                    );
                    if (opportunityId != null && context.mounted) {
                      context.go('/opportunities/$opportunityId');
                    }
                  },
                ),
                if (lead.potentialValue > 0) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _IconBadge(icon: Icons.payments_outlined),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Potential Value',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          lead.potentialValue.toStringAsFixed(0),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: _brandColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.chevron_right,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),

                // --- Products -------------------------------------------------
                _SectionCard(
                  icon: Icons.inventory_2_outlined,
                  title: 'Products',
                  trailing: TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: _brandColor),
                    onPressed: () => showLeadProductsEditorSheet(
                      context,
                      ref,
                      leadId: leadId,
                      current: lead.products ?? const [],
                    ),
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: const Text('Edit'),
                  ),
                  children: [
                    if (!lead.hasProducts)
                      Text(
                        'No products attached yet.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    else
                      ...lead.products!.map(
                        (p) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.customName ?? p.product?.name ?? 'Product',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Text(
                                'Qty: ${p.quantity}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                p.price.toStringAsFixed(0),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                LeadNotesSection(leadId: leadId),
                const SizedBox(height: 16),
                LeadActivityTabs(leadId: leadId),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(leadDetailProvider(leadId)),
        ),
      ),
    );
  }
}

/// Small icon-badge used as the leading element of every section card's
/// header (Details/Status/Products) and the Potential Value row — a light
/// brand-green circle behind a brand-green icon, matching the design's
/// consistent "icon in a soft-colored circle" motif.
class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: _brandColor.withValues(alpha: 0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: _brandColor),
    );
  }
}

/// A small grey icon + text line — used under the header name for the
/// contact's full name / company / last-enquiry date rows.
class _IconLine extends StatelessWidget {
  const _IconLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 15, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

/// Rounded white card with an icon-badge + title header (optionally a
/// trailing widget, e.g. the status pill or "Edit"/"Add Note" action) —
/// the shared shell for the Details/Status/Products cards and (via its own
/// near-identical header, see that file) the Notes section.
class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.children,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _IconBadge(icon: icon),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

/// One icon+label / value row inside a [_SectionCard] — a thin divider
/// trails every row except the last one in its card.
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
    this.longText = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  /// Free-text fields (e.g. "Enquiry About") can run well past what fits
  /// next to a right-aligned label — the inline `Spacer()` + `Flexible`
  /// layout below only gives the value HALF the remaining row width (they
  /// share flex 1:1), so anything longer than a couple words got
  /// ellipsis-cut even though nothing here set `maxLines`. This puts the
  /// value on its own full-width line below the label instead, with no
  /// overflow/ellipsis at all — it just wraps as many lines as it needs.
  final bool longText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (!longText) ...[
                const SizedBox(width: 12),
                // `Expanded` (not `Spacer` + `Flexible`, which split the
                // remaining width 1:1 between an empty gap and the value —
                // the value only ever got HALF the row) — this gives the
                // value ALL the space left after the label, and no
                // `overflow`/`maxLines` at all so it wraps freely instead of
                // ever getting cut. "Owner"/"Source"/"Created"/"Next
                // Follow-up" all run long enough (full names, full
                // date+time strings) to have been hitting this.
                Expanded(
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (longText) ...[
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          if (!isLast) ...[
            const SizedBox(height: 10),
            Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ],
        ],
      ),
    );
  }
}

/// Full-width rounded button with a trailing chevron — either outlined
/// brand-green ("Change Status"/"Schedule Follow-up") or filled brand-green
/// ("Move to Pipeline", with a leading icon too).
class _ChevronButton extends StatelessWidget {
  const _ChevronButton({
    required this.label,
    required this.onTap,
    this.filled = false,
    this.leadingIcon,
  });

  final String label;
  final VoidCallback? onTap;
  final bool filled;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        if (leadingIcon != null) ...[
          Icon(
            leadingIcon,
            color: filled ? Colors.white : _brandColor,
            size: 20,
          ),
          const SizedBox(width: 10),
        ],
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: filled ? Colors.white : _brandColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Icon(Icons.chevron_right, color: filled ? Colors.white : _brandColor),
      ],
    );

    if (filled) {
      return SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: _brandColor,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: onTap,
          child: content,
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: _brandColor),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onTap,
        child: content,
      ),
    );
  }
}
