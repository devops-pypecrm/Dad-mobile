import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef DialerStatus = ({bool installed, bool isDefault});

/// Dart side of `MainActivity.kt`'s `getDialerStatus` / `openDialer` —
/// whether the Pype Dialer companion app is installed and set as the
/// phone's default Phone app.
class DialerCompanion {
  const DialerCompanion();

  static const _channel = MethodChannel('com.pypecrm.dad_mobile/installer');

  /// Null off Android or if the check itself fails — never treat "couldn't
  /// check" as "not set up".
  Future<DialerStatus?> status() async {
    if (!Platform.isAndroid) return null;
    try {
      final raw = await _channel.invokeMapMethod<String, Object?>('getDialerStatus');
      if (raw == null) return null;
      return (installed: raw['installed'] == true, isDefault: raw['isDefault'] == true);
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }

  Future<bool> open() async => (await _channel.invokeMethod<bool>('openDialer')) ?? false;
}

final dialerCompanionProvider = Provider<DialerCompanion>((ref) => const DialerCompanion());
