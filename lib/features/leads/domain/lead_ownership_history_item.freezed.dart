// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_ownership_history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadOwnershipHistoryItem _$LeadOwnershipHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _LeadOwnershipHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$LeadOwnershipHistoryItem {
  String get id => throw _privateConstructorUsedError;
  LeadHistoryUser? get oldOwner => throw _privateConstructorUsedError;
  LeadHistoryUser? get newOwner => throw _privateConstructorUsedError;
  LeadHistoryUser? get changedBy => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LeadOwnershipHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadOwnershipHistoryItemCopyWith<LeadOwnershipHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadOwnershipHistoryItemCopyWith<$Res> {
  factory $LeadOwnershipHistoryItemCopyWith(
    LeadOwnershipHistoryItem value,
    $Res Function(LeadOwnershipHistoryItem) then,
  ) = _$LeadOwnershipHistoryItemCopyWithImpl<$Res, LeadOwnershipHistoryItem>;
  @useResult
  $Res call({
    String id,
    LeadHistoryUser? oldOwner,
    LeadHistoryUser? newOwner,
    LeadHistoryUser? changedBy,
    String? reason,
    DateTime createdAt,
  });

  $LeadHistoryUserCopyWith<$Res>? get oldOwner;
  $LeadHistoryUserCopyWith<$Res>? get newOwner;
  $LeadHistoryUserCopyWith<$Res>? get changedBy;
}

/// @nodoc
class _$LeadOwnershipHistoryItemCopyWithImpl<
  $Res,
  $Val extends LeadOwnershipHistoryItem
>
    implements $LeadOwnershipHistoryItemCopyWith<$Res> {
  _$LeadOwnershipHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oldOwner = freezed,
    Object? newOwner = freezed,
    Object? changedBy = freezed,
    Object? reason = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            oldOwner: freezed == oldOwner
                ? _value.oldOwner
                : oldOwner // ignore: cast_nullable_to_non_nullable
                      as LeadHistoryUser?,
            newOwner: freezed == newOwner
                ? _value.newOwner
                : newOwner // ignore: cast_nullable_to_non_nullable
                      as LeadHistoryUser?,
            changedBy: freezed == changedBy
                ? _value.changedBy
                : changedBy // ignore: cast_nullable_to_non_nullable
                      as LeadHistoryUser?,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadHistoryUserCopyWith<$Res>? get oldOwner {
    if (_value.oldOwner == null) {
      return null;
    }

    return $LeadHistoryUserCopyWith<$Res>(_value.oldOwner!, (value) {
      return _then(_value.copyWith(oldOwner: value) as $Val);
    });
  }

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadHistoryUserCopyWith<$Res>? get newOwner {
    if (_value.newOwner == null) {
      return null;
    }

    return $LeadHistoryUserCopyWith<$Res>(_value.newOwner!, (value) {
      return _then(_value.copyWith(newOwner: value) as $Val);
    });
  }

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadHistoryUserCopyWith<$Res>? get changedBy {
    if (_value.changedBy == null) {
      return null;
    }

    return $LeadHistoryUserCopyWith<$Res>(_value.changedBy!, (value) {
      return _then(_value.copyWith(changedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadOwnershipHistoryItemImplCopyWith<$Res>
    implements $LeadOwnershipHistoryItemCopyWith<$Res> {
  factory _$$LeadOwnershipHistoryItemImplCopyWith(
    _$LeadOwnershipHistoryItemImpl value,
    $Res Function(_$LeadOwnershipHistoryItemImpl) then,
  ) = __$$LeadOwnershipHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    LeadHistoryUser? oldOwner,
    LeadHistoryUser? newOwner,
    LeadHistoryUser? changedBy,
    String? reason,
    DateTime createdAt,
  });

  @override
  $LeadHistoryUserCopyWith<$Res>? get oldOwner;
  @override
  $LeadHistoryUserCopyWith<$Res>? get newOwner;
  @override
  $LeadHistoryUserCopyWith<$Res>? get changedBy;
}

/// @nodoc
class __$$LeadOwnershipHistoryItemImplCopyWithImpl<$Res>
    extends
        _$LeadOwnershipHistoryItemCopyWithImpl<
          $Res,
          _$LeadOwnershipHistoryItemImpl
        >
    implements _$$LeadOwnershipHistoryItemImplCopyWith<$Res> {
  __$$LeadOwnershipHistoryItemImplCopyWithImpl(
    _$LeadOwnershipHistoryItemImpl _value,
    $Res Function(_$LeadOwnershipHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oldOwner = freezed,
    Object? newOwner = freezed,
    Object? changedBy = freezed,
    Object? reason = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$LeadOwnershipHistoryItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        oldOwner: freezed == oldOwner
            ? _value.oldOwner
            : oldOwner // ignore: cast_nullable_to_non_nullable
                  as LeadHistoryUser?,
        newOwner: freezed == newOwner
            ? _value.newOwner
            : newOwner // ignore: cast_nullable_to_non_nullable
                  as LeadHistoryUser?,
        changedBy: freezed == changedBy
            ? _value.changedBy
            : changedBy // ignore: cast_nullable_to_non_nullable
                  as LeadHistoryUser?,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadOwnershipHistoryItemImpl implements _LeadOwnershipHistoryItem {
  const _$LeadOwnershipHistoryItemImpl({
    required this.id,
    this.oldOwner,
    this.newOwner,
    this.changedBy,
    this.reason,
    required this.createdAt,
  });

  factory _$LeadOwnershipHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadOwnershipHistoryItemImplFromJson(json);

  @override
  final String id;
  @override
  final LeadHistoryUser? oldOwner;
  @override
  final LeadHistoryUser? newOwner;
  @override
  final LeadHistoryUser? changedBy;
  @override
  final String? reason;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'LeadOwnershipHistoryItem(id: $id, oldOwner: $oldOwner, newOwner: $newOwner, changedBy: $changedBy, reason: $reason, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadOwnershipHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.oldOwner, oldOwner) ||
                other.oldOwner == oldOwner) &&
            (identical(other.newOwner, newOwner) ||
                other.newOwner == newOwner) &&
            (identical(other.changedBy, changedBy) ||
                other.changedBy == changedBy) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    oldOwner,
    newOwner,
    changedBy,
    reason,
    createdAt,
  );

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadOwnershipHistoryItemImplCopyWith<_$LeadOwnershipHistoryItemImpl>
  get copyWith =>
      __$$LeadOwnershipHistoryItemImplCopyWithImpl<
        _$LeadOwnershipHistoryItemImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadOwnershipHistoryItemImplToJson(this);
  }
}

abstract class _LeadOwnershipHistoryItem implements LeadOwnershipHistoryItem {
  const factory _LeadOwnershipHistoryItem({
    required final String id,
    final LeadHistoryUser? oldOwner,
    final LeadHistoryUser? newOwner,
    final LeadHistoryUser? changedBy,
    final String? reason,
    required final DateTime createdAt,
  }) = _$LeadOwnershipHistoryItemImpl;

  factory _LeadOwnershipHistoryItem.fromJson(Map<String, dynamic> json) =
      _$LeadOwnershipHistoryItemImpl.fromJson;

  @override
  String get id;
  @override
  LeadHistoryUser? get oldOwner;
  @override
  LeadHistoryUser? get newOwner;
  @override
  LeadHistoryUser? get changedBy;
  @override
  String? get reason;
  @override
  DateTime get createdAt;

  /// Create a copy of LeadOwnershipHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadOwnershipHistoryItemImplCopyWith<_$LeadOwnershipHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadHistoryUser _$LeadHistoryUserFromJson(Map<String, dynamic> json) {
  return _LeadHistoryUser.fromJson(json);
}

/// @nodoc
mixin _$LeadHistoryUser {
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this LeadHistoryUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadHistoryUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadHistoryUserCopyWith<LeadHistoryUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadHistoryUserCopyWith<$Res> {
  factory $LeadHistoryUserCopyWith(
    LeadHistoryUser value,
    $Res Function(LeadHistoryUser) then,
  ) = _$LeadHistoryUserCopyWithImpl<$Res, LeadHistoryUser>;
  @useResult
  $Res call({String firstName, String? lastName});
}

/// @nodoc
class _$LeadHistoryUserCopyWithImpl<$Res, $Val extends LeadHistoryUser>
    implements $LeadHistoryUserCopyWith<$Res> {
  _$LeadHistoryUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadHistoryUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = null, Object? lastName = freezed}) {
    return _then(
      _value.copyWith(
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$LeadHistoryUserImplCopyWith<$Res>
    implements $LeadHistoryUserCopyWith<$Res> {
  factory _$$LeadHistoryUserImplCopyWith(
    _$LeadHistoryUserImpl value,
    $Res Function(_$LeadHistoryUserImpl) then,
  ) = __$$LeadHistoryUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String? lastName});
}

/// @nodoc
class __$$LeadHistoryUserImplCopyWithImpl<$Res>
    extends _$LeadHistoryUserCopyWithImpl<$Res, _$LeadHistoryUserImpl>
    implements _$$LeadHistoryUserImplCopyWith<$Res> {
  __$$LeadHistoryUserImplCopyWithImpl(
    _$LeadHistoryUserImpl _value,
    $Res Function(_$LeadHistoryUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadHistoryUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = null, Object? lastName = freezed}) {
    return _then(
      _$LeadHistoryUserImpl(
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$LeadHistoryUserImpl implements _LeadHistoryUser {
  const _$LeadHistoryUserImpl({required this.firstName, this.lastName});

  factory _$LeadHistoryUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadHistoryUserImplFromJson(json);

  @override
  final String firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'LeadHistoryUser(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadHistoryUserImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of LeadHistoryUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadHistoryUserImplCopyWith<_$LeadHistoryUserImpl> get copyWith =>
      __$$LeadHistoryUserImplCopyWithImpl<_$LeadHistoryUserImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadHistoryUserImplToJson(this);
  }
}

abstract class _LeadHistoryUser implements LeadHistoryUser {
  const factory _LeadHistoryUser({
    required final String firstName,
    final String? lastName,
  }) = _$LeadHistoryUserImpl;

  factory _LeadHistoryUser.fromJson(Map<String, dynamic> json) =
      _$LeadHistoryUserImpl.fromJson;

  @override
  String get firstName;
  @override
  String? get lastName;

  /// Create a copy of LeadHistoryUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadHistoryUserImplCopyWith<_$LeadHistoryUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
