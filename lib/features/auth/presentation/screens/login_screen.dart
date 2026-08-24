import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/session_provider.dart';
import '../widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Login-attempt errors (wrong password, deactivated account, network
    // failure, etc.) are shown inline above the button by LoginForm itself,
    // not here — see its `loginError` text. This screen only handles the
    // separate "you were bounced here by a forced logout" notice below.

    // By the time the router redirects here after a forced 401 logout, the
    // session transition has already happened — `ref.listen` above only
    // catches transitions that occur *while this widget exists*, so a
    // direct one-shot read is used instead (see
    // SessionController.consumeForcedLogoutFlag). Explains to the user why
    // they landed back on login instead of leaving it silent.
    if (ref.read(sessionControllerProvider.notifier).consumeForcedLogoutFlag()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(content: Text('Your session expired — please log in again.')));
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/app_logo.png', height: 128),
                  const SizedBox(height: 16),
                  Text(
                    'Pype CRM',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Sign in to your organisation',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 32),
                  const LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
