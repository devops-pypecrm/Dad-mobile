import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import 'lead_activity_providers.dart';

part 'lead_re_enquiry_split_controller.g.dart';

/// "Create as separate lead" from the Re-Enquiry History tab — wraps
/// `LeadsRepository.splitReEnquiryIntoLead`. The confirmation warning (same
/// phone number as the original, possible future mix-ups) is shown by the
/// caller before this is ever invoked; this controller just tracks
/// loading/error state and refreshes the history list on success so the
/// split event shows as already split.
@riverpod
class LeadReEnquirySplitController extends _$LeadReEnquirySplitController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<String?> split({required int eventIndex}) async {
    state = const AsyncValue.loading();
    String? newLeadId;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      newLeadId = await repository.splitReEnquiryIntoLead(
        leadId,
        eventIndex: eventIndex,
        confirmed: true,
      );
      ref.invalidate(leadReEnquiryHistoryProvider(leadId));
    });
    return newLeadId;
  }
}
