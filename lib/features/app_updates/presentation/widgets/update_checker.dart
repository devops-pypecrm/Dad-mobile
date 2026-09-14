import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../providers/app_update_provider.dart';

/// Invisible — lives as a sibling in `AppShell`'s outer `Stack` (same
/// pattern as `NotificationPanel`) purely to run the update check exactly
/// once per app session and pop the dialog when one's actually due,
/// regardless of which of the 5 tabs is showing.
class UpdateChecker extends ConsumerStatefulWidget {
  const UpdateChecker({super.key});

  @override
  ConsumerState<UpdateChecker> createState() => _UpdateCheckerState();
}

class _UpdateCheckerState extends ConsumerState<UpdateChecker> {
  // Tracks which versionCode the dialog has already been shown for in this
  // session — was a plain bool before, which meant a SECOND, newer release
  // published while the app stayed open (e.g. a live FCM `app_update` push
  // triggering a re-check) got silently suppressed forever after the first
  // dialog, since the bool never reset.
  int? _shownForVersionCode;

  @override
  Widget build(BuildContext context) {
    ref.listen(pendingUpdatePromptProvider, (previous, next) {
      final release = next.valueOrNull;
      if (release == null || _shownForVersionCode == release.versionCode) return;
      _shownForVersionCode = release.versionCode;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Update available'),
            content: Text('Version ${release.versionName} is available.\n\n${release.releaseNotes}'),
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(dismissedUpdateVersionProvider.notifier).dismiss(release.versionCode);
                  Navigator.of(context).pop();
                },
                child: const Text('Later'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.push(AppRoutes.updates);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        );
      });
    });

    return const SizedBox.shrink();
  }
}
