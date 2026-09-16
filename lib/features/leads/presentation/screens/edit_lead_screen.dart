import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/lead.dart';
import '../../domain/phone_number_utils.dart';
import '../../providers/edit_lead_controller.dart';
import '../widgets/lead_status_field.dart';
import '../widgets/phone_country_code_field.dart';

/// Same field set as Dad-frontend's `EditLeadDialog`: firstName*/phone*
/// required, lastName/email/secondaryPhone/company/enquiryAbout/status
/// optional. Pushed from the Lead Detail screen's "Edit" action.
class EditLeadScreen extends ConsumerStatefulWidget {
  const EditLeadScreen({super.key, required this.lead});

  final Lead lead;

  @override
  ConsumerState<EditLeadScreen> createState() => _EditLeadScreenState();
}

class _EditLeadScreenState extends ConsumerState<EditLeadScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _firstNameController = TextEditingController(
    text: widget.lead.firstName,
  );
  late final _lastNameController = TextEditingController(
    text: widget.lead.lastName ?? '',
  );
  late final _emailController = TextEditingController(
    text: widget.lead.email ?? '',
  );
  // `phone` is stored raw/national (no dial code embedded) whenever
  // `phoneCountryCode` is present — only fall back to guessing a dial code
  // out of the digits themselves (which defaults to India when it can't
  // tell) for legacy leads created before that field existed. Using
  // `splitDialCode` unconditionally here used to silently re-prepend "91"
  // onto an already-correct number on every save, even without touching
  // the phone field, because it always assumed +91 for any bare number.
  late final _hasStoredCountryCode =
      (widget.lead.phoneCountryCode ?? '').isNotEmpty;
  late final _splitPhone = _hasStoredCountryCode
      ? null
      : splitDialCode(widget.lead.phone);
  late final _phoneController = TextEditingController(
    text: _hasStoredCountryCode ? widget.lead.phone : _splitPhone!.localNumber,
  );
  late String _dialCode = _hasStoredCountryCode
      ? widget.lead.phoneCountryCode!
      : _splitPhone!.dialCode;
  late final _secondaryPhoneController = TextEditingController(
    text: widget.lead.secondaryPhone ?? '',
  );
  late final _companyController = TextEditingController(
    text: widget.lead.company ?? '',
  );
  late final _enquiryAboutController = TextEditingController(
    text: widget.lead.enquiryAbout ?? '',
  );
  late String _status = widget.lead.status;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _secondaryPhoneController.dispose();
    _companyController.dispose();
    _enquiryAboutController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    if (kProductGatedStatuses.contains(_status) &&
        !widget.lead.hasProducts &&
        _status != widget.lead.status) {
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
      return;
    }

    final updated = await ref
        .read(editLeadControllerProvider(widget.lead.id).notifier)
        .submit(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          phone: sanitizeLocalNumber(_phoneController.text),
          phoneCountryCode: _dialCode,
          secondaryPhone: _secondaryPhoneController.text.trim(),
          company: _companyController.text.trim(),
          enquiryAbout: _enquiryAboutController.text.trim(),
          status: _status,
        );

    if (!mounted) return;
    if (updated != null) {
      Navigator.of(context).pop();
      showAppSnackBar(context, 'Lead updated.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(editLeadControllerProvider(widget.lead.id));
    final leadStatuses = ref
        .watch(sessionControllerProvider)
        .valueOrNull
        ?.organisation
        .leadStatuses;

    ref.listen(editLeadControllerProvider(widget.lead.id), (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        showAppSnackBar(context, error.toString(), isError: true);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Lead')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            safeBottomInset(context) + 16,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First name *',
                    ),
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                        ? 'Required'
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last name',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12),
            PhoneCountryCodeField(
              controller: _phoneController,
              label: 'Phone *',
              initialCountryCode: _dialCode,
              onCountryChanged: (code) =>
                  setState(() => _dialCode = code.dialCode ?? _dialCode),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Phone is required'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _secondaryPhoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Secondary phone',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(
                labelText: 'Company',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _enquiryAboutController,
              decoration: const InputDecoration(
                labelText: 'Enquiry about',
              ),
            ),
            const SizedBox(height: 12),
            LeadStatusField(
              options: leadStatuses,
              value: _status,
              onChanged: (value) => setState(() => _status = value),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: editState.isLoading ? null : _submit,
              child: editState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
