// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductsListState {
  List<Product> get products => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsListStateCopyWith<ProductsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsListStateCopyWith<$Res> {
  factory $ProductsListStateCopyWith(
    ProductsListState value,
    $Res Function(ProductsListState) then,
  ) = _$ProductsListStateCopyWithImpl<$Res, ProductsListState>;
  @useResult
  $Res call({
    List<Product> products,
    int page,
    int pages,
    bool isLoadingMore,
    String? search,
  });
}

/// @nodoc
class _$ProductsListStateCopyWithImpl<$Res, $Val extends ProductsListState>
    implements $ProductsListStateCopyWith<$Res> {
  _$ProductsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? page = null,
    Object? pages = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
  }) {
    return _then(
      _value.copyWith(
            products: null == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<Product>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductsListStateImplCopyWith<$Res>
    implements $ProductsListStateCopyWith<$Res> {
  factory _$$ProductsListStateImplCopyWith(
    _$ProductsListStateImpl value,
    $Res Function(_$ProductsListStateImpl) then,
  ) = __$$ProductsListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Product> products,
    int page,
    int pages,
    bool isLoadingMore,
    String? search,
  });
}

/// @nodoc
class __$$ProductsListStateImplCopyWithImpl<$Res>
    extends _$ProductsListStateCopyWithImpl<$Res, _$ProductsListStateImpl>
    implements _$$ProductsListStateImplCopyWith<$Res> {
  __$$ProductsListStateImplCopyWithImpl(
    _$ProductsListStateImpl _value,
    $Res Function(_$ProductsListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? page = null,
    Object? pages = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
  }) {
    return _then(
      _$ProductsListStateImpl(
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ProductsListStateImpl extends _ProductsListState {
  const _$ProductsListStateImpl({
    final List<Product> products = const <Product>[],
    this.page = 1,
    this.pages = 1,
    this.isLoadingMore = false,
    this.search,
  }) : _products = products,
       super._();

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pages;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? search;

  @override
  String toString() {
    return 'ProductsListState(products: $products, page: $page, pages: $pages, isLoadingMore: $isLoadingMore, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsListStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_products),
    page,
    pages,
    isLoadingMore,
    search,
  );

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsListStateImplCopyWith<_$ProductsListStateImpl> get copyWith =>
      __$$ProductsListStateImplCopyWithImpl<_$ProductsListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProductsListState extends ProductsListState {
  const factory _ProductsListState({
    final List<Product> products,
    final int page,
    final int pages,
    final bool isLoadingMore,
    final String? search,
  }) = _$ProductsListStateImpl;
  const _ProductsListState._() : super._();

  @override
  List<Product> get products;
  @override
  int get page;
  @override
  int get pages;
  @override
  bool get isLoadingMore;
  @override
  String? get search;

  /// Create a copy of ProductsListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsListStateImplCopyWith<_$ProductsListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
