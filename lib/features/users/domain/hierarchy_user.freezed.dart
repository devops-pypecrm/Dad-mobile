// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hierarchy_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HierarchyUser _$HierarchyUserFromJson(Map<String, dynamic> json) {
  return _HierarchyUser.fromJson(json);
}

/// @nodoc
mixin _$HierarchyUser {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get reportsToId => throw _privateConstructorUsedError;

  /// Serializes this HierarchyUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HierarchyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HierarchyUserCopyWith<HierarchyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HierarchyUserCopyWith<$Res> {
  factory $HierarchyUserCopyWith(
    HierarchyUser value,
    $Res Function(HierarchyUser) then,
  ) = _$HierarchyUserCopyWithImpl<$Res, HierarchyUser>;
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    String? email,
    String? role,
    String? reportsToId,
  });
}

/// @nodoc
class _$HierarchyUserCopyWithImpl<$Res, $Val extends HierarchyUser>
    implements $HierarchyUserCopyWith<$Res> {
  _$HierarchyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HierarchyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? role = freezed,
    Object? reportsToId = freezed,
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
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            reportsToId: freezed == reportsToId
                ? _value.reportsToId
                : reportsToId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HierarchyUserImplCopyWith<$Res>
    implements $HierarchyUserCopyWith<$Res> {
  factory _$$HierarchyUserImplCopyWith(
    _$HierarchyUserImpl value,
    $Res Function(_$HierarchyUserImpl) then,
  ) = __$$HierarchyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    String? email,
    String? role,
    String? reportsToId,
  });
}

/// @nodoc
class __$$HierarchyUserImplCopyWithImpl<$Res>
    extends _$HierarchyUserCopyWithImpl<$Res, _$HierarchyUserImpl>
    implements _$$HierarchyUserImplCopyWith<$Res> {
  __$$HierarchyUserImplCopyWithImpl(
    _$HierarchyUserImpl _value,
    $Res Function(_$HierarchyUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HierarchyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? role = freezed,
    Object? reportsToId = freezed,
  }) {
    return _then(
      _$HierarchyUserImpl(
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
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        reportsToId: freezed == reportsToId
            ? _value.reportsToId
            : reportsToId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HierarchyUserImpl extends _HierarchyUser {
  const _$HierarchyUserImpl({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.role,
    this.reportsToId,
  }) : super._();

  factory _$HierarchyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$HierarchyUserImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? email;
  @override
  final String? role;
  @override
  final String? reportsToId;

  @override
  String toString() {
    return 'HierarchyUser(id: $id, firstName: $firstName, lastName: $lastName, email: $email, role: $role, reportsToId: $reportsToId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HierarchyUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.reportsToId, reportsToId) ||
                other.reportsToId == reportsToId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    email,
    role,
    reportsToId,
  );

  /// Create a copy of HierarchyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HierarchyUserImplCopyWith<_$HierarchyUserImpl> get copyWith =>
      __$$HierarchyUserImplCopyWithImpl<_$HierarchyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HierarchyUserImplToJson(this);
  }
}

abstract class _HierarchyUser extends HierarchyUser {
  const factory _HierarchyUser({
    required final String id,
    required final String firstName,
    required final String lastName,
    final String? email,
    final String? role,
    final String? reportsToId,
  }) = _$HierarchyUserImpl;
  const _HierarchyUser._() : super._();

  factory _HierarchyUser.fromJson(Map<String, dynamic> json) =
      _$HierarchyUserImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get email;
  @override
  String? get role;
  @override
  String? get reportsToId;

  /// Create a copy of HierarchyUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HierarchyUserImplCopyWith<_$HierarchyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
