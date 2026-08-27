import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/opportunities_repository.dart';
import 'opportunities_list_provider.dart';
import 'opportunity_detail_provider.dart';

part 'opportunity_actions_controller.g.dart';

/// Stage change, edit (amount/probability/close date), linked-lead status
/// sync, and amount-sync-to-products — all funnel through
/// `OpportunitiesRepository.updateOpportunity`. See that method's doc
/// comment for the `stage` vs `leadStatus` distinction and the terminal-
/// stage 400 the backend returns.
@riverpod
class OpportunityActionsController extends _$OpportunityActionsController {
  @override
  FutureOr<void> build(String opportunityId) {}

  Future<void> updateStage(String stage) => _update(stage: stage);

  Future<void> updateLeadStatus(String leadStatus) => _update(leadStatus: leadStatus);

  Future<void> updateDetails({double? amount, double? probability, DateTime? closeDate}) =>
      _update(amount: amount, probability: probability, closeDate: closeDate);

  /// Sets `amount` to [total] — the caller computes this from
  /// `opportunity.account.accountProducts` (see the "Sync Amount" button on
  /// the detail screen), this method doesn't recompute it itself so there's
  /// one obvious place reading the product data, not two.
  Future<void> syncAmount(double total) => _update(amount: total);

  Future<void> _update({
    String? stage,
    double? amount,
    double? probability,
    DateTime? closeDate,
    String? leadStatus,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      await repository.updateOpportunity(
        opportunityId,
        stage: stage,
        amount: amount,
        probability: probability,
        closeDate: closeDate,
        leadStatus: leadStatus,
      );
      ref.invalidate(opportunityDetailProvider(opportunityId));
      ref.read(opportunitiesListProvider.notifier).refresh();
    });
  }
}
