// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followup_related_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FollowUpRelatedEntity _$FollowUpRelatedEntityFromJson(
  Map<String, dynamic> json,
) {
  return _FollowUpRelatedEntity.fromJson(json);
}

/// @nodoc
mixin _$FollowUpRelatedEntity {
  String get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this FollowUpRelatedEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpRelatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpRelatedEntityCopyWith<FollowUpRelatedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpRelatedEntityCopyWith<$Res> {
  factory $FollowUpRelatedEntityCopyWith(
    FollowUpRelatedEntity value,
    $Res Function(FollowUpRelatedEntity) then,
  ) = _$FollowUpRelatedEntityCopyWithImpl<$Res, FollowUpRelatedEntity>;
  @useResult
  $Res call({
    String id,
    String? firstName,
    String? lastName,
    String? name,
    String? company,
    String? phone,
  });
}

/// @nodoc
class _$FollowUpRelatedEntityCopyWithImpl<
  $Res,
  $Val extends FollowUpRelatedEntity
>
    implements $FollowUpRelatedEntityCopyWith<$Res> {
  _$FollowUpRelatedEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpRelatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? name = freezed,
    Object? company = freezed,
    Object? phone = freezed,
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
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowUpRelatedEntityImplCopyWith<$Res>
    implements $FollowUpRelatedEntityCopyWith<$Res> {
  factory _$$FollowUpRelatedEntityImplCopyWith(
    _$FollowUpRelatedEntityImpl value,
    $Res Function(_$FollowUpRelatedEntityImpl) then,
  ) = __$$FollowUpRelatedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? firstName,
    String? lastName,
    String? name,
    String? company,
    String? phone,
  });
}

/// @nodoc
class __$$FollowUpRelatedEntityImplCopyWithImpl<$Res>
    extends
        _$FollowUpRelatedEntityCopyWithImpl<$Res, _$FollowUpRelatedEntityImpl>
    implements _$$FollowUpRelatedEntityImplCopyWith<$Res> {
  __$$FollowUpRelatedEntityImplCopyWithImpl(
    _$FollowUpRelatedEntityImpl _value,
    $Res Function(_$FollowUpRelatedEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpRelatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? name = freezed,
    Object? company = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _$FollowUpRelatedEntityImpl(
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
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpRelatedEntityImpl extends _FollowUpRelatedEntity {
  const _$FollowUpRelatedEntityImpl({
    required this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.company,
    this.phone,
  }) : super._();

  factory _$FollowUpRelatedEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpRelatedEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? name;
  @override
  final String? company;
  @override
  final String? phone;

  @override
  String toString() {
    return 'FollowUpRelatedEntity(id: $id, firstName: $firstName, lastName: $lastName, name: $name, company: $company, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpRelatedEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, name, company, phone);

  /// Create a copy of FollowUpRelatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpRelatedEntityImplCopyWith<_$FollowUpRelatedEntityImpl>
  get copyWith =>
      __$$FollowUpRelatedEntityImplCopyWithImpl<_$FollowUpRelatedEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpRelatedEntityImplToJson(this);
  }
}

abstract class _FollowUpRelatedEntity extends FollowUpRelatedEntity {
  const factory _FollowUpRelatedEntity({
    required final String id,
    final String? firstName,
    final String? lastName,
    final String? name,
    final String? company,
    final String? phone,
  }) = _$FollowUpRelatedEntityImpl;
  const _FollowUpRelatedEntity._() : super._();

  factory _FollowUpRelatedEntity.fromJson(Map<String, dynamic> json) =
      _$FollowUpRelatedEntityImpl.fromJson;

  @override
  String get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get name;
  @override
  String? get company;
  @override
  String? get phone;

  /// Create a copy of FollowUpRelatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpRelatedEntityImplCopyWith<_$FollowUpRelatedEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
