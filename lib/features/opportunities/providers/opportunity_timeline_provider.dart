import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/opportunities_repository.dart';
import '../domain/opportunity_timeline_item.dart';

part 'opportunity_timeline_provider.g.dart';

/// Backs the "Timeline & Files" tab on the Opportunity detail screen.
@riverpod
Future<List<OpportunityTimelineItem>> opportunityTimeline(
  AutoDisposeFutureProviderRef<List<OpportunityTimelineItem>> ref,
  String opportunityId,
) {
  return ref.watch(opportunitiesRepositoryProvider).getTimeline(opportunityId);
}
