// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsControllerHash() =>
    r'33f286ce94f7ef9d3d8c810b6e14402c98a73b93';

/// Drives both the AppBar bell badge (via `.unreadCount`) and the full
/// `/notifications` screen. Polls every 30s while alive — same interval as
/// Dad-frontend's `refetchInterval: 30000` on both `NotificationPopover`
/// and the `/notifications` page (`useQuery`), since that polling is that
/// app's actual freshness mechanism (its Socket.io listener only triggers
/// the same refetch a beat earlier, plus a toast — see
/// NotificationPopover.tsx). `keepAlive` so the badge stays live across
/// screens without every screen needing to re-subscribe.
///
/// [PushNotificationsController]'s foreground FCM handler also calls
/// [refresh] directly, giving near-instant badge updates when a push
/// arrives while the app is open — without needing a separate Socket.io
/// client dependency just to replicate what FCM already tells us.
///
/// Copied from [NotificationsController].
@ProviderFor(NotificationsController)
final notificationsControllerProvider =
    AsyncNotifierProvider<NotificationsController, NotificationsPage>.internal(
      NotificationsController.new,
      name: r'notificationsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NotificationsController = AsyncNotifier<NotificationsPage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
