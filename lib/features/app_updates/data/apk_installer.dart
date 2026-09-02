import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apk_installer.g.dart';

@Riverpod(keepAlive: true)
ApkInstaller apkInstaller(ApkInstallerRef ref) => const ApkInstaller();

/// Dart-side handle to `MainActivity.kt`'s install MethodChannel — Android
/// only, since the in-app-download-and-install flow is an Android-specific
/// concern (iOS doesn't allow sideloaded installs at all).
class ApkInstaller {
  const ApkInstaller();

  static const _channel = MethodChannel('com.pypecrm.dad_mobile/installer');

  /// Whether this app currently has the "Install unknown apps" grant.
  /// Always `true` below Android 8 (API 26), which has no such per-app
  /// restriction.
  Future<bool> canRequestInstalls() async =>
      (await _channel.invokeMethod<bool>('canRequestInstalls')) ?? false;

  /// Opens system Settings scoped to this app's "Install unknown apps"
  /// toggle — Android doesn't allow granting this programmatically, the
  /// user has to flip it by hand.
  Future<void> openInstallPermissionSettings() => _channel.invokeMethod('openInstallPermissionSettings');

  /// Hands the downloaded .apk at [filePath] to the system package
  /// installer (via a FileProvider content:// URI — see MainActivity.kt).
  /// This only *launches* Android's own install/update confirmation UI; it
  /// can't complete the install silently — see the no-MDM caveat discussed
  /// with the user.
  Future<void> installApk(String filePath) => _channel.invokeMethod('installApk', {'filePath': filePath});
}
