import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/calls_repository.dart';
import '../domain/call_stats.dart';

part 'call_stats_provider.g.dart';

/// Selected stats period — mirrors the web `/calls` page's `period` state
/// (`today`/`week`/`month`).
final callStatsPeriodProvider = StateProvider<String>((ref) => 'week');

@riverpod
Future<CallStats> callStats(FutureProviderRef<CallStats> ref) {
  final period = ref.watch(callStatsPeriodProvider);
  return ref.watch(callsRepositoryProvider).getCallStats(period: period);
}
