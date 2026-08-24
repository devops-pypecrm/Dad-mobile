// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountProductItem _$AccountProductItemFromJson(Map<String, dynamic> json) {
  return _AccountProductItem.fromJson(json);
}

/// @nodoc
mixin _$AccountProductItem {
  String get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get customName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;

  /// Serializes this AccountProductItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountProductItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountProductItemCopyWith<AccountProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountProductItemCopyWith<$Res> {
  factory $AccountProductItemCopyWith(
    AccountProductItem value,
    $Res Function(AccountProductItem) then,
  ) = _$AccountProductItemCopyWithImpl<$Res, AccountProductItem>;
  @useResult
  $Res call({
    String id,
    int quantity,
    double price,
    String? customName,
    String? status,
    Product? product,
  });

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$AccountProductItemCopyWithImpl<$Res, $Val extends AccountProductItem>
    implements $AccountProductItemCopyWith<$Res> {
  _$AccountProductItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountProductItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? customName = freezed,
    Object? status = freezed,
    Object? product = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            customName: freezed == customName
                ? _value.customName
                : customName // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            product: freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as Product?,
          )
          as $Val,
    );
  }

  /// Create a copy of AccountProductItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountProductItemImplCopyWith<$Res>
    implements $AccountProductItemCopyWith<$Res> {
  factory _$$AccountProductItemImplCopyWith(
    _$AccountProductItemImpl value,
    $Res Function(_$AccountProductItemImpl) then,
  ) = __$$AccountProductItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int quantity,
    double price,
    String? customName,
    String? status,
    Product? product,
  });

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$AccountProductItemImplCopyWithImpl<$Res>
    extends _$AccountProductItemCopyWithImpl<$Res, _$AccountProductItemImpl>
    implements _$$AccountProductItemImplCopyWith<$Res> {
  __$$AccountProductItemImplCopyWithImpl(
    _$AccountProductItemImpl _value,
    $Res Function(_$AccountProductItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountProductItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? customName = freezed,
    Object? status = freezed,
    Object? product = freezed,
  }) {
    return _then(
      _$AccountProductItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        customName: freezed == customName
            ? _value.customName
            : customName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        product: freezed == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as Product?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountProductItemImpl implements _AccountProductItem {
  const _$AccountProductItemImpl({
    required this.id,
    required this.quantity,
    required this.price,
    this.customName,
    this.status,
    this.product,
  });

  factory _$AccountProductItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountProductItemImplFromJson(json);

  @override
  final String id;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final String? customName;
  @override
  final String? status;
  @override
  final Product? product;

  @override
  String toString() {
    return 'AccountProductItem(id: $id, quantity: $quantity, price: $price, customName: $customName, status: $status, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountProductItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.customName, customName) ||
                other.customName == customName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    quantity,
    price,
    customName,
    status,
    product,
  );

  /// Create a copy of AccountProductItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountProductItemImplCopyWith<_$AccountProductItemImpl> get copyWith =>
      __$$AccountProductItemImplCopyWithImpl<_$AccountProductItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountProductItemImplToJson(this);
  }
}

abstract class _AccountProductItem implements AccountProductItem {
  const factory _AccountProductItem({
    required final String id,
    required final int quantity,
    required final double price,
    final String? customName,
    final String? status,
    final Product? product,
  }) = _$AccountProductItemImpl;

  factory _AccountProductItem.fromJson(Map<String, dynamic> json) =
      _$AccountProductItemImpl.fromJson;

  @override
  String get id;
  @override
  int get quantity;
  @override
  double get price;
  @override
  String? get customName;
  @override
  String? get status;
  @override
  Product? get product;

  /// Create a copy of AccountProductItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountProductItemImplCopyWith<_$AccountProductItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
