import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/push_notifications_controller.dart';

const _channel = MethodChannel('com.pypecrm.dad_mobile/installer');
const _snoozeKey = 'push_battery_prompt_snoozed_until';

/// Invisible — lives in `AppShell`'s outer `Stack`. Two jobs that keep push
/// notifications reliable on aggressive Android brands (Xiaomi, Oppo, Vivo,
/// Realme, Samsung):
///
/// 1. Every time the app comes to the foreground it re-sends this phone's
///    FCM token to the server (at most once every 10 minutes), so a token
///    that rotated or was lost while the app sat in the background is
///    recovered immediately instead of "after the next login".
/// 2. If the app is still subject to battery optimisation (the usual reason
///    pushes are accepted by Firebase but never appear), asks the user once
///    to switch it to Unrestricted. "Not now" hides it for 3 days.
class PushReliabilityChecker extends ConsumerStatefulWidget {
  const PushReliabilityChecker({super.key});

  @override
  ConsumerState<PushReliabilityChecker> createState() => _PushReliabilityCheckerState();
}

class _PushReliabilityCheckerState extends ConsumerState<PushReliabilityChecker> with WidgetsBindingObserver {
  DateTime? _lastRegister;
  bool _dialogOpen = false;
  bool _askedThisSession = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _run());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _run();
  }

  Future<void> _run() async {
    if (!Platform.isAndroid || !mounted) return;

    final now = DateTime.now();
    if (_lastRegister == null || now.difference(_lastRegister!) > const Duration(minutes: 10)) {
      _lastRegister = now;
      unawaited(ref.read(pushNotificationsControllerProvider.notifier).reRegisterCurrentToken());
    }

    await _maybeAskBatteryExemption();
  }

  Future<bool?> _isExempt() async {
    try {
      return await _channel.invokeMethod<bool>('isIgnoringBatteryOptimizations');
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }

  Future<void> _maybeAskBatteryExemption() async {
    if (_dialogOpen || _askedThisSession) return;
    final exempt = await _isExempt();
    if (exempt != false || !mounted) return; // null = couldn't check → don't nag

    try {
      final prefs = await SharedPreferences.getInstance();
      final until = prefs.getInt(_snoozeKey) ?? 0;
      if (DateTime.now().millisecondsSinceEpoch < until) return;
    } catch (_) {}
    if (!mounted) return;

    _dialogOpen = true;
    _askedThisSession = true;
    final allow = await showDialog<bool>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.notifications_active_rounded, size: 32),
        title: const Text('Keep notifications working'),
        content: const Text(
          'Your phone may stop PypeCRM from showing follow-up reminders and new-lead alerts '
          'when the app is closed. Tap "Allow" and choose "Allow" / "Unrestricted" so you never '
          'miss one.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Not now')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Allow')),
        ],
      ),
    );
    _dialogOpen = false;

    if (allow == true) {
      try {
        await _channel.invokeMethod<bool>('requestIgnoreBatteryOptimizations');
      } catch (_) {}
    } else {
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(
          _snoozeKey,
          DateTime.now().add(const Duration(days: 3)).millisecondsSinceEpoch,
        );
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
