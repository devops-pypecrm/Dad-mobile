// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsListHash() => r'7b37a11e57af16299954511893c086d2dcbb6ae0';

/// Infinite-scroll Products list — same shape as `AccountsList`.
///
/// Copied from [ProductsList].
@ProviderFor(ProductsList)
final productsListProvider =
    AutoDisposeAsyncNotifierProvider<ProductsList, ProductsListState>.internal(
      ProductsList.new,
      name: r'productsListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductsList = AutoDisposeAsyncNotifier<ProductsListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
