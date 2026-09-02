import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../providers/apk_download_controller.dart';
import '../../providers/apk_download_state.dart';
import '../../providers/app_update_provider.dart';

const _brandColor = Color(0xFF578732);

/// Sidebar-only destination (see `AppDrawer`) — shows the running build's
/// own version alongside whatever's currently published, and drives the
/// in-app download+install flow (`ApkDownloadController`) entirely —
/// no more bouncing out to pypecrm.com/download in a browser. Reachable
/// any time, not just when an update happens to be due, so a user can
/// always double-check what they're running.
class UpdatesScreen extends ConsumerWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentInfoAsync = ref.watch(currentPackageInfoProvider);
    final updateAsync = ref.watch(availableUpdateProvider);
    final downloadState = ref.watch(apkDownloadControllerProvider);

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Updates'),
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          ref.refresh(latestMobileReleaseProvider.future),
          ref.refresh(availableUpdateProvider.future),
        ]),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: currentInfoAsync.when(
                  data: (info) => Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: _brandColor.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.smartphone_outlined, color: _brandColor),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('You have', style: theme.textTheme.bodySmall),
                            Text(
                              'Version ${info.version} (${info.buildNumber})',
                              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Text('Could not read app version: $error'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            updateAsync.when(
              data: (update) {
                if (update == null) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Color(0xFF16A34A)),
                          SizedBox(width: 12),
                          Expanded(child: Text("You're up to date.")),
                        ],
                      ),
                    ),
                  );
                }
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.new_releases_outlined, color: _brandColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Version ${update.versionName} is available',
                                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        if (update.releaseNotes.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          Text(update.releaseNotes, style: theme.textTheme.bodyMedium),
                        ],
                        const SizedBox(height: 16),
                        _DownloadInstallSection(state: downloadState),
                      ],
                    ),
                  ),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.invalidate(availableUpdateProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The actual download/permission/install UI, switched entirely on
/// [ApkDownloadState] — kept as its own widget so `UpdatesScreen.build`
/// isn't one giant nested `switch`.
class _DownloadInstallSection extends ConsumerWidget {
  const _DownloadInstallSection({required this.state});

  final ApkDownloadState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(apkDownloadControllerProvider.notifier);

    return state.when(
      idle: () => SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          onPressed: () => notifier.downloadAndInstall(),
          icon: const Icon(Icons.download_outlined),
          label: const Text('Download & Install'),
        ),
      ),
      downloading: (progress) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(value: progress > 0 ? progress : null, minHeight: 8),
          ),
          const SizedBox(height: 8),
          Text(
            progress > 0 ? 'Downloading… ${(progress * 100).toStringAsFixed(0)}%' : 'Downloading…',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      permissionNeeded: (filePath) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PypeCRM needs permission to install updates. '
            'Enable "Allow from this source" in the settings screen, then come back and tap Install.',
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: notifier.openPermissionSettings,
                  child: const Text('Open Settings'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () => notifier.retryInstall(filePath),
                  child: const Text('Install'),
                ),
              ),
            ],
          ),
        ],
      ),
      installLaunched: (filePath) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.check_circle_outline, color: Color(0xFF16A34A)),
              SizedBox(width: 8),
              Expanded(child: Text('Installer opened — follow the prompt to finish updating.')),
            ],
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => notifier.retryInstall(filePath),
            child: const Text('Reopen installer'),
          ),
        ],
      ),
      error: (message) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Download failed: $message', style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => notifier.downloadAndInstall(),
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ),
        ],
      ),
    );
  }
}
