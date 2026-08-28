import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Low-key, factual explainer for the separate call-recording companion
/// app (Phase 5 of Dad-mobile/CALL_RECORDING_PLAN.md) — reached only via a
/// small AppBar icon on the Call Logs screen, never a home-screen banner or
/// onboarding highlight. Google Play has suspended apps for *promoting*
/// call recording done elsewhere, so this stays plain informational copy,
/// not a pitch.
///
/// The actual recording engine can't live in this Play-distributed app at
/// all (RECORD_AUDIO + call-state + Accessibility Service are restricted
/// for Play-listed apps) — see the "why" in CALL_RECORDING_PLAN.md.
class CallRecordingInfoScreen extends StatelessWidget {
  const CallRecordingInfoScreen({super.key});

  /// The company's own domain (matches AppConfig's production origin) —
  /// this specific page is a deliverable the web team still needs to
  /// build/host (a static page + the sideloadable APK); this link is a
  /// placeholder path on a real, already-used domain, not a fabricated one.
  static const _downloadUrl = 'https://pypecrm.com/call-recorder';

  Future<void> _openDownloadPage(BuildContext context) async {
    final uri = Uri.parse(_downloadUrl);
    final messenger = ScaffoldMessenger.of(context);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      messenger.showSnackBar(const SnackBar(content: Text('Could not open the download page.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Call recording')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Automatic call recording requires a separate companion app, '
            'installed on this phone alongside PypeCRM.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Text(
            "It's a separate download (not through the Play Store) because "
            "recording calls needs Android permissions the Play Store "
            "doesn't allow for apps like this one.",
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 8),
          Text(
            'Once installed, sign in with the same PypeCRM account — '
            'recorded calls (where your organisation has recording enabled) '
            'will show up here automatically.',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 28),
          OutlinedButton.icon(
            icon: const Icon(Icons.open_in_new),
            label: const Text('Get the companion app'),
            onPressed: () => _openDownloadPage(context),
          ),
        ],
      ),
    );
  }
}
