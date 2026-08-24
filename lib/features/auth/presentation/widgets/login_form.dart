import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../providers/session_provider.dart';

// Login also accepts the backend's plain `userId` field, not just an email
// (see AuthRepository.login) — so this only enforces email *shape* when the
// input actually looks like an email attempt (contains '@'); a bare userId
// is left alone.
final _emailLikePattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    // Both fields feed the button's enabled state, so it must rebuild as
    // the user types — not just on submit.
    _emailController.addListener(_onFieldsChanged);
    _passwordController.addListener(_onFieldsChanged);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onFieldsChanged);
    _passwordController.removeListener(_onFieldsChanged);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onFieldsChanged() => setState(() {});

  bool get _canSubmit =>
      _emailController.text.trim().isNotEmpty && _passwordController.text.isNotEmpty;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    await ref.read(sessionControllerProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  // Rounded, white-filled field styling with a static border — no color/bg
  // shift on focus, only the text cursor indicates focus (explicit design
  // request, overriding Material's default focused-border color change).
  InputDecoration _fieldDecoration({required String hint, required IconData icon, Widget? suffixIcon}) {
    final radius = BorderRadius.circular(40);
    final border = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: Colors.grey.shade300),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: Colors.red.shade400),
    );
    // Content padding is 18 vertical, so icon edge-padding is set to match
    // (18) for a visually square, evenly-balanced inset on all four sides.
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 18, right: 12),
        child: Icon(icon, size: 20, color: Colors.grey.shade500),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      suffixIcon: suffixIcon == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(right: 18),
              child: suffixIcon,
            ),
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(sessionControllerProvider);
    final isLoading = sessionState.isLoading;
    const inputTextStyle = TextStyle(color: Colors.black, fontSize: 16);

    final loginError = sessionState.hasError && !isLoading
        ? (sessionState.error is ApiException
            ? (sessionState.error as ApiException).message
            : 'Something went wrong. Please try again.')
        : null;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.username],
            style: inputTextStyle,
            decoration: _fieldDecoration(hint: 'Your Email', icon: Icons.person_outline),
            validator: (value) {
              final trimmed = value?.trim() ?? '';
              if (trimmed.isEmpty) return 'Enter your email or user ID';
              if (trimmed.contains('@') && !_emailLikePattern.hasMatch(trimmed)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
            style: inputTextStyle,
            decoration: _fieldDecoration(
              hint: 'Password',
              icon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                visualDensity: VisualDensity.compact,
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter your password';
              return null;
            },
            onFieldSubmitted: (_) => _submit(),
          ),
          if (loginError != null) ...[
            const SizedBox(height: 16),
            Text(
              loginError,
              style: TextStyle(color: Colors.red.shade700, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 40),
          FilledButton(
            onPressed: (isLoading || !_canSubmit) ? null : _submit,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF5B21B6),
              disabledBackgroundColor: const Color(0xFF5B21B6).withValues(alpha: 0.6),
              minimumSize: const Size.fromHeight(58),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                  )
                : const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
