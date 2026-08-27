import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/convert_lead_result.dart';
import 'lead_detail_provider.dart';
import 'leads_list_provider.dart';

part 'lead_convert_controller.g.dart';

/// "Move to Pipeline" — wraps `LeadsRepository.convertLead`. The actual
/// account/contact/opportunity creation is a server-side transaction (see
/// that method's doc comment); this controller just tracks loading/error
/// state around the call and returns the new opportunity id on success so
/// the UI can navigate there.
@riverpod
class LeadConvertController extends _$LeadConvertController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<String?> convert({
    required String dealName,
    required double amount,
    String? accountName,
    String? contactName,
  }) async {
    state = const AsyncValue.loading();
    ConvertLeadResult? result;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      result = await repository.convertLead(
        leadId,
        dealName: dealName,
        amount: amount,
        accountName: accountName,
        contactName: contactName,
      );
      ref.invalidate(leadDetailProvider(leadId));
      ref.read(leadsListProvider.notifier).refresh();
    });
    return result?.opportunityId;
  }
}
