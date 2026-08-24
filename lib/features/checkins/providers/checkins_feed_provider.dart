import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/checkins_repository.dart';
import '../domain/checkin.dart';

part 'checkins_feed_provider.g.dart';

/// The "Field Activity Feed" — today's check-ins across the visible team
/// (visibility is server-side, via `getVisibleUserIds`, see
/// Dad-backend/src/controllers/checkInController.ts).
@Riverpod(keepAlive: true)
class CheckInsFeed extends _$CheckInsFeed {
  @override
  Future<List<CheckIn>> build() {
    final repository = ref.watch(checkInsRepositoryProvider);
    final today = DateTime.now();
    final date =
        '${today.year.toString().padLeft(4, '0')}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return repository.getCheckIns(date: date);
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() {
      final repository = ref.read(checkInsRepositoryProvider);
      final today = DateTime.now();
      final date =
          '${today.year.toString().padLeft(4, '0')}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
      return repository.getCheckIns(date: date);
    });
  }
}
