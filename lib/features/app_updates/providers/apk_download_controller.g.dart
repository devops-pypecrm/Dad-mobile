// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apk_download_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apkDownloadControllerHash() =>
    r'79b1280bc4862718282ff91cd47be53b9c5fd825';

/// Downloads the current .apk straight into this app's cache dir (see
/// AndroidManifest.xml's FileProvider `file_paths.xml`, which only exposes
/// that cache dir) and hands it to the system installer — replacing the
/// old flow of opening the browser to pypecrm.com/download and downloading
/// manually from there.
///
/// Copied from [ApkDownloadController].
@ProviderFor(ApkDownloadController)
final apkDownloadControllerProvider =
    AutoDisposeNotifierProvider<
      ApkDownloadController,
      ApkDownloadState
    >.internal(
      ApkDownloadController.new,
      name: r'apkDownloadControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$apkDownloadControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ApkDownloadController = AutoDisposeNotifier<ApkDownloadState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
