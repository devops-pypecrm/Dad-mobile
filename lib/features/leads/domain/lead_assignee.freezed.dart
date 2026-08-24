// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_assignee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadAssignee _$LeadAssigneeFromJson(Map<String, dynamic> json) {
  return _LeadAssignee.fromJson(json);
}

/// @nodoc
mixin _$LeadAssignee {
  String? get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this LeadAssignee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadAssignee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadAssigneeCopyWith<LeadAssignee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadAssigneeCopyWith<$Res> {
  factory $LeadAssigneeCopyWith(
    LeadAssignee value,
    $Res Function(LeadAssignee) then,
  ) = _$LeadAssigneeCopyWithImpl<$Res, LeadAssignee>;
  @useResult
  $Res call({String? id, String firstName, String lastName, String email});
}

/// @nodoc
class _$LeadAssigneeCopyWithImpl<$Res, $Val extends LeadAssignee>
    implements $LeadAssigneeCopyWith<$Res> {
  _$LeadAssigneeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadAssignee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadAssigneeImplCopyWith<$Res>
    implements $LeadAssigneeCopyWith<$Res> {
  factory _$$LeadAssigneeImplCopyWith(
    _$LeadAssigneeImpl value,
    $Res Function(_$LeadAssigneeImpl) then,
  ) = __$$LeadAssigneeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String firstName, String lastName, String email});
}

/// @nodoc
class __$$LeadAssigneeImplCopyWithImpl<$Res>
    extends _$LeadAssigneeCopyWithImpl<$Res, _$LeadAssigneeImpl>
    implements _$$LeadAssigneeImplCopyWith<$Res> {
  __$$LeadAssigneeImplCopyWithImpl(
    _$LeadAssigneeImpl _value,
    $Res Function(_$LeadAssigneeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadAssignee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(
      _$LeadAssigneeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadAssigneeImpl implements _LeadAssignee {
  const _$LeadAssigneeImpl({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory _$LeadAssigneeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadAssigneeImplFromJson(json);

  @override
  final String? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;

  @override
  String toString() {
    return 'LeadAssignee(id: $id, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadAssigneeImpl &&
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

  /// Create a copy of LeadAssignee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadAssigneeImplCopyWith<_$LeadAssigneeImpl> get copyWith =>
      __$$LeadAssigneeImplCopyWithImpl<_$LeadAssigneeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadAssigneeImplToJson(this);
  }
}

abstract class _LeadAssignee implements LeadAssignee {
  const factory _LeadAssignee({
    final String? id,
    required final String firstName,
    required final String lastName,
    required final String email,
  }) = _$LeadAssigneeImpl;

  factory _LeadAssignee.fromJson(Map<String, dynamic> json) =
      _$LeadAssigneeImpl.fromJson;

  @override
  String? get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;

  /// Create a copy of LeadAssignee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadAssigneeImplCopyWith<_$LeadAssigneeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
