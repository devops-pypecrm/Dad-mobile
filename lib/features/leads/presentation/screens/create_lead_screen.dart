import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/text_format.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../users/providers/users_provider.dart';
import '../../domain/lead.dart';
import '../../domain/phone_number_utils.dart';
import '../../providers/create_lead_controller.dart';
import '../widgets/assignee_picker_field.dart';
import '../widgets/lead_status_field.dart';
import '../widgets/phone_country_code_field.dart';

/// "New Lead" form — same field set as Dad-frontend's `QuickAddLeadDialog`
/// (minus org custom fields and the phone country-code picker). Presented
/// both as a full route (`/leads/new`) and as a tall `DraggableScrollableSheet`
/// quick-add modal from the Leads list FAB (see `showQuickAddLeadSheet` in
/// `leads_list_screen.dart`) — the previous iteration of this form was a
/// short, fixed-height bottom sheet that got too cramped once the field set
/// grew to match web's fuller form, so this reintroduces the sheet
/// presentation with a generous scrollable height instead of reverting to
/// that cramped version.
class CreateLeadScreen extends ConsumerStatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  ConsumerState<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends ConsumerState<CreateLeadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _secondaryPhoneController = TextEditingController();
  final _companyController = TextEditingController();
  final _enquiryAboutController = TextEditingController();
  final _potentialValueController = TextEditingController();

  String _source = 'manual';
  String? _status;
  String? _assignedTo;
  String _dialCode = '+91';

  @override
  void dispose() {
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _secondaryPhoneController.dispose();
    _companyController.dispose();
    _enquiryAboutController.dispose();
    _potentialValueController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    await ref
        .read(createLeadControllerProvider.notifier)
        .submit(
          phone: combineDialCode(_dialCode, _phoneController.text),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          secondaryPhone: _secondaryPhoneController.text.trim(),
          company: _companyController.text.trim(),
          enquiryAbout: _enquiryAboutController.text.trim(),
          source: _source,
          status: _status,
          assignedTo: _assignedTo,
          potentialValue: double.tryParse(
            _potentialValueController.text.trim(),
          ),
        );

    final result = ref.read(createLeadControllerProvider).valueOrNull;
    if (!mounted) return;

    if (result != null) {
      Navigator.of(context).pop();
      showAppSnackBar(
        context,
        result.isReEnquiry
            ? '${result.lead.fullName} already exists — marked as a re-enquiry (#${result.reEnquiryCount ?? '-'}).'
            : '${result.lead.fullName} added.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createLeadControllerProvider);
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final leadStatuses = session?.organisation.leadStatuses;
    // Server-scoped list, matching web's QuickAddLeadDialog assignee field
    // (`getUsers()`) — not `hierarchyUsersProvider`, which is unrestricted
    // and only correct as input to the Assign-lead picker's client-side BFS.
    final usersAsync = ref.watch(scopedUsersProvider);
    final assignableUsersList = usersAsync.valueOrNull ?? const [];
    // A plain sales_rep with nobody reporting to them only ever gets
    // themself back from this server-scoped list (self + subordinates,
    // none here) — the same "nothing else to pick" signal already used for
    // the manager/team-lead checks in reports_screen.dart and
    // opportunities_list_screen.dart. In that case there's no real choice
    // to offer, so the picker is hidden entirely rather than shown with a
    // single, forced option.
    final canPickAssignee = assignableUsersList.length > 1;
    if (!canPickAssignee && session != null) {
      // Force-assign to the creator. Leaving `assignedTo` blank instead
      // would NOT default to "assign to me" — the backend's round-robin
      // distribution service picks it up whenever assignedToId is omitted
      // on create, which could hand this lead to someone else entirely.
      _assignedTo = session.id;
    }

    ref.listen(createLeadControllerProvider, (previous, next) {
      final error = next.error;
      if (error != null && !next.isLoading) {
        showAppSnackBar(context, error.toString(), isError: true);
      }
    });

    _status ??= (leadStatuses != null && leadStatuses.isNotEmpty)
        ? (leadStatuses.where((o) => o.isDefault).isNotEmpty
              ? leadStatuses.firstWhere((o) => o.isDefault).id
              : leadStatuses.first.id)
        : 'new';

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Lead'),
        // Explicit close button rather than relying on AppBar's automatic
        // back-arrow detection — that's unreliable when this widget is
        // shown inside a `showModalBottomSheet` route instead of a normal
        // pushed route.
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          // Extra bottom clearance beyond what `showQuickAddLeadSheet`'s
          // `useSafeArea: true` already adds — some OEM Android skins
          // (Color OS/Oppo, MIUI) under-report the gesture-nav bottom inset
          // to Flutter, so `SafeArea` alone still left the "Add Lead" button
          // tucked partly under the system nav bar on those devices. A hard
          // floor on top of the reported inset guarantees real clearance
          // regardless of what the OS claims (same pattern as AppShell's
          // `_minBottomClearance` and the Leads FAB).
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            math.max(MediaQuery.paddingOf(context).bottom, 24) + 16,
          ),
          children: [
            PhoneCountryCodeField(
              controller: _phoneController,
              label: 'Phone *',
              initialCountryCode: 'IN',
              onCountryChanged: (code) =>
                  setState(() => _dialCode = code.dialCode ?? '+91'),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Phone is required'
                  : null,
            ),
            const SizedBox(height: 12),
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
            TextFormField(
              controller: _potentialValueController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Potential value',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              initialValue: _source,
              decoration: const InputDecoration(
                labelText: 'Source',
              ),
              items: [
                for (final source in kSelectableLeadSources)
                  DropdownMenuItem(
                    value: source,
                    child: Text(humanizeSnakeCase(source)),
                  ),
              ],
              onChanged: (value) => setState(() => _source = value ?? _source),
            ),
            const SizedBox(height: 12),
            LeadStatusField(
              options: leadStatuses,
              value: _status!,
              onChanged: (value) => setState(() => _status = value),
            ),
            if (canPickAssignee) ...[
              const SizedBox(height: 12),
              usersAsync.when(
                data: (users) => AssigneePickerField(
                  users: users,
                  value: _assignedTo,
                  onChanged: (value) => setState(() => _assignedTo = value),
                ),
                loading: () => const LinearProgressIndicator(),
                error: (_, _) => const SizedBox.shrink(),
              ),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: createState.isLoading ? null : _submit,
              child: createState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const Text('Add Lead'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Opens [CreateLeadScreen] as a tall, scrollable modal sheet rather than a
/// full route push — the quick-add entry point from the Leads list's "+"
/// FAB. `isScrollControlled: true` lets the sheet grow to (near) full
/// height instead of the default half-screen cap, and `useSafeArea: true`
/// keeps it clear of the status bar — both needed since this form has
/// considerably more fields than a typical bottom sheet. `useRootNavigator:
/// true` is required because the Leads tab lives inside `AppShell`'s
/// `ShellRoute` — without it this sheet pushes onto the shell's nested
/// Navigator and renders BEHIND the floating bottom nav bar (a plain
/// `Scaffold.bottomNavigationBar`, always composited above `body`),
/// burying the form's own Submit button under it.
Future<void> showQuickAddLeadSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => const FractionallySizedBox(
      heightFactor: 0.92,
      child: CreateLeadScreen(),
    ),
  );
}
