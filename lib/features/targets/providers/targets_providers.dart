import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider, StateProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dashboard/domain/sales_target.dart';
import '../data/targets_repository.dart';
import '../domain/target_won_deal.dart';
import '../domain/team_target.dart';

part 'targets_providers.g.dart';

@riverpod
Future<List<SalesTarget>> myTargets(AutoDisposeFutureProviderRef<List<SalesTarget>> ref) {
  return ref.watch(targetsRepositoryProvider).getMyTargets(month: _monthKey(ref.watch(targetMonthFilterProvider)));
}

@riverpod
Future<List<TeamTarget>> teamTargets(AutoDisposeFutureProviderRef<List<TeamTarget>> ref) {
  return ref.watch(targetsRepositoryProvider).getTeamTargets(month: _monthKey(ref.watch(targetMonthFilterProvider)));
}

/// Month the Targets screen is filtered to (first day of that month), or null for all months.
final targetMonthFilterProvider = StateProvider<DateTime?>((ref) => null);

/// Won deals counted toward a single target; loaded when its card is expanded.
final targetWonDealsProvider = FutureProvider.autoDispose.family<List<TargetWonDeal>, String>(
  (ref, targetId) => ref.watch(targetsRepositoryProvider).getTargetWonDeals(targetId),
);


String? _monthKey(DateTime? m) => m == null ? null : '${m.year}-${m.month.toString().padLeft(2, '0')}';
