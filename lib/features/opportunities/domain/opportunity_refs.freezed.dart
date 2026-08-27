// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity_refs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountRef _$AccountRefFromJson(Map<String, dynamic> json) {
  return _AccountRef.fromJson(json);
}

/// @nodoc
mixin _$AccountRef {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<AccountProductRef> get accountProducts =>
      throw _privateConstructorUsedError;

  /// Serializes this AccountRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountRefCopyWith<AccountRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRefCopyWith<$Res> {
  factory $AccountRefCopyWith(
    AccountRef value,
    $Res Function(AccountRef) then,
  ) = _$AccountRefCopyWithImpl<$Res, AccountRef>;
  @useResult
  $Res call({String? id, String name, List<AccountProductRef> accountProducts});
}

/// @nodoc
class _$AccountRefCopyWithImpl<$Res, $Val extends AccountRef>
    implements $AccountRefCopyWith<$Res> {
  _$AccountRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? accountProducts = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            accountProducts: null == accountProducts
                ? _value.accountProducts
                : accountProducts // ignore: cast_nullable_to_non_nullable
                      as List<AccountProductRef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountRefImplCopyWith<$Res>
    implements $AccountRefCopyWith<$Res> {
  factory _$$AccountRefImplCopyWith(
    _$AccountRefImpl value,
    $Res Function(_$AccountRefImpl) then,
  ) = __$$AccountRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name, List<AccountProductRef> accountProducts});
}

/// @nodoc
class __$$AccountRefImplCopyWithImpl<$Res>
    extends _$AccountRefCopyWithImpl<$Res, _$AccountRefImpl>
    implements _$$AccountRefImplCopyWith<$Res> {
  __$$AccountRefImplCopyWithImpl(
    _$AccountRefImpl _value,
    $Res Function(_$AccountRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? accountProducts = null,
  }) {
    return _then(
      _$AccountRefImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        accountProducts: null == accountProducts
            ? _value._accountProducts
            : accountProducts // ignore: cast_nullable_to_non_nullable
                  as List<AccountProductRef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountRefImpl implements _AccountRef {
  const _$AccountRefImpl({
    this.id,
    required this.name,
    final List<AccountProductRef> accountProducts = const <AccountProductRef>[],
  }) : _accountProducts = accountProducts;

  factory _$AccountRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountRefImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  final List<AccountProductRef> _accountProducts;
  @override
  @JsonKey()
  List<AccountProductRef> get accountProducts {
    if (_accountProducts is EqualUnmodifiableListView) return _accountProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountProducts);
  }

  @override
  String toString() {
    return 'AccountRef(id: $id, name: $name, accountProducts: $accountProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._accountProducts,
              _accountProducts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_accountProducts),
  );

  /// Create a copy of AccountRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountRefImplCopyWith<_$AccountRefImpl> get copyWith =>
      __$$AccountRefImplCopyWithImpl<_$AccountRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountRefImplToJson(this);
  }
}

abstract class _AccountRef implements AccountRef {
  const factory _AccountRef({
    final String? id,
    required final String name,
    final List<AccountProductRef> accountProducts,
  }) = _$AccountRefImpl;

  factory _AccountRef.fromJson(Map<String, dynamic> json) =
      _$AccountRefImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  List<AccountProductRef> get accountProducts;

  /// Create a copy of AccountRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountRefImplCopyWith<_$AccountRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountProductRef _$AccountProductRefFromJson(Map<String, dynamic> json) {
  return _AccountProductRef.fromJson(json);
}

/// @nodoc
mixin _$AccountProductRef {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get customName => throw _privateConstructorUsedError;
  ProductRef? get product => throw _privateConstructorUsedError;

  /// Serializes this AccountProductRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountProductRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountProductRefCopyWith<AccountProductRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountProductRefCopyWith<$Res> {
  factory $AccountProductRefCopyWith(
    AccountProductRef value,
    $Res Function(AccountProductRef) then,
  ) = _$AccountProductRefCopyWithImpl<$Res, AccountProductRef>;
  @useResult
  $Res call({
    String id,
    double quantity,
    double price,
    String? customName,
    ProductRef? product,
  });

  $ProductRefCopyWith<$Res>? get product;
}

/// @nodoc
class _$AccountProductRefCopyWithImpl<$Res, $Val extends AccountProductRef>
    implements $AccountProductRefCopyWith<$Res> {
  _$AccountProductRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountProductRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? customName = freezed,
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
                      as double,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            customName: freezed == customName
                ? _value.customName
                : customName // ignore: cast_nullable_to_non_nullable
                      as String?,
            product: freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as ProductRef?,
          )
          as $Val,
    );
  }

  /// Create a copy of AccountProductRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRefCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductRefCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountProductRefImplCopyWith<$Res>
    implements $AccountProductRefCopyWith<$Res> {
  factory _$$AccountProductRefImplCopyWith(
    _$AccountProductRefImpl value,
    $Res Function(_$AccountProductRefImpl) then,
  ) = __$$AccountProductRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double quantity,
    double price,
    String? customName,
    ProductRef? product,
  });

  @override
  $ProductRefCopyWith<$Res>? get product;
}

/// @nodoc
class __$$AccountProductRefImplCopyWithImpl<$Res>
    extends _$AccountProductRefCopyWithImpl<$Res, _$AccountProductRefImpl>
    implements _$$AccountProductRefImplCopyWith<$Res> {
  __$$AccountProductRefImplCopyWithImpl(
    _$AccountProductRefImpl _value,
    $Res Function(_$AccountProductRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountProductRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? customName = freezed,
    Object? product = freezed,
  }) {
    return _then(
      _$AccountProductRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        customName: freezed == customName
            ? _value.customName
            : customName // ignore: cast_nullable_to_non_nullable
                  as String?,
        product: freezed == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as ProductRef?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountProductRefImpl implements _AccountProductRef {
  const _$AccountProductRefImpl({
    required this.id,
    this.quantity = 1,
    this.price = 0,
    this.customName,
    this.product,
  });

  factory _$AccountProductRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountProductRefImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final double quantity;
  @override
  @JsonKey()
  final double price;
  @override
  final String? customName;
  @override
  final ProductRef? product;

  @override
  String toString() {
    return 'AccountProductRef(id: $id, quantity: $quantity, price: $price, customName: $customName, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountProductRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.customName, customName) ||
                other.customName == customName) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, quantity, price, customName, product);

  /// Create a copy of AccountProductRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountProductRefImplCopyWith<_$AccountProductRefImpl> get copyWith =>
      __$$AccountProductRefImplCopyWithImpl<_$AccountProductRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountProductRefImplToJson(this);
  }
}

abstract class _AccountProductRef implements AccountProductRef {
  const factory _AccountProductRef({
    required final String id,
    final double quantity,
    final double price,
    final String? customName,
    final ProductRef? product,
  }) = _$AccountProductRefImpl;

  factory _AccountProductRef.fromJson(Map<String, dynamic> json) =
      _$AccountProductRefImpl.fromJson;

  @override
  String get id;
  @override
  double get quantity;
  @override
  double get price;
  @override
  String? get customName;
  @override
  ProductRef? get product;

  /// Create a copy of AccountProductRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountProductRefImplCopyWith<_$AccountProductRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductRef _$ProductRefFromJson(Map<String, dynamic> json) {
  return _ProductRef.fromJson(json);
}

/// @nodoc
mixin _$ProductRef {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;

  /// Serializes this ProductRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRefCopyWith<ProductRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRefCopyWith<$Res> {
  factory $ProductRefCopyWith(
    ProductRef value,
    $Res Function(ProductRef) then,
  ) = _$ProductRefCopyWithImpl<$Res, ProductRef>;
  @useResult
  $Res call({String id, String name, double basePrice});
}

/// @nodoc
class _$ProductRefCopyWithImpl<$Res, $Val extends ProductRef>
    implements $ProductRefCopyWith<$Res> {
  _$ProductRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? basePrice = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductRefImplCopyWith<$Res>
    implements $ProductRefCopyWith<$Res> {
  factory _$$ProductRefImplCopyWith(
    _$ProductRefImpl value,
    $Res Function(_$ProductRefImpl) then,
  ) = __$$ProductRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double basePrice});
}

/// @nodoc
class __$$ProductRefImplCopyWithImpl<$Res>
    extends _$ProductRefCopyWithImpl<$Res, _$ProductRefImpl>
    implements _$$ProductRefImplCopyWith<$Res> {
  __$$ProductRefImplCopyWithImpl(
    _$ProductRefImpl _value,
    $Res Function(_$ProductRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? basePrice = null,
  }) {
    return _then(
      _$ProductRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRefImpl implements _ProductRef {
  const _$ProductRefImpl({
    required this.id,
    required this.name,
    this.basePrice = 0,
  });

  factory _$ProductRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRefImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final double basePrice;

  @override
  String toString() {
    return 'ProductRef(id: $id, name: $name, basePrice: $basePrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, basePrice);

  /// Create a copy of ProductRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRefImplCopyWith<_$ProductRefImpl> get copyWith =>
      __$$ProductRefImplCopyWithImpl<_$ProductRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRefImplToJson(this);
  }
}

abstract class _ProductRef implements ProductRef {
  const factory _ProductRef({
    required final String id,
    required final String name,
    final double basePrice,
  }) = _$ProductRefImpl;

  factory _ProductRef.fromJson(Map<String, dynamic> json) =
      _$ProductRefImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get basePrice;

  /// Create a copy of ProductRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRefImplCopyWith<_$ProductRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnerRef _$OwnerRefFromJson(Map<String, dynamic> json) {
  return _OwnerRef.fromJson(json);
}

/// @nodoc
mixin _$OwnerRef {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this OwnerRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OwnerRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerRefCopyWith<OwnerRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerRefCopyWith<$Res> {
  factory $OwnerRefCopyWith(OwnerRef value, $Res Function(OwnerRef) then) =
      _$OwnerRefCopyWithImpl<$Res, OwnerRef>;
  @useResult
  $Res call({String? id, String? firstName, String? lastName, String? email});
}

/// @nodoc
class _$OwnerRefCopyWithImpl<$Res, $Val extends OwnerRef>
    implements $OwnerRefCopyWith<$Res> {
  _$OwnerRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OwnerRefImplCopyWith<$Res>
    implements $OwnerRefCopyWith<$Res> {
  factory _$$OwnerRefImplCopyWith(
    _$OwnerRefImpl value,
    $Res Function(_$OwnerRefImpl) then,
  ) = __$$OwnerRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? firstName, String? lastName, String? email});
}

/// @nodoc
class __$$OwnerRefImplCopyWithImpl<$Res>
    extends _$OwnerRefCopyWithImpl<$Res, _$OwnerRefImpl>
    implements _$$OwnerRefImplCopyWith<$Res> {
  __$$OwnerRefImplCopyWithImpl(
    _$OwnerRefImpl _value,
    $Res Function(_$OwnerRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnerRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _$OwnerRefImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerRefImpl implements _OwnerRef {
  const _$OwnerRefImpl({this.id, this.firstName, this.lastName, this.email});

  factory _$OwnerRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerRefImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;

  @override
  String toString() {
    return 'OwnerRef(id: $id, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email);

  /// Create a copy of OwnerRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerRefImplCopyWith<_$OwnerRefImpl> get copyWith =>
      __$$OwnerRefImplCopyWithImpl<_$OwnerRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerRefImplToJson(this);
  }
}

abstract class _OwnerRef implements OwnerRef {
  const factory _OwnerRef({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? email,
  }) = _$OwnerRefImpl;

  factory _OwnerRef.fromJson(Map<String, dynamic> json) =
      _$OwnerRefImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;

  /// Create a copy of OwnerRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerRefImplCopyWith<_$OwnerRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactRef _$ContactRefFromJson(Map<String, dynamic> json) {
  return _ContactRef.fromJson(json);
}

/// @nodoc
mixin _$ContactRef {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this ContactRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactRefCopyWith<ContactRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactRefCopyWith<$Res> {
  factory $ContactRefCopyWith(
    ContactRef value,
    $Res Function(ContactRef) then,
  ) = _$ContactRefCopyWithImpl<$Res, ContactRef>;
  @useResult
  $Res call({String id, String firstName, String lastName, String? email});
}

/// @nodoc
class _$ContactRefCopyWithImpl<$Res, $Val extends ContactRef>
    implements $ContactRefCopyWith<$Res> {
  _$ContactRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContactRefImplCopyWith<$Res>
    implements $ContactRefCopyWith<$Res> {
  factory _$$ContactRefImplCopyWith(
    _$ContactRefImpl value,
    $Res Function(_$ContactRefImpl) then,
  ) = __$$ContactRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String firstName, String lastName, String? email});
}

/// @nodoc
class __$$ContactRefImplCopyWithImpl<$Res>
    extends _$ContactRefCopyWithImpl<$Res, _$ContactRefImpl>
    implements _$$ContactRefImplCopyWith<$Res> {
  __$$ContactRefImplCopyWithImpl(
    _$ContactRefImpl _value,
    $Res Function(_$ContactRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
  }) {
    return _then(
      _$ContactRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactRefImpl implements _ContactRef {
  const _$ContactRefImpl({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
  });

  factory _$ContactRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactRefImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? email;

  @override
  String toString() {
    return 'ContactRef(id: $id, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email);

  /// Create a copy of ContactRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactRefImplCopyWith<_$ContactRefImpl> get copyWith =>
      __$$ContactRefImplCopyWithImpl<_$ContactRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactRefImplToJson(this);
  }
}

abstract class _ContactRef implements ContactRef {
  const factory _ContactRef({
    required final String id,
    required final String firstName,
    required final String lastName,
    final String? email,
  }) = _$ContactRefImpl;

  factory _ContactRef.fromJson(Map<String, dynamic> json) =
      _$ContactRefImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get email;

  /// Create a copy of ContactRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactRefImplCopyWith<_$ContactRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadRef _$LeadRefFromJson(Map<String, dynamic> json) {
  return _LeadRef.fromJson(json);
}

/// @nodoc
mixin _$LeadRef {
  String get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  LeadAssigneeRef? get assignedTo => throw _privateConstructorUsedError;

  /// Serializes this LeadRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadRefCopyWith<LeadRef> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadRefCopyWith<$Res> {
  factory $LeadRefCopyWith(LeadRef value, $Res Function(LeadRef) then) =
      _$LeadRefCopyWithImpl<$Res, LeadRef>;
  @useResult
  $Res call({
    String id,
    String? firstName,
    String? lastName,
    String? status,
    LeadAssigneeRef? assignedTo,
  });

  $LeadAssigneeRefCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$LeadRefCopyWithImpl<$Res, $Val extends LeadRef>
    implements $LeadRefCopyWith<$Res> {
  _$LeadRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? assignedTo = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as LeadAssigneeRef?,
          )
          as $Val,
    );
  }

  /// Create a copy of LeadRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadAssigneeRefCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $LeadAssigneeRefCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadRefImplCopyWith<$Res> implements $LeadRefCopyWith<$Res> {
  factory _$$LeadRefImplCopyWith(
    _$LeadRefImpl value,
    $Res Function(_$LeadRefImpl) then,
  ) = __$$LeadRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? firstName,
    String? lastName,
    String? status,
    LeadAssigneeRef? assignedTo,
  });

  @override
  $LeadAssigneeRefCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$LeadRefImplCopyWithImpl<$Res>
    extends _$LeadRefCopyWithImpl<$Res, _$LeadRefImpl>
    implements _$$LeadRefImplCopyWith<$Res> {
  __$$LeadRefImplCopyWithImpl(
    _$LeadRefImpl _value,
    $Res Function(_$LeadRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? assignedTo = freezed,
  }) {
    return _then(
      _$LeadRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as LeadAssigneeRef?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadRefImpl implements _LeadRef {
  const _$LeadRefImpl({
    required this.id,
    this.firstName,
    this.lastName,
    this.status,
    this.assignedTo,
  });

  factory _$LeadRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadRefImplFromJson(json);

  @override
  final String id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? status;
  @override
  final LeadAssigneeRef? assignedTo;

  @override
  String toString() {
    return 'LeadRef(id: $id, firstName: $firstName, lastName: $lastName, status: $status, assignedTo: $assignedTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, status, assignedTo);

  /// Create a copy of LeadRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadRefImplCopyWith<_$LeadRefImpl> get copyWith =>
      __$$LeadRefImplCopyWithImpl<_$LeadRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadRefImplToJson(this);
  }
}

abstract class _LeadRef implements LeadRef {
  const factory _LeadRef({
    required final String id,
    final String? firstName,
    final String? lastName,
    final String? status,
    final LeadAssigneeRef? assignedTo,
  }) = _$LeadRefImpl;

  factory _LeadRef.fromJson(Map<String, dynamic> json) = _$LeadRefImpl.fromJson;

  @override
  String get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get status;
  @override
  LeadAssigneeRef? get assignedTo;

  /// Create a copy of LeadRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadRefImplCopyWith<_$LeadRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadAssigneeRef _$LeadAssigneeRefFromJson(Map<String, dynamic> json) {
  return _LeadAssigneeRef.fromJson(json);
}

/// @nodoc
mixin _$LeadAssigneeRef {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this LeadAssigneeRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadAssigneeRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadAssigneeRefCopyWith<LeadAssigneeRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadAssigneeRefCopyWith<$Res> {
  factory $LeadAssigneeRefCopyWith(
    LeadAssigneeRef value,
    $Res Function(LeadAssigneeRef) then,
  ) = _$LeadAssigneeRefCopyWithImpl<$Res, LeadAssigneeRef>;
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class _$LeadAssigneeRefCopyWithImpl<$Res, $Val extends LeadAssigneeRef>
    implements $LeadAssigneeRefCopyWith<$Res> {
  _$LeadAssigneeRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadAssigneeRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = freezed, Object? lastName = freezed}) {
    return _then(
      _value.copyWith(
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadAssigneeRefImplCopyWith<$Res>
    implements $LeadAssigneeRefCopyWith<$Res> {
  factory _$$LeadAssigneeRefImplCopyWith(
    _$LeadAssigneeRefImpl value,
    $Res Function(_$LeadAssigneeRefImpl) then,
  ) = __$$LeadAssigneeRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class __$$LeadAssigneeRefImplCopyWithImpl<$Res>
    extends _$LeadAssigneeRefCopyWithImpl<$Res, _$LeadAssigneeRefImpl>
    implements _$$LeadAssigneeRefImplCopyWith<$Res> {
  __$$LeadAssigneeRefImplCopyWithImpl(
    _$LeadAssigneeRefImpl _value,
    $Res Function(_$LeadAssigneeRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadAssigneeRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = freezed, Object? lastName = freezed}) {
    return _then(
      _$LeadAssigneeRefImpl(
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadAssigneeRefImpl implements _LeadAssigneeRef {
  const _$LeadAssigneeRefImpl({this.firstName, this.lastName});

  factory _$LeadAssigneeRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadAssigneeRefImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'LeadAssigneeRef(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadAssigneeRefImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of LeadAssigneeRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadAssigneeRefImplCopyWith<_$LeadAssigneeRefImpl> get copyWith =>
      __$$LeadAssigneeRefImplCopyWithImpl<_$LeadAssigneeRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadAssigneeRefImplToJson(this);
  }
}

abstract class _LeadAssigneeRef implements LeadAssigneeRef {
  const factory _LeadAssigneeRef({
    final String? firstName,
    final String? lastName,
  }) = _$LeadAssigneeRefImpl;

  factory _LeadAssigneeRef.fromJson(Map<String, dynamic> json) =
      _$LeadAssigneeRefImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;

  /// Create a copy of LeadAssigneeRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadAssigneeRefImplCopyWith<_$LeadAssigneeRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
