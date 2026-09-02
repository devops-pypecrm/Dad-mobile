import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/opportunities_repository.dart';
import '../domain/installment_input.dart';
import 'opportunities_list_provider.dart';
import 'opportunity_detail_provider.dart';

part 'opportunity_actions_controller.g.dart';

/// Stage change, edit (amount/probability/close date), linked-lead status
/// sync, amount-sync-to-products, and Close Won/Lost — all funnel through
/// `OpportunitiesRepository`. See that class's doc comments for the
/// `stage` vs `leadStatus` distinction, the terminal-stage 400 the backend
/// returns, and the exact payment-type contract `closeWon` wraps.
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

  /// Returns `true` on success — the Close Won sheet stays open showing the
  /// server's error (e.g. an installment-sum mismatch caught server-side
  /// even though the sheet also validates it client-side) rather than
  /// closing on a failed submit.
  Future<bool> closeWon({
    required String paymentType,
    double? paidAmount,
    List<InstallmentInput>? installments,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      await repository.closeWon(
        opportunityId,
        paymentType: paymentType,
        paidAmount: paidAmount,
        installments: installments,
      );
      ref.invalidate(opportunityDetailProvider(opportunityId));
      ref.read(opportunitiesListProvider.notifier).refresh();
    });
    return !state.hasError;
  }

  Future<bool> closeLost(String lostReason) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      await repository.closeLost(opportunityId, lostReason: lostReason);
      ref.invalidate(opportunityDetailProvider(opportunityId));
      ref.read(opportunitiesListProvider.notifier).refresh();
    });
    return !state.hasError;
  }

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
