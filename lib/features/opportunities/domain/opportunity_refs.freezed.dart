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
  $Res call({String? id, String name});
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
  $Res call({Object? id = freezed, Object? name = null}) {
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
  $Res call({String? id, String name});
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
  $Res call({Object? id = freezed, Object? name = null}) {
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountRefImpl implements _AccountRef {
  const _$AccountRefImpl({this.id, required this.name});

  factory _$AccountRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountRefImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;

  @override
  String toString() {
    return 'AccountRef(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

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
  const factory _AccountRef({final String? id, required final String name}) =
      _$AccountRefImpl;

  factory _AccountRef.fromJson(Map<String, dynamic> json) =
      _$AccountRefImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;

  /// Create a copy of AccountRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountRefImplCopyWith<_$AccountRefImpl> get copyWith =>
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
