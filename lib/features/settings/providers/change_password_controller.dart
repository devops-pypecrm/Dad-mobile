import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/settings_repository.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  FutureOr<bool> build() => false;

  /// `state.hasValue && state.value == true` on success — the screen reacts
  /// to that by logging the user out (see [SettingsRepository.changePassword]'s
  /// doc comment on why that's mandatory, not optional, right after this).
  Future<void> submit({required String currentPassword, required String newPassword}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(settingsRepositoryProvider).changePassword(
            currentPassword: currentPassword,
            newPassword: newPassword,
          );
      return true;
    });
  }

  void reset() => state = const AsyncValue.data(false);
}
