import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/providers/session_provider.dart';
import '../data/settings_repository.dart';
import '../domain/notification_preferences.dart';
import '../domain/user_profile.dart';

part 'profile_controller.g.dart';

/// Backs the Account and Notification Settings screens — fetches the full
/// `UserProfile` once, then applies partial updates via `PUT /api/profile`.
/// Every successful write also calls `SessionController.refreshFromServer()`
/// so the drawer header (name/photo) and anything else reading
/// `sessionControllerProvider` picks up the change immediately, not just
/// this screen's own state.
@riverpod
class ProfileController extends _$ProfileController {
  @override
  Future<UserProfile> build() {
    return ref.watch(settingsRepositoryProvider).getProfile();
  }

  Future<void> updateDetails({String? firstName, String? lastName, String? phone, String? position}) async {
    await _update({
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (phone != null) 'phone': phone,
      if (position != null) 'position': position,
    });
  }

  Future<void> uploadAndSetPhoto(File file) async {
    final repository = ref.read(settingsRepositoryProvider);
    final url = await repository.uploadPhoto(file);
    await _update({'profileImage': url});
  }

  Future<void> updateNotificationPreferences(NotificationPreferences preferences) async {
    await _update({'notificationPreferences': preferences.toJson()});
  }

  Future<void> _update(Map<String, dynamic> data) async {
    final repository = ref.read(settingsRepositoryProvider);
    final updated = await repository.updateProfile(data);
    state = AsyncValue.data(updated);
    await ref.read(sessionControllerProvider.notifier).refreshFromServer();
  }
}
