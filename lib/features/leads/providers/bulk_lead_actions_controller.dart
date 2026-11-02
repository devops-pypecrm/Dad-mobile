import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import 'leads_list_provider.dart';

part 'bulk_lead_actions_controller.g.dart';

/// Backs the Leads list's bulk-selection toolbar — thin wrapper over
/// `LeadsRepository.bulkLeadAction` (same `/api/bulk/leads` endpoint
/// Dad-frontend's bulk-action toolbar uses) that refreshes the list on
/// success. Role gating for `update-status`/`delete` happens server-side;
/// see that repository method's doc comment.
@riverpod
class BulkLeadActionsController extends _$BulkLeadActionsController {
  @override
  FutureOr<String?> build() => null;

  Future<bool> run({required String action, required List<String> leadIds, Map<String, dynamic>? data}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final message = await ref.read(leadsRepositoryProvider).bulkLeadAction(
            action: action,
            leadIds: leadIds,
            data: data,
          );
      await ref.read(leadsListProvider.notifier).refresh();
      return message;
    });
    return !state.hasError;
  }
}
