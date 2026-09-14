import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../providers/change_password_controller.dart';

const _brandColor = Color(0xFF578732);

/// Change Password form — `POST /api/profile/change-password`
/// (Dad-backend/src/controllers/profileController.ts). Requires the
/// current password (server re-verifies it, not just a client-side gate)
/// and enforces the same strength policy as sign-up (12+ chars, mixed
/// case, a number, a special character — see `PasswordValidator`).
///
/// A successful change immediately invalidates every JWT already issued
/// for this account, including the one this screen is currently using —
/// the backend bumps `User.tokenVersion` specifically so that happens.
/// This screen logs the user out right after a success (see `_onSuccess`)
/// rather than leaving them on a session that would just 401 on its next
/// request — the same "please log in again" the backend's own response
/// message says, made explicit instead of surfacing as a confusing crash.
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  List<String>? _serverValidationErrors;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _serverValidationErrors = null);
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    await ref.read(changePasswordControllerProvider.notifier).submit(
          currentPassword: _currentController.text,
          newPassword: _newController.text,
        );
  }

  Future<void> _onSuccess() async {
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Password changed'),
        content: const Text(
          'Your password was updated. For your security, you need to log in again with your new password.',
        ),
        actions: [
          FilledButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
        ],
      ),
    );
    if (!mounted) return;
    // The router reacts to the session going null and redirects to /login
    // on its own (see app_router.dart's `redirect`) — no manual navigation
    // needed here.
    await ref.read(sessionControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePasswordControllerProvider);

    ref.listen(changePasswordControllerProvider, (previous, next) {
      if (next.hasValue && next.value == true) {
        _onSuccess();
        return;
      }
      final error = next.error;
      if (error != null && !next.isLoading) {
        setState(() => _serverValidationErrors = error is ApiException ? error.errors : null);
        showAppSnackBar(context, error.toString(), isError: true);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PasswordField(
                controller: _currentController,
                label: 'Current Password',
                obscure: _obscureCurrent,
                onToggleObscure: () => setState(() => _obscureCurrent = !_obscureCurrent),
                validator: (value) => (value == null || value.isEmpty) ? 'Enter your current password' : null,
              ),
              const SizedBox(height: 16),
              _PasswordField(
                controller: _newController,
                label: 'New Password',
                obscure: _obscureNew,
                onToggleObscure: () => setState(() => _obscureNew = !_obscureNew),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter a new password';
                  if (value.length < 12) return 'Must be at least 12 characters';
                  if (value == _currentController.text) return 'Must be different from your current password';
                  return null;
                },
              ),
              if (_serverValidationErrors != null && _serverValidationErrors!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDC2626).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final message in _serverValidationErrors!)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.close, size: 14, color: Color(0xFFDC2626)),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  message,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(color: const Color(0xFFDC2626)),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'At least 12 characters, with uppercase, lowercase, a number, and a special character.',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ),
              const SizedBox(height: 16),
              _PasswordField(
                controller: _confirmController,
                label: 'Confirm New Password',
                obscure: _obscureConfirm,
                onToggleObscure: () => setState(() => _obscureConfirm = !_obscureConfirm),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Re-enter your new password';
                  if (value != _newController.text) return 'Passwords do not match';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: _brandColor, minimumSize: const Size.fromHeight(48)),
                onPressed: state.isLoading ? null : _submit,
                child: state.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                      )
                    : const Text('Update Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.controller,
    required this.label,
    required this.obscure,
    required this.onToggleObscure,
    required this.validator,
  });

  final TextEditingController controller;
  final String label;
  final bool obscure;
  final VoidCallback onToggleObscure;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          onPressed: onToggleObscure,
        ),
      ),
      validator: validator,
    );
  }
}
