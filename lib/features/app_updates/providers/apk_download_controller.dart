import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/apk_installer.dart';
import '../data/app_release_repository.dart';
import 'apk_download_state.dart';

part 'apk_download_controller.g.dart';

/// Downloads the current .apk straight into this app's cache dir (see
/// AndroidManifest.xml's FileProvider `file_paths.xml`, which only exposes
/// that cache dir) and hands it to the system installer — replacing the
/// old flow of opening the browser to pypecrm.com/download and downloading
/// manually from there.
@riverpod
class ApkDownloadController extends _$ApkDownloadController {
  @override
  ApkDownloadState build() => const ApkDownloadState.idle();

  Future<void> downloadAndInstall({String platform = 'mobile'}) async {
    state = const ApkDownloadState.downloading(progress: 0);
    try {
      final dir = await getTemporaryDirectory();
      final savePath = '${dir.path}/pypecrm-update.apk';

      await ref.read(appReleaseRepositoryProvider).downloadApk(
            platform: platform,
            savePath: savePath,
            onProgress: (received, total) {
              if (total <= 0) return;
              state = ApkDownloadState.downloading(progress: received / total);
            },
          );

      await _attemptInstall(savePath);
    } catch (e) {
      state = ApkDownloadState.error(message: '$e');
    }
  }

  /// Re-attempts the install for an already-downloaded file — used after
  /// the user returns from granting the "Install unknown apps" permission,
  /// so they don't have to re-download the whole .apk just to retry.
  Future<void> retryInstall(String filePath) => _attemptInstall(filePath);

  Future<void> _attemptInstall(String filePath) async {
    final installer = ref.read(apkInstallerProvider);
    final canInstall = await installer.canRequestInstalls();
    if (!canInstall) {
      state = ApkDownloadState.permissionNeeded(filePath: filePath);
      return;
    }
    try {
      await installer.installApk(filePath);
      state = ApkDownloadState.installLaunched(filePath: filePath);
    } catch (e) {
      state = ApkDownloadState.error(message: '$e');
    }
  }

  Future<void> openPermissionSettings() => ref.read(apkInstallerProvider).openInstallPermissionSettings();

  void reset() => state = const ApkDownloadState.idle();
}
