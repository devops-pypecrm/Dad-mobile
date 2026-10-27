// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pushNotificationsControllerHash() =>
    r'38e71fb5a56474467ad28f691d113d3dac39922e';

/// Wires FCM end to end: requests permission, registers/refreshes the
/// device token against `POST /api/users/device-token`, shows a local
/// notification when a message arrives in the foreground, and deep-links to
/// the relevant screen on tap. Started once from the Dashboard (see
/// DashboardScreen) so it only runs once the user is authenticated — device
/// registration needs a valid JWT.
///
/// Copied from [PushNotificationsController].
@ProviderFor(PushNotificationsController)
final pushNotificationsControllerProvider =
    AsyncNotifierProvider<PushNotificationsController, void>.internal(
      PushNotificationsController.new,
      name: r'pushNotificationsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pushNotificationsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PushNotificationsController = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
