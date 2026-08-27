// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Interaction _$InteractionFromJson(Map<String, dynamic> json) {
  return _Interaction.fromJson(json);
}

/// @nodoc
mixin _$Interaction {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  InteractionAuthor? get createdBy => throw _privateConstructorUsedError;

  /// Serializes this Interaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Interaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractionCopyWith<Interaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionCopyWith<$Res> {
  factory $InteractionCopyWith(
    Interaction value,
    $Res Function(Interaction) then,
  ) = _$InteractionCopyWithImpl<$Res, Interaction>;
  @useResult
  $Res call({
    String id,
    String type,
    String? subject,
    String? description,
    DateTime date,
    InteractionAuthor? createdBy,
  });

  $InteractionAuthorCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$InteractionCopyWithImpl<$Res, $Val extends Interaction>
    implements $InteractionCopyWith<$Res> {
  _$InteractionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Interaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? subject = freezed,
    Object? description = freezed,
    Object? date = null,
    Object? createdBy = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as InteractionAuthor?,
          )
          as $Val,
    );
  }

  /// Create a copy of Interaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InteractionAuthorCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $InteractionAuthorCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InteractionImplCopyWith<$Res>
    implements $InteractionCopyWith<$Res> {
  factory _$$InteractionImplCopyWith(
    _$InteractionImpl value,
    $Res Function(_$InteractionImpl) then,
  ) = __$$InteractionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String? subject,
    String? description,
    DateTime date,
    InteractionAuthor? createdBy,
  });

  @override
  $InteractionAuthorCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$InteractionImplCopyWithImpl<$Res>
    extends _$InteractionCopyWithImpl<$Res, _$InteractionImpl>
    implements _$$InteractionImplCopyWith<$Res> {
  __$$InteractionImplCopyWithImpl(
    _$InteractionImpl _value,
    $Res Function(_$InteractionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Interaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? subject = freezed,
    Object? description = freezed,
    Object? date = null,
    Object? createdBy = freezed,
  }) {
    return _then(
      _$InteractionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as InteractionAuthor?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InteractionImpl implements _Interaction {
  const _$InteractionImpl({
    required this.id,
    required this.type,
    this.subject,
    this.description,
    required this.date,
    this.createdBy,
  });

  factory _$InteractionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractionImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String? subject;
  @override
  final String? description;
  @override
  final DateTime date;
  @override
  final InteractionAuthor? createdBy;

  @override
  String toString() {
    return 'Interaction(id: $id, type: $type, subject: $subject, description: $description, date: $date, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, subject, description, date, createdBy);

  /// Create a copy of Interaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionImplCopyWith<_$InteractionImpl> get copyWith =>
      __$$InteractionImplCopyWithImpl<_$InteractionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractionImplToJson(this);
  }
}

abstract class _Interaction implements Interaction {
  const factory _Interaction({
    required final String id,
    required final String type,
    final String? subject,
    final String? description,
    required final DateTime date,
    final InteractionAuthor? createdBy,
  }) = _$InteractionImpl;

  factory _Interaction.fromJson(Map<String, dynamic> json) =
      _$InteractionImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String? get subject;
  @override
  String? get description;
  @override
  DateTime get date;
  @override
  InteractionAuthor? get createdBy;

  /// Create a copy of Interaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionImplCopyWith<_$InteractionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InteractionAuthor _$InteractionAuthorFromJson(Map<String, dynamic> json) {
  return _InteractionAuthor.fromJson(json);
}

/// @nodoc
mixin _$InteractionAuthor {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this InteractionAuthor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InteractionAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractionAuthorCopyWith<InteractionAuthor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionAuthorCopyWith<$Res> {
  factory $InteractionAuthorCopyWith(
    InteractionAuthor value,
    $Res Function(InteractionAuthor) then,
  ) = _$InteractionAuthorCopyWithImpl<$Res, InteractionAuthor>;
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class _$InteractionAuthorCopyWithImpl<$Res, $Val extends InteractionAuthor>
    implements $InteractionAuthorCopyWith<$Res> {
  _$InteractionAuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InteractionAuthor
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
abstract class _$$InteractionAuthorImplCopyWith<$Res>
    implements $InteractionAuthorCopyWith<$Res> {
  factory _$$InteractionAuthorImplCopyWith(
    _$InteractionAuthorImpl value,
    $Res Function(_$InteractionAuthorImpl) then,
  ) = __$$InteractionAuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class __$$InteractionAuthorImplCopyWithImpl<$Res>
    extends _$InteractionAuthorCopyWithImpl<$Res, _$InteractionAuthorImpl>
    implements _$$InteractionAuthorImplCopyWith<$Res> {
  __$$InteractionAuthorImplCopyWithImpl(
    _$InteractionAuthorImpl _value,
    $Res Function(_$InteractionAuthorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InteractionAuthor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = freezed, Object? lastName = freezed}) {
    return _then(
      _$InteractionAuthorImpl(
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
class _$InteractionAuthorImpl implements _InteractionAuthor {
  const _$InteractionAuthorImpl({this.firstName, this.lastName});

  factory _$InteractionAuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractionAuthorImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'InteractionAuthor(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionAuthorImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of InteractionAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionAuthorImplCopyWith<_$InteractionAuthorImpl> get copyWith =>
      __$$InteractionAuthorImplCopyWithImpl<_$InteractionAuthorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractionAuthorImplToJson(this);
  }
}

abstract class _InteractionAuthor implements InteractionAuthor {
  const factory _InteractionAuthor({
    final String? firstName,
    final String? lastName,
  }) = _$InteractionAuthorImpl;

  factory _InteractionAuthor.fromJson(Map<String, dynamic> json) =
      _$InteractionAuthorImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;

  /// Create a copy of InteractionAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionAuthorImplCopyWith<_$InteractionAuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
