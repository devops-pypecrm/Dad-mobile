import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../domain/installment_input.dart';
import '../../domain/opportunity.dart';
import '../../providers/opportunity_actions_controller.dart';

const _brandPurple = Color(0xFF5B21B6);

/// Close Won — mirrors Dad-frontend's `CloseWonDialog.tsx`: a payment-type
/// choice (Fully Paid / Partially Paid / Full EMI), a down-payment field
/// for Partial, and a manually-built installment list (date + amount rows,
/// add/remove) for Partial and Full EMI — with a live running total and a
/// mismatch warning, matching web's own validation rather than a simplified
/// "count + interval" auto-split (there's no such thing server-side either
/// — see `OpportunitiesRepository.closeWon`'s doc comment, EMI is a
/// manual, interest-free split with no org-level defaults at all).
Future<void> showCloseWonSheet(BuildContext context, Opportunity opportunity) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _CloseWonForm(opportunity: opportunity),
  );
}

/// Close Lost — a single required reason, mirrors `CloseLostDialog.tsx`'s
/// 5-character minimum before allowing submit (the backend itself doesn't
/// enforce a minimum, this is purely a UX guard matching web).
Future<void> showCloseLostSheet(BuildContext context, String opportunityId) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _CloseLostForm(opportunityId: opportunityId),
  );
}

enum _PaymentType { paid, partial, emi }

class _CloseWonForm extends ConsumerStatefulWidget {
  const _CloseWonForm({required this.opportunity});

  final Opportunity opportunity;

  @override
  ConsumerState<_CloseWonForm> createState() => _CloseWonFormState();
}

class _CloseWonFormState extends ConsumerState<_CloseWonForm> {
  _PaymentType _paymentType = _PaymentType.paid;
  final _paidAmountController = TextEditingController();
  final List<(TextEditingController amount, ValueNotifier<DateTime?> date)>
  _installmentRows = [];

  @override
  void dispose() {
    _paidAmountController.dispose();
    for (final (amountController, dateNotifier) in _installmentRows) {
      amountController.dispose();
      dateNotifier.dispose();
    }
    super.dispose();
  }

  void _addRow() {
    setState(() {
      _installmentRows.add((
        TextEditingController(),
        ValueNotifier<DateTime?>(null),
      ));
    });
  }

  void _removeRow(int index) {
    setState(() {
      final (amountController, dateNotifier) = _installmentRows.removeAt(index);
      amountController.dispose();
      dateNotifier.dispose();
    });
  }

  double get _paidAmount =>
      double.tryParse(_paidAmountController.text.trim()) ?? 0;

  double get _installmentTotal => _installmentRows.fold<double>(
    0,
    (sum, row) => sum + (double.tryParse(row.$1.text.trim()) ?? 0),
  );

  /// What the installment rows are expected to sum to for the current
  /// [_paymentType] — the full amount for EMI, whatever's left after the
  /// down payment for Partial.
  double get _installmentTarget => _paymentType == _PaymentType.emi
      ? widget.opportunity.amount
      : (widget.opportunity.amount - _paidAmount);

  bool get _installmentsMatch =>
      (_installmentTotal - _installmentTarget).abs() < 0.1;

  bool get _canSubmit {
    switch (_paymentType) {
      case _PaymentType.paid:
        return true;
      case _PaymentType.partial:
        // Installments are optional for Partial — only required to match
        // once at least one row exists.
        if (_paidAmount <= 0 || _paidAmount > widget.opportunity.amount)
          return false;
        if (_installmentRows.isEmpty) return true;
        return _installmentsMatch &&
            _installmentRows.every((r) => r.$2.value != null);
      case _PaymentType.emi:
        if (_installmentRows.isEmpty) return false;
        return _installmentsMatch &&
            _installmentRows.every((r) => r.$2.value != null);
    }
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    final controller = ref.read(
      opportunityActionsControllerProvider(widget.opportunity.id).notifier,
    );

    final installments = _installmentRows
        .map(
          (r) => InstallmentInput(
            dueDate: r.$2.value!,
            amount: double.parse(r.$1.text.trim()),
          ),
        )
        .toList();

    final success = switch (_paymentType) {
      _PaymentType.paid => await controller.closeWon(paymentType: 'paid'),
      _PaymentType.partial => await controller.closeWon(
        paymentType: 'partial',
        paidAmount: _paidAmount,
        installments: installments.isEmpty ? null : installments,
      ),
      _PaymentType.emi => await controller.closeWon(
        paymentType: 'emi',
        installments: installments,
      ),
    };

    if (!mounted) return;
    if (!success) {
      final error = ref
          .read(opportunityActionsControllerProvider(widget.opportunity.id))
          .error;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("Couldn't close deal: $error")));
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final saving = ref
        .watch(opportunityActionsControllerProvider(widget.opportunity.id))
        .isLoading;

    return Padding(
      padding: EdgeInsets.only(bottom: sheetBottomPadding(context, extra: 0)),
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Icon(Icons.emoji_events, color: const Color(0xFF16A34A)),
                const SizedBox(width: 8),
                Text('Close as Won', style: theme.textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Deal value: ${widget.opportunity.amount.toStringAsFixed(0)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            for (final option in _PaymentType.values)
              RadioListTile<_PaymentType>(
                contentPadding: EdgeInsets.zero,
                activeColor: _brandPurple,
                value: option,
                groupValue: _paymentType,
                title: Text(switch (option) {
                  _PaymentType.paid => 'Fully Paid',
                  _PaymentType.partial => 'Partially Paid',
                  _PaymentType.emi => 'Full EMI',
                }),
                onChanged: (value) => setState(() {
                  _paymentType = value!;
                  // Matches web resetting installment rows on payment-type
                  // switch — a partial payment's rows target a different
                  // sum than EMI's, so stale rows would just show a
                  // mismatch warning against the wrong number.
                  for (final row in _installmentRows) {
                    row.$1.dispose();
                    row.$2.dispose();
                  }
                  _installmentRows.clear();
                  if (value != _PaymentType.partial)
                    _paidAmountController.clear();
                }),
              ),
            if (_paymentType == _PaymentType.partial) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _paidAmountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Down Payment Received',
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 8),
              Text(
                'Balance to be covered: ${(_installmentTarget).toStringAsFixed(0)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (_paymentType == _PaymentType.partial ||
                _paymentType == _PaymentType.emi) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Installments',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _addRow,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add'),
                  ),
                ],
              ),
              for (var i = 0; i < _installmentRows.length; i++)
                _InstallmentRow(
                  index: i,
                  amountController: _installmentRows[i].$1,
                  dateNotifier: _installmentRows[i].$2,
                  onChanged: () => setState(() {}),
                  onRemove: () => _removeRow(i),
                ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Total: ${_installmentTotal.toStringAsFixed(0)} / ${_installmentTarget.toStringAsFixed(0)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: _installmentsMatch || _installmentRows.isEmpty
                          ? theme.colorScheme.onSurfaceVariant
                          : theme.colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF16A34A),
                ),
                onPressed: (_canSubmit && !saving) ? _submit : null,
                child: saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Mark as Won'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstallmentRow extends StatelessWidget {
  const _InstallmentRow({
    required this.index,
    required this.amountController,
    required this.dateNotifier,
    required this.onChanged,
    required this.onRemove,
  });

  final int index;
  final TextEditingController amountController;
  final ValueNotifier<DateTime?> dateNotifier;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: ValueListenableBuilder<DateTime?>(
              valueListenable: dateNotifier,
              builder: (context, date, _) => OutlinedButton(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                    initialDate: date ?? DateTime.now(),
                  );
                  if (picked != null) {
                    dateNotifier.value = picked;
                    onChanged();
                  }
                },
                child: Text(
                  date != null
                      ? '${date.toLocal()}'.split(' ').first
                      : 'Due date',
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Amount'),
              onChanged: (_) => onChanged(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}

class _CloseLostForm extends ConsumerStatefulWidget {
  const _CloseLostForm({required this.opportunityId});

  final String opportunityId;

  @override
  ConsumerState<_CloseLostForm> createState() => _CloseLostFormState();
}

class _CloseLostFormState extends ConsumerState<_CloseLostForm> {
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  bool get _canSubmit => _reasonController.text.trim().length >= 5;

  Future<void> _submit() async {
    if (!_canSubmit) return;
    final success = await ref
        .read(
          opportunityActionsControllerProvider(widget.opportunityId).notifier,
        )
        .closeLost(_reasonController.text.trim());
    if (!mounted) return;
    if (!success) {
      final error = ref
          .read(opportunityActionsControllerProvider(widget.opportunityId))
          .error;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("Couldn't close deal: $error")));
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final saving = ref
        .watch(opportunityActionsControllerProvider(widget.opportunityId))
        .isLoading;
    final tooShort = _reasonController.text.isNotEmpty && !_canSubmit;

    return Padding(
      padding: EdgeInsets.only(bottom: sheetBottomPadding(context, extra: 0)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.cancel_outlined, color: Color(0xFFDC2626)),
                const SizedBox(width: 8),
                Text('Close as Lost', style: theme.textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reasonController,
              autofocus: true,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Reason *',
                hintText: 'e.g. Budget constraints, chose a competitor…',
                errorText: tooShort
                    ? 'Please provide a bit more detail (min 5 characters).'
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFDC2626),
                ),
                onPressed: (_canSubmit && !saving) ? _submit : null,
                child: saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Mark as Lost'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
