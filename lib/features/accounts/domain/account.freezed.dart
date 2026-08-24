// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get industry => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get address => throw _privateConstructorUsedError;
  OwnerRef? get owner => throw _privateConstructorUsedError;
  List<ContactRef> get contacts => throw _privateConstructorUsedError;
  List<AccountOpportunityRef> get opportunities =>
      throw _privateConstructorUsedError;
  List<AccountProductItem> get accountProducts =>
      throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call({
    String id,
    String name,
    String? industry,
    String? website,
    String? phone,
    String type,
    Map<String, dynamic>? address,
    OwnerRef? owner,
    List<ContactRef> contacts,
    List<AccountOpportunityRef> opportunities,
    List<AccountProductItem> accountProducts,
  });

  $OwnerRefCopyWith<$Res>? get owner;
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? industry = freezed,
    Object? website = freezed,
    Object? phone = freezed,
    Object? type = null,
    Object? address = freezed,
    Object? owner = freezed,
    Object? contacts = null,
    Object? opportunities = null,
    Object? accountProducts = null,
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
            industry: freezed == industry
                ? _value.industry
                : industry // ignore: cast_nullable_to_non_nullable
                      as String?,
            website: freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            owner: freezed == owner
                ? _value.owner
                : owner // ignore: cast_nullable_to_non_nullable
                      as OwnerRef?,
            contacts: null == contacts
                ? _value.contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                      as List<ContactRef>,
            opportunities: null == opportunities
                ? _value.opportunities
                : opportunities // ignore: cast_nullable_to_non_nullable
                      as List<AccountOpportunityRef>,
            accountProducts: null == accountProducts
                ? _value.accountProducts
                : accountProducts // ignore: cast_nullable_to_non_nullable
                      as List<AccountProductItem>,
          )
          as $Val,
    );
  }

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerRefCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerRefCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
    _$AccountImpl value,
    $Res Function(_$AccountImpl) then,
  ) = __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? industry,
    String? website,
    String? phone,
    String type,
    Map<String, dynamic>? address,
    OwnerRef? owner,
    List<ContactRef> contacts,
    List<AccountOpportunityRef> opportunities,
    List<AccountProductItem> accountProducts,
  });

  @override
  $OwnerRefCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
    _$AccountImpl _value,
    $Res Function(_$AccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? industry = freezed,
    Object? website = freezed,
    Object? phone = freezed,
    Object? type = null,
    Object? address = freezed,
    Object? owner = freezed,
    Object? contacts = null,
    Object? opportunities = null,
    Object? accountProducts = null,
  }) {
    return _then(
      _$AccountImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        industry: freezed == industry
            ? _value.industry
            : industry // ignore: cast_nullable_to_non_nullable
                  as String?,
        website: freezed == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        address: freezed == address
            ? _value._address
            : address // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        owner: freezed == owner
            ? _value.owner
            : owner // ignore: cast_nullable_to_non_nullable
                  as OwnerRef?,
        contacts: null == contacts
            ? _value._contacts
            : contacts // ignore: cast_nullable_to_non_nullable
                  as List<ContactRef>,
        opportunities: null == opportunities
            ? _value._opportunities
            : opportunities // ignore: cast_nullable_to_non_nullable
                  as List<AccountOpportunityRef>,
        accountProducts: null == accountProducts
            ? _value._accountProducts
            : accountProducts // ignore: cast_nullable_to_non_nullable
                  as List<AccountProductItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl extends _Account {
  const _$AccountImpl({
    required this.id,
    required this.name,
    this.industry,
    this.website,
    this.phone,
    this.type = 'prospect',
    final Map<String, dynamic>? address,
    this.owner,
    final List<ContactRef> contacts = const <ContactRef>[],
    final List<AccountOpportunityRef> opportunities =
        const <AccountOpportunityRef>[],
    final List<AccountProductItem> accountProducts =
        const <AccountProductItem>[],
  }) : _address = address,
       _contacts = contacts,
       _opportunities = opportunities,
       _accountProducts = accountProducts,
       super._();

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? industry;
  @override
  final String? website;
  @override
  final String? phone;
  @override
  @JsonKey()
  final String type;
  final Map<String, dynamic>? _address;
  @override
  Map<String, dynamic>? get address {
    final value = _address;
    if (value == null) return null;
    if (_address is EqualUnmodifiableMapView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final OwnerRef? owner;
  final List<ContactRef> _contacts;
  @override
  @JsonKey()
  List<ContactRef> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  final List<AccountOpportunityRef> _opportunities;
  @override
  @JsonKey()
  List<AccountOpportunityRef> get opportunities {
    if (_opportunities is EqualUnmodifiableListView) return _opportunities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opportunities);
  }

  final List<AccountProductItem> _accountProducts;
  @override
  @JsonKey()
  List<AccountProductItem> get accountProducts {
    if (_accountProducts is EqualUnmodifiableListView) return _accountProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountProducts);
  }

  @override
  String toString() {
    return 'Account(id: $id, name: $name, industry: $industry, website: $website, phone: $phone, type: $type, address: $address, owner: $owner, contacts: $contacts, opportunities: $opportunities, accountProducts: $accountProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            const DeepCollectionEquality().equals(
              other._opportunities,
              _opportunities,
            ) &&
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
    industry,
    website,
    phone,
    type,
    const DeepCollectionEquality().hash(_address),
    owner,
    const DeepCollectionEquality().hash(_contacts),
    const DeepCollectionEquality().hash(_opportunities),
    const DeepCollectionEquality().hash(_accountProducts),
  );

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(this);
  }
}

abstract class _Account extends Account {
  const factory _Account({
    required final String id,
    required final String name,
    final String? industry,
    final String? website,
    final String? phone,
    final String type,
    final Map<String, dynamic>? address,
    final OwnerRef? owner,
    final List<ContactRef> contacts,
    final List<AccountOpportunityRef> opportunities,
    final List<AccountProductItem> accountProducts,
  }) = _$AccountImpl;
  const _Account._() : super._();

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get industry;
  @override
  String? get website;
  @override
  String? get phone;
  @override
  String get type;
  @override
  Map<String, dynamic>? get address;
  @override
  OwnerRef? get owner;
  @override
  List<ContactRef> get contacts;
  @override
  List<AccountOpportunityRef> get opportunities;
  @override
  List<AccountProductItem> get accountProducts;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
