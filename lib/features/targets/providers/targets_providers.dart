import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dashboard/domain/sales_target.dart';
import '../data/targets_repository.dart';
import '../domain/team_target.dart';

part 'targets_providers.g.dart';

@riverpod
Future<List<SalesTarget>> myTargets(AutoDisposeFutureProviderRef<List<SalesTarget>> ref) {
  return ref.watch(targetsRepositoryProvider).getMyTargets();
}

@riverpod
Future<List<TeamTarget>> teamTargets(AutoDisposeFutureProviderRef<List<TeamTarget>> ref) {
  return ref.watch(targetsRepositoryProvider).getTeamTargets();
}
