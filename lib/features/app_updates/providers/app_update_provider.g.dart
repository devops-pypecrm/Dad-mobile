// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$latestMobileReleaseHash() =>
    r'e980de0bfb99c3bb8c3230953d74da6c3c981012';

/// The server's latest published release for this app. Swallows every
/// failure (network, 500, malformed response) to `null` rather than
/// throwing — a broken update check must never surface an error UI or
/// block anything else in the app; it just silently skips the check.
///
/// Copied from [latestMobileRelease].
@ProviderFor(latestMobileRelease)
final latestMobileReleaseProvider =
    AutoDisposeFutureProvider<AppRelease?>.internal(
      latestMobileRelease,
      name: r'latestMobileReleaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$latestMobileReleaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LatestMobileReleaseRef = AutoDisposeFutureProviderRef<AppRelease?>;
String _$currentPackageInfoHash() =>
    r'7e59829d6e685a0494b8bb96e3e9654fa274b4e7';

/// This running build's own version, read once via `package_info_plus`
/// (backed by the platform's real package manager metadata, not the
/// `pubspec.yaml` value directly — the two can drift if a build overrides
/// `--build-name`/`--build-number`).
///
/// Copied from [currentPackageInfo].
@ProviderFor(currentPackageInfo)
final currentPackageInfoProvider =
    AutoDisposeFutureProvider<PackageInfo>.internal(
      currentPackageInfo,
      name: r'currentPackageInfoProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentPackageInfoHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentPackageInfoRef = AutoDisposeFutureProviderRef<PackageInfo>;
String _$availableUpdateHash() => r'e0119bf94da331f10210ebe704094c6336dfc6d4';

/// Non-null only when the server's `versionCode` is strictly newer than
/// this running build's own build number — the single source of truth
/// both the update dialog and the Updates screen check against.
///
/// Copied from [availableUpdate].
@ProviderFor(availableUpdate)
final availableUpdateProvider = AutoDisposeFutureProvider<AppRelease?>.internal(
  availableUpdate,
  name: r'availableUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableUpdateRef = AutoDisposeFutureProviderRef<AppRelease?>;
String _$pendingUpdatePromptHash() =>
    r'eb6c52412ff513d183d1cf6700755baa8092dcca';

/// The update dialog's actual trigger condition: an update exists AND the
/// user hasn't already dismissed the popup for this exact version.
///
/// Copied from [pendingUpdatePrompt].
@ProviderFor(pendingUpdatePrompt)
final pendingUpdatePromptProvider =
    AutoDisposeFutureProvider<AppRelease?>.internal(
      pendingUpdatePrompt,
      name: r'pendingUpdatePromptProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pendingUpdatePromptHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingUpdatePromptRef = AutoDisposeFutureProviderRef<AppRelease?>;
String _$dismissedUpdateVersionHash() =>
    r'c41dcf3150cd6f8d375df4c91ac903603ba9276f';

/// Tracks which update the user has already dismissed the popup for, so it
/// doesn't nag again on every subsequent launch — it reappears only once a
/// *newer* version than the dismissed one is published.
///
/// Copied from [DismissedUpdateVersion].
@ProviderFor(DismissedUpdateVersion)
final dismissedUpdateVersionProvider =
    AutoDisposeAsyncNotifierProvider<DismissedUpdateVersion, int?>.internal(
      DismissedUpdateVersion.new,
      name: r'dismissedUpdateVersionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dismissedUpdateVersionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DismissedUpdateVersion = AutoDisposeAsyncNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
