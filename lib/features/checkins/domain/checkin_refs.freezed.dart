// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_refs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckInUserRef _$CheckInUserRefFromJson(Map<String, dynamic> json) {
  return _CheckInUserRef.fromJson(json);
}

/// @nodoc
mixin _$CheckInUserRef {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  CheckInBranchRef? get branch => throw _privateConstructorUsedError;

  /// Serializes this CheckInUserRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInUserRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInUserRefCopyWith<CheckInUserRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInUserRefCopyWith<$Res> {
  factory $CheckInUserRefCopyWith(
    CheckInUserRef value,
    $Res Function(CheckInUserRef) then,
  ) = _$CheckInUserRefCopyWithImpl<$Res, CheckInUserRef>;
  @useResult
  $Res call({String? firstName, String? lastName, CheckInBranchRef? branch});

  $CheckInBranchRefCopyWith<$Res>? get branch;
}

/// @nodoc
class _$CheckInUserRefCopyWithImpl<$Res, $Val extends CheckInUserRef>
    implements $CheckInUserRefCopyWith<$Res> {
  _$CheckInUserRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInUserRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? branch = freezed,
  }) {
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
            branch: freezed == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                      as CheckInBranchRef?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckInUserRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInBranchRefCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $CheckInBranchRefCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInUserRefImplCopyWith<$Res>
    implements $CheckInUserRefCopyWith<$Res> {
  factory _$$CheckInUserRefImplCopyWith(
    _$CheckInUserRefImpl value,
    $Res Function(_$CheckInUserRefImpl) then,
  ) = __$$CheckInUserRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? firstName, String? lastName, CheckInBranchRef? branch});

  @override
  $CheckInBranchRefCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$CheckInUserRefImplCopyWithImpl<$Res>
    extends _$CheckInUserRefCopyWithImpl<$Res, _$CheckInUserRefImpl>
    implements _$$CheckInUserRefImplCopyWith<$Res> {
  __$$CheckInUserRefImplCopyWithImpl(
    _$CheckInUserRefImpl _value,
    $Res Function(_$CheckInUserRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInUserRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? branch = freezed,
  }) {
    return _then(
      _$CheckInUserRefImpl(
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        branch: freezed == branch
            ? _value.branch
            : branch // ignore: cast_nullable_to_non_nullable
                  as CheckInBranchRef?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInUserRefImpl implements _CheckInUserRef {
  const _$CheckInUserRefImpl({this.firstName, this.lastName, this.branch});

  factory _$CheckInUserRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInUserRefImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final CheckInBranchRef? branch;

  @override
  String toString() {
    return 'CheckInUserRef(firstName: $firstName, lastName: $lastName, branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInUserRefImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, branch);

  /// Create a copy of CheckInUserRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInUserRefImplCopyWith<_$CheckInUserRefImpl> get copyWith =>
      __$$CheckInUserRefImplCopyWithImpl<_$CheckInUserRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInUserRefImplToJson(this);
  }
}

abstract class _CheckInUserRef implements CheckInUserRef {
  const factory _CheckInUserRef({
    final String? firstName,
    final String? lastName,
    final CheckInBranchRef? branch,
  }) = _$CheckInUserRefImpl;

  factory _CheckInUserRef.fromJson(Map<String, dynamic> json) =
      _$CheckInUserRefImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  CheckInBranchRef? get branch;

  /// Create a copy of CheckInUserRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInUserRefImplCopyWith<_$CheckInUserRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckInBranchRef _$CheckInBranchRefFromJson(Map<String, dynamic> json) {
  return _CheckInBranchRef.fromJson(json);
}

/// @nodoc
mixin _$CheckInBranchRef {
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this CheckInBranchRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInBranchRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInBranchRefCopyWith<CheckInBranchRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInBranchRefCopyWith<$Res> {
  factory $CheckInBranchRefCopyWith(
    CheckInBranchRef value,
    $Res Function(CheckInBranchRef) then,
  ) = _$CheckInBranchRefCopyWithImpl<$Res, CheckInBranchRef>;
  @useResult
  $Res call({String? name});
}

/// @nodoc
class _$CheckInBranchRefCopyWithImpl<$Res, $Val extends CheckInBranchRef>
    implements $CheckInBranchRefCopyWith<$Res> {
  _$CheckInBranchRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInBranchRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed}) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInBranchRefImplCopyWith<$Res>
    implements $CheckInBranchRefCopyWith<$Res> {
  factory _$$CheckInBranchRefImplCopyWith(
    _$CheckInBranchRefImpl value,
    $Res Function(_$CheckInBranchRefImpl) then,
  ) = __$$CheckInBranchRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name});
}

/// @nodoc
class __$$CheckInBranchRefImplCopyWithImpl<$Res>
    extends _$CheckInBranchRefCopyWithImpl<$Res, _$CheckInBranchRefImpl>
    implements _$$CheckInBranchRefImplCopyWith<$Res> {
  __$$CheckInBranchRefImplCopyWithImpl(
    _$CheckInBranchRefImpl _value,
    $Res Function(_$CheckInBranchRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInBranchRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed}) {
    return _then(
      _$CheckInBranchRefImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInBranchRefImpl implements _CheckInBranchRef {
  const _$CheckInBranchRefImpl({this.name});

  factory _$CheckInBranchRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInBranchRefImplFromJson(json);

  @override
  final String? name;

  @override
  String toString() {
    return 'CheckInBranchRef(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInBranchRefImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of CheckInBranchRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInBranchRefImplCopyWith<_$CheckInBranchRefImpl> get copyWith =>
      __$$CheckInBranchRefImplCopyWithImpl<_$CheckInBranchRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInBranchRefImplToJson(this);
  }
}

abstract class _CheckInBranchRef implements CheckInBranchRef {
  const factory _CheckInBranchRef({final String? name}) =
      _$CheckInBranchRefImpl;

  factory _CheckInBranchRef.fromJson(Map<String, dynamic> json) =
      _$CheckInBranchRefImpl.fromJson;

  @override
  String? get name;

  /// Create a copy of CheckInBranchRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInBranchRefImplCopyWith<_$CheckInBranchRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckInEntityRef _$CheckInEntityRefFromJson(Map<String, dynamic> json) {
  return _CheckInEntityRef.fromJson(json);
}

/// @nodoc
mixin _$CheckInEntityRef {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;

  /// Serializes this CheckInEntityRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInEntityRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInEntityRefCopyWith<CheckInEntityRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInEntityRefCopyWith<$Res> {
  factory $CheckInEntityRefCopyWith(
    CheckInEntityRef value,
    $Res Function(CheckInEntityRef) then,
  ) = _$CheckInEntityRefCopyWithImpl<$Res, CheckInEntityRef>;
  @useResult
  $Res call({
    String? firstName,
    String? lastName,
    String? name,
    String? company,
  });
}

/// @nodoc
class _$CheckInEntityRefCopyWithImpl<$Res, $Val extends CheckInEntityRef>
    implements $CheckInEntityRefCopyWith<$Res> {
  _$CheckInEntityRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInEntityRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? name = freezed,
    Object? company = freezed,
  }) {
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
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInEntityRefImplCopyWith<$Res>
    implements $CheckInEntityRefCopyWith<$Res> {
  factory _$$CheckInEntityRefImplCopyWith(
    _$CheckInEntityRefImpl value,
    $Res Function(_$CheckInEntityRefImpl) then,
  ) = __$$CheckInEntityRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? firstName,
    String? lastName,
    String? name,
    String? company,
  });
}

/// @nodoc
class __$$CheckInEntityRefImplCopyWithImpl<$Res>
    extends _$CheckInEntityRefCopyWithImpl<$Res, _$CheckInEntityRefImpl>
    implements _$$CheckInEntityRefImplCopyWith<$Res> {
  __$$CheckInEntityRefImplCopyWithImpl(
    _$CheckInEntityRefImpl _value,
    $Res Function(_$CheckInEntityRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInEntityRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? name = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _$CheckInEntityRefImpl(
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInEntityRefImpl extends _CheckInEntityRef {
  const _$CheckInEntityRefImpl({
    this.firstName,
    this.lastName,
    this.name,
    this.company,
  }) : super._();

  factory _$CheckInEntityRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInEntityRefImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? name;
  @override
  final String? company;

  @override
  String toString() {
    return 'CheckInEntityRef(firstName: $firstName, lastName: $lastName, name: $name, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInEntityRefImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, name, company);

  /// Create a copy of CheckInEntityRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInEntityRefImplCopyWith<_$CheckInEntityRefImpl> get copyWith =>
      __$$CheckInEntityRefImplCopyWithImpl<_$CheckInEntityRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInEntityRefImplToJson(this);
  }
}

abstract class _CheckInEntityRef extends CheckInEntityRef {
  const factory _CheckInEntityRef({
    final String? firstName,
    final String? lastName,
    final String? name,
    final String? company,
  }) = _$CheckInEntityRefImpl;
  const _CheckInEntityRef._() : super._();

  factory _CheckInEntityRef.fromJson(Map<String, dynamic> json) =
      _$CheckInEntityRefImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get name;
  @override
  String? get company;

  /// Create a copy of CheckInEntityRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInEntityRefImplCopyWith<_$CheckInEntityRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
