import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/providers/session_provider.dart';

/// Shared "Log out?" confirm-then-log-out flow — used by both the global
/// app bar's logout action and the Settings screen's Log Out row, so the
/// wording/behavior stays identical wherever it's triggered from. Wording
/// depends on whether logging out actually lands on the login screen or
/// just switches to another saved account — see `SessionController.logout`'s
/// doc comment for the mechanics.
Future<void> confirmAndLogout(BuildContext context, WidgetRef ref) async {
  final hasOtherSaved = (await ref.read(sessionControllerProvider.notifier).loadSavedAccounts()).isNotEmpty;
  if (!context.mounted) return;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Log out?'),
      content: Text(
        hasOtherSaved
            ? "You'll be switched to another account you're still signed into on this device."
            : "You'll need to sign in again to use this account.",
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
        TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Log Out')),
      ],
    ),
  );
  if (confirmed == true) {
    await ref.read(sessionControllerProvider.notifier).logout();
  }
}
