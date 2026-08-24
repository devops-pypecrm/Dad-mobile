import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead.dart';
import 'lead_detail_provider.dart';
import 'leads_list_provider.dart';

part 'edit_lead_controller.g.dart';

/// Backs the Edit Lead screen — same field set as Dad-frontend's
/// `EditLeadDialog` (firstName*/phone* required, everything else optional).
@riverpod
class EditLeadController extends _$EditLeadController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<Lead?> submit({
    required String firstName,
    String? lastName,
    String? email,
    required String phone,
    String? secondaryPhone,
    String? company,
    String? enquiryAbout,
    String? status,
  }) async {
    state = const AsyncValue.loading();
    Lead? updated;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      updated = await repository.updateLead(
        leadId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        secondaryPhone: secondaryPhone,
        company: company,
        enquiryAbout: enquiryAbout,
        status: status,
      );
      ref.invalidate(leadDetailProvider(leadId));
      ref.read(leadsListProvider.notifier).refresh();
    });
    return updated;
  }
}
