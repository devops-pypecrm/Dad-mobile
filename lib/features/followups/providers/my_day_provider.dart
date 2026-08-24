import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/followups_repository.dart';
import '../domain/followup.dart';
import '../domain/followups_page.dart';

part 'my_day_provider.g.dart';

/// "My Day" — today's follow-ups. Loads the backend's default view (omitting
/// `status` forwards to the server default of `not_started`/`in_progress`,
/// see Dad-backend/src/controllers/followUpController.ts). The
/// overdue/today/upcoming `counts` block is server-computed truth; this
/// notifier does not recompute those numbers itself.
@Riverpod(keepAlive: true)
class MyDay extends _$MyDay {
  @override
  Future<FollowUpsPage> build() {
    final repository = ref.watch(followUpsRepositoryProvider);
    return repository.getFollowUps(limit: 50);
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() {
      final repository = ref.read(followUpsRepositoryProvider);
      return repository.getFollowUps(limit: 50);
    });
  }

  Future<void> markDone(String id) async {
    final current = state.valueOrNull;
    if (current == null) return;

    // Optimistic update so the checkbox responds instantly.
    final optimisticTasks = current.tasks
        .map((t) => t.id == id ? t.copyWith(status: kFollowUpCompleted) : t)
        .toList();
    state = AsyncValue.data(current.copyWith(tasks: optimisticTasks));

    try {
      final repository = ref.read(followUpsRepositoryProvider);
      await repository.updateStatus(id, kFollowUpCompleted);
      await refresh();
    } catch (e) {
      // Roll back on failure.
      state = AsyncValue.data(current);
      rethrow;
    }
  }

  Future<void> reschedule(String id, DateTime dueDate) async {
    final repository = ref.read(followUpsRepositoryProvider);
    await repository.reschedule(id, dueDate);
    await refresh();
  }
}
