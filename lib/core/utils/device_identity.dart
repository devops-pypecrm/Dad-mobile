import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// This device's platform/model/app-version, sent once at login so the
/// backend's `UserSession` row (and the Settings > Devices screen reading
/// it back) can show something human-recognizable — "Redmi Note 12" rather
/// than a bare platform string. Best-effort: any plugin failure just
/// produces a null field rather than blocking login.
class DeviceIdentity {
  const DeviceIdentity({required this.platform, this.deviceName, this.appVersion});

  final String platform;
  final String? deviceName;
  final String? appVersion;

  static Future<DeviceIdentity> current() async {
    String? deviceName;
    String? appVersion;

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
    } catch (_) {}

    try {
      final deviceInfo = DeviceInfoPlugin();
      if (kIsWeb) {
        final info = await deviceInfo.webBrowserInfo;
        deviceName = info.browserName.name;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        final info = await deviceInfo.androidInfo;
        deviceName = '${info.manufacturer} ${info.model}'.trim();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        final info = await deviceInfo.iosInfo;
        deviceName = info.utsname.machine;
      }
    } catch (_) {}

    return DeviceIdentity(
      platform: kIsWeb ? 'web' : defaultTargetPlatform.name,
      deviceName: deviceName,
      appVersion: appVersion,
    );
  }
}
