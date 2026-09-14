import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../widgets/settings_row.dart';

/// "Privacy & Security" section, reached from Settings — today this only
/// holds Change Password (the only thing actually requested); add further
/// security-related options here as real needs come up.
class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy & Security')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SettingsGroup(
          children: [
            SettingsRow(
              icon: Icons.lock_outline,
              iconColor: const Color(0xFF22C55E),
              title: 'Change Password',
              subtitle: 'Update your password using your current one',
              onTap: () => context.push(AppRoutes.changePassword),
            ),
          ],
        ),
      ),
    );
  }
}
