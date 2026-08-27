import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/products_repository.dart';
import 'products_list_provider.dart';
import 'products_stats_provider.dart';

part 'product_actions_controller.g.dart';

/// Create/edit/delete for a single product — see `ProductsRepository`'s
/// doc comment for the org-admin-only server gating this wraps.
@riverpod
class ProductActionsController extends _$ProductActionsController {
  @override
  FutureOr<void> build() {}

  Future<bool> create({
    required String name,
    String? sku,
    required double basePrice,
    String? category,
    String? description,
    bool isCustom = false,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(productsRepositoryProvider);
      await repository.createProduct(
        name: name,
        sku: sku,
        basePrice: basePrice,
        category: category,
        description: description,
        isCustom: isCustom,
      );
      ref.read(productsListProvider.notifier).refresh();
      ref.invalidate(productsStatsProvider);
    });
    return !state.hasError;
  }

  // Named `editProduct`, not `update` — `AsyncNotifierBase` already declares
  // its own `update` (for optimistic in-place state mutation), so reusing
  // that name silently collides with it instead of just shadowing.
  Future<bool> editProduct(
    String id, {
    String? name,
    String? sku,
    double? basePrice,
    String? category,
    String? description,
    bool? isCustom,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(productsRepositoryProvider);
      await repository.updateProduct(
        id,
        name: name,
        sku: sku,
        basePrice: basePrice,
        category: category,
        description: description,
        isCustom: isCustom,
      );
      ref.read(productsListProvider.notifier).refresh();
      ref.invalidate(productsStatsProvider);
    });
    return !state.hasError;
  }

  Future<bool> delete(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(productsRepositoryProvider);
      await repository.deleteProduct(id);
      ref.read(productsListProvider.notifier).refresh();
      ref.invalidate(productsStatsProvider);
    });
    return !state.hasError;
  }
}
