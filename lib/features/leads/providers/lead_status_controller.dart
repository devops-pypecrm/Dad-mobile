import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import 'lead_detail_provider.dart';
import 'leads_list_provider.dart';

part 'lead_status_controller.g.dart';

/// Handles status changes / `nextFollowUp` scheduling for a single Lead.
/// Updating `nextFollowUp` here auto-creates/reschedules a FollowUp row
/// server-side (Dad-backend/src/controllers/leadController.ts:686) — the
/// mobile app never creates that FollowUp itself.
@riverpod
class LeadStatusController extends _$LeadStatusController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<void> updateStatus(String status) => _update(status: status);

  Future<void> scheduleNextFollowUp(DateTime dueDate) => _update(nextFollowUp: dueDate);

  Future<void> _update({String? status, DateTime? nextFollowUp}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      await repository.updateLead(leadId, status: status, nextFollowUp: nextFollowUp);
      ref.invalidate(leadDetailProvider(leadId));
      ref.read(leadsListProvider.notifier).refresh();
    });
  }
}
