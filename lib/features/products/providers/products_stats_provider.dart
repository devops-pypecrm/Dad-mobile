import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/products_repository.dart';

part 'products_stats_provider.g.dart';

class ProductsStats {
  const ProductsStats({required this.totalProducts, required this.totalValue, required this.activeCount});

  /// Real server-side count (`ProductsPage.totalProducts`) — always
  /// accurate regardless of how many products exist, unlike [totalValue]/
  /// [activeCount] below.
  final int totalProducts;

  /// Best-effort sum over the first [_statsSampleLimit] products, same
  /// approach (and same limitation) as Dad-frontend's stat cards
  /// (`src/pages/products/index.tsx` sums `basePrice` over a `limit: 200`
  /// fetch, not a true org-wide total) — there's no dedicated aggregate
  /// endpoint for this. Fine for the vast majority of orgs; would
  /// under-count for one with more than [_statsSampleLimit] products.
  final double totalValue;

  /// Same sampling caveat as [totalValue].
  final int activeCount;
}

const _statsSampleLimit = 200;

/// Backs the 3 stat cards at the top of the Products page. Deliberately a
/// separate fetch from the paginated/infinite-scroll list
/// (`ProductsListProvider`) — that one loads 20 at a time and would give
/// wildly wrong totals if used for this instead.
@riverpod
Future<ProductsStats> productsStats(AutoDisposeFutureProviderRef<ProductsStats> ref) async {
  final repository = ref.watch(productsRepositoryProvider);
  final page = await repository.getProducts(page: 1, limit: _statsSampleLimit);
  return ProductsStats(
    totalProducts: page.totalProducts,
    totalValue: page.products.fold<double>(0, (sum, p) => sum + p.basePrice),
    activeCount: page.products.where((p) => p.isActive).length,
  );
}
