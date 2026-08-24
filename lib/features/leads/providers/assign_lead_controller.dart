import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import 'lead_detail_provider.dart';
import 'leads_list_provider.dart';

part 'assign_lead_controller.g.dart';

/// Backs the Assign-lead bottom sheet — mirrors `AssignLeadDialog.tsx`'s
/// `PUT /leads/:id { assignedTo: userId }` exactly (a plain field update,
/// not a dedicated assign endpoint).
@riverpod
class AssignLeadController extends _$AssignLeadController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<void> assignTo(String userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      await repository.updateLead(leadId, assignedTo: userId);
      ref.invalidate(leadDetailProvider(leadId));
      ref.read(leadsListProvider.notifier).refresh();
    });
  }
}
