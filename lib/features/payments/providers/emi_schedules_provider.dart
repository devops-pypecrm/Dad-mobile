import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/payments_repository.dart';
import '../domain/emi_schedule_summary.dart';

part 'emi_schedules_provider.g.dart';

@riverpod
class EmiSchedules extends _$EmiSchedules {
  @override
  Future<List<EmiScheduleSummary>> build({String status = 'active'}) {
    return ref.watch(paymentsRepositoryProvider).getSchedules(status: status);
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(paymentsRepositoryProvider).getSchedules(status: status),
    );
  }
}
