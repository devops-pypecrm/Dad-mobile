import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/products_repository.dart';
import '../domain/product.dart';

part 'products_list_provider.g.dart';
part 'products_list_provider.freezed.dart';

@freezed
class ProductsListState with _$ProductsListState {
  const factory ProductsListState({
    @Default(<Product>[]) List<Product> products,
    @Default(1) int page,
    @Default(1) int pages,
    @Default(false) bool isLoadingMore,
    String? search,
  }) = _ProductsListState;

  const ProductsListState._();

  bool get hasMore => page < pages;
}

/// Infinite-scroll Products list — same shape as `AccountsList`.
@riverpod
class ProductsList extends _$ProductsList {
  @override
  Future<ProductsListState> build() async {
    final repository = ref.watch(productsRepositoryProvider);
    final result = await repository.getProducts(page: 1);
    return ProductsListState(products: result.products, page: result.page, pages: result.totalPages);
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));
    try {
      final repository = ref.read(productsRepositoryProvider);
      final result = await repository.getProducts(page: current.page + 1, search: current.search);
      state = AsyncValue.data(
        current.copyWith(
          products: [...current.products, ...result.products],
          page: result.page,
          pages: result.totalPages,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> search(String? query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(productsRepositoryProvider);
      final result = await repository.getProducts(page: 1, search: query);
      return ProductsListState(products: result.products, page: result.page, pages: result.totalPages, search: query);
    });
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(productsRepositoryProvider);
      final result = await repository.getProducts(page: 1, search: current?.search);
      return ProductsListState(
        products: result.products,
        page: result.page,
        pages: result.totalPages,
        search: current?.search,
      );
    });
  }
}
