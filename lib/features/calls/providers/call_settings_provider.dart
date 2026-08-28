import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/call_settings_repository.dart';
import '../domain/call_settings.dart';

part 'call_settings_provider.g.dart';

@riverpod
class CallSettingsController extends _$CallSettingsController {
  @override
  Future<CallSettings> build() => ref.watch(callSettingsRepositoryProvider).getSettings();

  /// Optimistic local update — the settings screen calls this on every
  /// toggle/field change, then [save] persists the accumulated state.
  void stage(CallSettings Function(CallSettings current) update) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncValue.data(update(current));
  }

  Future<void> save() async {
    final current = state.valueOrNull;
    if (current == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(callSettingsRepositoryProvider).updateSettings(current),
    );
  }
}
