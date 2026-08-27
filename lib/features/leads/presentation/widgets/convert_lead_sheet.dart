import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/lead.dart';
import '../../providers/lead_convert_controller.dart';

/// "Move to Pipeline" — matches Dad-frontend's `ConvertLeadDialog`: prefilled
/// Account/Contact/Deal name + amount, editable, submitted to
/// `POST /leads/:id/convert`. That endpoint hard-blocks with 400 if the
/// lead has no products, so this sheet refuses to even show the form in
/// that case (mirrors web forcing the product dialog open instead).
///
/// Returns the new Opportunity's id on success, so the caller can navigate
/// there — or `null` if the sheet was dismissed/failed.
Future<String?> showConvertLeadSheet(BuildContext context, WidgetRef ref, Lead lead) {
  if (!lead.hasProducts) {
    return showDialog<String?>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Products First'),
        content: const Text(
          'This lead has no products attached. Add at least one product before moving it to the pipeline.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
        ],
      ),
    );
  }

  return showModalBottomSheet<String?>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _ConvertLeadForm(lead: lead),
  );
}

class _ConvertLeadForm extends ConsumerStatefulWidget {
  const _ConvertLeadForm({required this.lead});

  final Lead lead;

  @override
  ConsumerState<_ConvertLeadForm> createState() => _ConvertLeadFormState();
}

class _ConvertLeadFormState extends ConsumerState<_ConvertLeadForm> {
  late final TextEditingController _dealName;
  late final TextEditingController _accountName;
  late final TextEditingController _contactName;
  late final TextEditingController _amount;

  @override
  void initState() {
    super.initState();
    final lead = widget.lead;
    final totalProductValue = (lead.products ?? const [])
        .fold<double>(0, (sum, p) => sum + p.price * p.quantity);
    _dealName = TextEditingController(text: lead.enquiryAbout ?? '${lead.fullName} deal');
    _accountName = TextEditingController(text: lead.company ?? lead.fullName);
    _contactName = TextEditingController(text: lead.fullName);
    _amount = TextEditingController(
      text: (totalProductValue > 0 ? totalProductValue : lead.potentialValue).toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _dealName.dispose();
    _accountName.dispose();
    _contactName.dispose();
    _amount.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final amount = double.tryParse(_amount.text.trim());
    if (_dealName.text.trim().isEmpty || amount == null) return;

    final opportunityId = await ref.read(leadConvertControllerProvider(widget.lead.id).notifier).convert(
          dealName: _dealName.text.trim(),
          amount: amount,
          accountName: _accountName.text.trim(),
          contactName: _contactName.text.trim(),
        );
    if (mounted) Navigator.of(context).pop(opportunityId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actionState = ref.watch(leadConvertControllerProvider(widget.lead.id));

    ref.listen(leadConvertControllerProvider(widget.lead.id), (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.toString())));
      }
    });

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Move to Pipeline', style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              'Creates an Account, Contact, and Opportunity from this lead.',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            TextField(controller: _dealName, decoration: const InputDecoration(labelText: 'Deal Name')),
            const SizedBox(height: 12),
            TextField(controller: _accountName, decoration: const InputDecoration(labelText: 'Account Name')),
            const SizedBox(height: 12),
            TextField(controller: _contactName, decoration: const InputDecoration(labelText: 'Contact Name')),
            const SizedBox(height: 12),
            TextField(
              controller: _amount,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: actionState.isLoading ? null : _submit,
                child: actionState.isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
