import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead.dart';

part 're_enquiries_provider.g.dart';

/// `GET /api/leads/re-enquiries` — no pagination/filters on this endpoint
/// (see `LeadsRepository.getReEnquiryLeads`'s doc comment), so this is
/// just a thin future wrapper, not a list controller like `leadsListProvider`.
@riverpod
Future<List<Lead>> reEnquiries(AutoDisposeFutureProviderRef<List<Lead>> ref) {
  return ref.watch(leadsRepositoryProvider).getReEnquiryLeads();
}
