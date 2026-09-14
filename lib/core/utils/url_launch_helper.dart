import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/app_snackbar.dart';

/// Shared `tel:`/`https:`/`mailto:` launcher for the call/WhatsApp/email
/// quick actions (lead card, lead quick actions, lead detail's secondary
/// phone). Requires the `<queries>` entries in
/// `android/app/src/main/AndroidManifest.xml` for `canLaunchUrl` to report
/// true on Android 11+ — without those, package-visibility restrictions
/// make it silently return false for every one of these schemes regardless
/// of whether a handling app is actually installed. Always
/// `LaunchMode.externalApplication` so a `https://wa.me/...` link opens
/// WhatsApp/the browser rather than an in-app webview, and surfaces a
/// SnackBar instead of no-op-ing when nothing can handle the link (no SIM,
/// no WhatsApp, no browser) so a broken button doesn't look identical to a
/// working one that was just tapped.
Future<void> launchUriWithFeedback(BuildContext context, Uri uri) async {
  try {
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      showAppSnackBar(context, "Couldn't open that — no app found to handle it.", isError: true);
    }
  } catch (_) {
    if (context.mounted) {
      showAppSnackBar(context, "Couldn't open that — no app found to handle it.", isError: true);
    }
  }
}
