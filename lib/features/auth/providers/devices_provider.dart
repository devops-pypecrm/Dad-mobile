import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/auth_repository.dart';
import '../domain/user_device_session.dart';
import 'session_provider.dart';

part 'devices_provider.g.dart';

/// Backs the Settings > Devices screen.
@riverpod
class Devices extends _$Devices {
  @override
  Future<List<UserDeviceSession>> build() {
    return ref.watch(authRepositoryProvider).getSessions();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).getSessions());
  }

  /// Returns `true` if the device just signed out was THIS one — the
  /// screen must log the user out locally right away in that case, not
  /// just refresh the list (see `AuthRepository.revokeSession`'s doc
  /// comment for why waiting for a natural 401 isn't good enough here:
  /// there's no guarantee another request fires soon on this screen).
  Future<bool> revoke(String sessionId) async {
    final wasCurrentDevice = await ref.read(authRepositoryProvider).revokeSession(sessionId);
    if (wasCurrentDevice) {
      await ref.read(sessionControllerProvider.notifier).logout();
    } else {
      await refresh();
    }
    return wasCurrentDevice;
  }
}
