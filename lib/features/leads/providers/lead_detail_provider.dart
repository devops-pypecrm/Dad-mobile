import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead.dart';

part 'lead_detail_provider.g.dart';

@riverpod
Future<Lead> leadDetail(AutoDisposeFutureProviderRef<Lead> ref, String id) {
  final repository = ref.watch(leadsRepositoryProvider);
  return repository.getLeadById(id);
}
