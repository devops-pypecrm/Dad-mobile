// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_lead_actions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bulkLeadActionsControllerHash() =>
    r'c4d5e6f7a8b9c4d5e6f7a8b9c4d5e6f7a8b9c4d5';

/// Backs the Leads list's bulk-selection toolbar — thin wrapper over
/// `LeadsRepository.bulkLeadAction` (same `/api/bulk/leads` endpoint
/// Dad-frontend's bulk-action toolbar uses) that refreshes the list on
/// success. Role gating for `update-status`/`delete` happens server-side;
/// see that repository method's doc comment.
///
/// Copied from [BulkLeadActionsController].
@ProviderFor(BulkLeadActionsController)
final bulkLeadActionsControllerProvider =
    AutoDisposeAsyncNotifierProvider<BulkLeadActionsController, String?>.internal(
      BulkLeadActionsController.new,
      name: r'bulkLeadActionsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bulkLeadActionsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BulkLeadActionsController = AutoDisposeAsyncNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
