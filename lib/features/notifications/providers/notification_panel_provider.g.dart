// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_panel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationPanelOpenHash() =>
    r'225f70648694134c1f6fc0b389f4521236219468';

/// Whether the notification tray (opened from the bell in [GlobalAppBar]) is
/// currently expanded. `keepAlive` and shared app-wide (not per-screen
/// state) so the tray, the AppBar's icon-fade/morph, and the bell itself all
/// stay in lockstep regardless of which of the 5 tab screens is active —
/// there's exactly one bell/tray pair live at a time, hosted once in
/// `AppShell`, not duplicated per screen.
///
/// Copied from [NotificationPanelOpen].
@ProviderFor(NotificationPanelOpen)
final notificationPanelOpenProvider =
    NotifierProvider<NotificationPanelOpen, bool>.internal(
      NotificationPanelOpen.new,
      name: r'notificationPanelOpenProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationPanelOpenHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NotificationPanelOpen = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
