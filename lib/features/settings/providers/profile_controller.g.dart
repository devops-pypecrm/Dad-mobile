// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileControllerHash() => r'0a3b7dc05999cad2cd3a622f83d43e8d6c683afd';

/// Backs the Account and Notification Settings screens — fetches the full
/// `UserProfile` once, then applies partial updates via `PUT /api/profile`.
/// Every successful write also calls `SessionController.refreshFromServer()`
/// so the drawer header (name/photo) and anything else reading
/// `sessionControllerProvider` picks up the change immediately, not just
/// this screen's own state.
///
/// Copied from [ProfileController].
@ProviderFor(ProfileController)
final profileControllerProvider =
    AutoDisposeAsyncNotifierProvider<ProfileController, UserProfile>.internal(
      ProfileController.new,
      name: r'profileControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProfileController = AutoDisposeAsyncNotifier<UserProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
