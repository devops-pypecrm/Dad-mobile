// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductsPage _$ProductsPageFromJson(Map<String, dynamic> json) {
  return _ProductsPage.fromJson(json);
}

/// @nodoc
mixin _$ProductsPage {
  List<Product> get products => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalProducts => throw _privateConstructorUsedError;

  /// Serializes this ProductsPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsPageCopyWith<ProductsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsPageCopyWith<$Res> {
  factory $ProductsPageCopyWith(
    ProductsPage value,
    $Res Function(ProductsPage) then,
  ) = _$ProductsPageCopyWithImpl<$Res, ProductsPage>;
  @useResult
  $Res call({
    List<Product> products,
    int page,
    int totalPages,
    int totalProducts,
  });
}

/// @nodoc
class _$ProductsPageCopyWithImpl<$Res, $Val extends ProductsPage>
    implements $ProductsPageCopyWith<$Res> {
  _$ProductsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalProducts = null,
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
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalProducts: null == totalProducts
                ? _value.totalProducts
                : totalProducts // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductsPageImplCopyWith<$Res>
    implements $ProductsPageCopyWith<$Res> {
  factory _$$ProductsPageImplCopyWith(
    _$ProductsPageImpl value,
    $Res Function(_$ProductsPageImpl) then,
  ) = __$$ProductsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Product> products,
    int page,
    int totalPages,
    int totalProducts,
  });
}

/// @nodoc
class __$$ProductsPageImplCopyWithImpl<$Res>
    extends _$ProductsPageCopyWithImpl<$Res, _$ProductsPageImpl>
    implements _$$ProductsPageImplCopyWith<$Res> {
  __$$ProductsPageImplCopyWithImpl(
    _$ProductsPageImpl _value,
    $Res Function(_$ProductsPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalProducts = null,
  }) {
    return _then(
      _$ProductsPageImpl(
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalProducts: null == totalProducts
            ? _value.totalProducts
            : totalProducts // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsPageImpl implements _ProductsPage {
  const _$ProductsPageImpl({
    final List<Product> products = const <Product>[],
    this.page = 1,
    this.totalPages = 1,
    this.totalProducts = 0,
  }) : _products = products;

  factory _$ProductsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsPageImplFromJson(json);

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
  final int totalPages;
  @override
  @JsonKey()
  final int totalProducts;

  @override
  String toString() {
    return 'ProductsPage(products: $products, page: $page, totalPages: $totalPages, totalProducts: $totalProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsPageImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_products),
    page,
    totalPages,
    totalProducts,
  );

  /// Create a copy of ProductsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsPageImplCopyWith<_$ProductsPageImpl> get copyWith =>
      __$$ProductsPageImplCopyWithImpl<_$ProductsPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsPageImplToJson(this);
  }
}

abstract class _ProductsPage implements ProductsPage {
  const factory _ProductsPage({
    final List<Product> products,
    final int page,
    final int totalPages,
    final int totalProducts,
  }) = _$ProductsPageImpl;

  factory _ProductsPage.fromJson(Map<String, dynamic> json) =
      _$ProductsPageImpl.fromJson;

  @override
  List<Product> get products;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  int get totalProducts;

  /// Create a copy of ProductsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsPageImplCopyWith<_$ProductsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
