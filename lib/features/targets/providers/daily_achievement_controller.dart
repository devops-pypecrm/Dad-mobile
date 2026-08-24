import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/targets_repository.dart';
import '../domain/daily_achievement.dart';

part 'daily_achievement_controller.g.dart';

/// Fetched once per app session (keepAlive) — the backend itself tracks
/// `lastNotifiedDate` server-side, so this doesn't need to re-poll; the UI
/// just needs to know once, on launch, whether to show the daily prompt.
@Riverpod(keepAlive: true)
class DailyAchievementController extends _$DailyAchievementController {
  @override
  Future<DailyAchievement> build() {
    return ref.watch(targetsRepositoryProvider).getDailyAchievement();
  }

  /// Called after the user dismisses the daily-motivation sheet, so the
  /// backend doesn't ask again today (`Organisation`-independent per-user
  /// `SalesTarget.lastNotifiedDate`).
  Future<void> acknowledge() async {
    final current = state.valueOrNull;
    if (current == null) return;
    try {
      await ref.read(targetsRepositoryProvider).acknowledgeDailyNotification();
      state = AsyncValue.data(current.copyWith(showNotification: false));
    } catch (_) {
      // Non-critical — worst case the prompt shows again next launch.
    }
  }
}
