import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_updates/providers/apk_download_controller.dart';
import '../../app_updates/providers/apk_download_state.dart';
import '../data/dialer_companion.dart';

/// Invisible — lives in `AppShell`'s outer `Stack` next to `UpdateChecker`.
/// On launch, and every time the app comes back to the foreground, checks
/// whether Pype Dialer is installed and set as the default Phone app; if
/// not, asks the user to finish that setup. "Not now" hides it until the
/// next app launch. The prompt closes by itself once setup is done.
class DialerSetupChecker extends ConsumerStatefulWidget {
  const DialerSetupChecker({super.key});

  @override
  ConsumerState<DialerSetupChecker> createState() => _DialerSetupCheckerState();
}

class _DialerSetupCheckerState extends ConsumerState<DialerSetupChecker> with WidgetsBindingObserver {
  bool _snoozed = false;
  bool _sheetOpen = false;
  final _status = ValueNotifier<DialerStatus?>(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _status.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _check();
  }

  Future<void> _check() async {
    final status = await ref.read(dialerCompanionProvider).status();
    if (!mounted || status == null) return;
    _status.value = status;
    final ready = status.installed && status.isDefault;
    if (ready && _sheetOpen) {
      Navigator.of(context, rootNavigator: true).maybePop();
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        const SnackBar(content: Text('Pype Dialer is set up — calls will now sync to the CRM.')),
      );
      return;
    }
    if (ready || _snoozed || _sheetOpen) return;
    _sheetOpen = true;
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isDismissible: false,
      enableDrag: false,
      showDragHandle: false,
      builder: (_) => _DialerSetupSheet(
        status: _status,
        onNotNow: () {
          _snoozed = true;
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
    _sheetOpen = false;
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class _DialerSetupSheet extends ConsumerWidget {
  const _DialerSetupSheet({required this.status, required this.onNotNow});

  final ValueNotifier<DialerStatus?> status;
  final VoidCallback onNotNow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final download = ref.watch(apkDownloadControllerProvider);

    return ValueListenableBuilder<DialerStatus?>(
      valueListenable: status,
      builder: (context, s, _) {
        final installed = s?.installed ?? false;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: scheme.primary.withValues(alpha: 0.12),
                  child: Icon(Icons.phone_in_talk_rounded, size: 30, color: scheme.primary),
                ),
                const SizedBox(height: 16),
                Text(
                  installed ? 'Finish setting up Pype Dialer' : 'Install Pype Dialer',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  installed
                      ? 'Open Pype Dialer and set it as your default Phone app so your calls, '
                          'call recordings and lead notes sync to the CRM.'
                      : 'Your calls sync to the CRM through the Pype Dialer app. Install it and set it '
                          'as your default Phone app to continue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: scheme.onSurfaceVariant),
                ),
                const SizedBox(height: 20),
                _Steps(installed: installed, isDefault: s?.isDefault ?? false),
                const SizedBox(height: 20),
                if (installed)
                  FilledButton(
                    onPressed: () => ref.read(dialerCompanionProvider).open(),
                    child: const Text('Open Pype Dialer'),
                  )
                else
                  _InstallButton(state: download),
                TextButton(onPressed: onNotNow, child: const Text('Not now')),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Steps extends StatelessWidget {
  const _Steps({required this.installed, required this.isDefault});

  final bool installed;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    Widget step(String text, bool done) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(done ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: 20, color: done ? const Color(0xFF16A34A) : Theme.of(context).colorScheme.outline),
              const SizedBox(width: 10),
              Expanded(child: Text(text)),
            ],
          ),
        );
    return Column(children: [
      step('Install Pype Dialer', installed),
      step('Set it as your default Phone app', isDefault),
    ]);
  }
}

/// Downloads the dialer .apk through the same in-app installer the CRM's
/// own updates use (`/app-releases/download/dialer`).
class _InstallButton extends ConsumerWidget {
  const _InstallButton({required this.state});

  final ApkDownloadState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(apkDownloadControllerProvider.notifier);
    return state.maybeWhen(
      downloading: (progress) => FilledButton(
        onPressed: null,
        child: Text('Downloading… ${(progress * 100).round()}%'),
      ),
      permissionNeeded: (filePath) => FilledButton(
        // Retry first: if the user already allowed installs and came back,
        // this goes straight to the installer; otherwise open the toggle.
        onPressed: () async {
          await controller.retryInstall(filePath);
          if (ref.read(apkDownloadControllerProvider) is ApkDownloadPermissionNeeded) {
            await controller.openPermissionSettings();
          }
        },
        child: const Text('Allow installs from CRM, then tap again'),
      ),
      installLaunched: (filePath) => FilledButton(
        onPressed: () => controller.retryInstall(filePath),
        child: const Text('Reopen installer'),
      ),
      error: (message) => FilledButton(
        onPressed: () => controller.downloadAndInstall(platform: 'dialer'),
        child: const Text('Download failed — try again'),
      ),
      orElse: () => FilledButton(
        onPressed: () => controller.downloadAndInstall(platform: 'dialer'),
        child: const Text('Download & install'),
      ),
    );
  }
}
