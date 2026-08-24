import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/opportunities_repository.dart';
import '../domain/opportunity.dart';

part 'opportunity_detail_provider.g.dart';

@riverpod
Future<Opportunity> opportunityDetail(AutoDisposeFutureProviderRef<Opportunity> ref, String id) {
  final repository = ref.watch(opportunitiesRepositoryProvider);
  return repository.getOpportunityById(id);
}
