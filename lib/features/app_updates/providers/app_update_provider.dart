import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/app_release_repository.dart';
import '../domain/app_release.dart';

part 'app_update_provider.g.dart';

const _dismissedVersionCodeKey = 'app_updates_dismissed_version_code';

/// The server's latest published release for this app. Swallows every
/// failure (network, 500, malformed response) to `null` rather than
/// throwing — a broken update check must never surface an error UI or
/// block anything else in the app; it just silently skips the check.
@riverpod
Future<AppRelease?> latestMobileRelease(AutoDisposeFutureProviderRef<AppRelease?> ref) async {
  try {
    return await ref.watch(appReleaseRepositoryProvider).getLatestRelease(platform: 'mobile');
  } catch (_) {
    return null;
  }
}

/// This running build's own version, read once via `package_info_plus`
/// (backed by the platform's real package manager metadata, not the
/// `pubspec.yaml` value directly — the two can drift if a build overrides
/// `--build-name`/`--build-number`).
@riverpod
Future<PackageInfo> currentPackageInfo(AutoDisposeFutureProviderRef<PackageInfo> ref) =>
    PackageInfo.fromPlatform();

/// Non-null only when the server's `versionCode` is strictly newer than
/// this running build's own build number — the single source of truth
/// both the update dialog and the Updates screen check against.
@riverpod
Future<AppRelease?> availableUpdate(AutoDisposeFutureProviderRef<AppRelease?> ref) async {
  final release = await ref.watch(latestMobileReleaseProvider.future);
  if (release == null) return null;

  final info = await ref.watch(currentPackageInfoProvider.future);
  final currentBuildNumber = int.tryParse(info.buildNumber) ?? 0;

  return release.versionCode > currentBuildNumber ? release : null;
}

/// Tracks which update the user has already dismissed the popup for, so it
/// doesn't nag again on every subsequent launch — it reappears only once a
/// *newer* version than the dismissed one is published.
@riverpod
class DismissedUpdateVersion extends _$DismissedUpdateVersion {
  @override
  Future<int?> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_dismissedVersionCodeKey);
  }

  Future<void> dismiss(int versionCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_dismissedVersionCodeKey, versionCode);
    state = AsyncValue.data(versionCode);
  }
}

/// The update dialog's actual trigger condition: an update exists AND the
/// user hasn't already dismissed the popup for this exact version.
@riverpod
Future<AppRelease?> pendingUpdatePrompt(AutoDisposeFutureProviderRef<AppRelease?> ref) async {
  final update = await ref.watch(availableUpdateProvider.future);
  if (update == null) return null;

  final dismissed = await ref.watch(dismissedUpdateVersionProvider.future);
  return dismissed == update.versionCode ? null : update;
}
