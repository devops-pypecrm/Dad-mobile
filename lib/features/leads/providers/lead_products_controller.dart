import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead_product.dart';
import 'lead_detail_provider.dart';
import 'leads_list_provider.dart';

part 'lead_products_controller.g.dart';

/// Full-replace save of a lead's product list (see
/// `LeadsRepository.updateLead`'s `products` param) — there's no
/// incremental add/remove endpoint, so the editor sheet always sends the
/// complete resulting list.
@riverpod
class LeadProductsController extends _$LeadProductsController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<void> save(List<LeadProductItem> products) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      await repository.updateLead(leadId, products: products);
      ref.invalidate(leadDetailProvider(leadId));
      ref.read(leadsListProvider.notifier).refresh();
    });
  }
}
