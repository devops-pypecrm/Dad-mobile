// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpportunityNote _$OpportunityNoteFromJson(Map<String, dynamic> json) {
  return _OpportunityNote.fromJson(json);
}

/// @nodoc
mixin _$OpportunityNote {
  String get id => throw _privateConstructorUsedError;
  String? get opportunityId => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  OpportunityNoteAuthor? get createdBy => throw _privateConstructorUsedError;

  /// Serializes this OpportunityNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpportunityNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityNoteCopyWith<OpportunityNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityNoteCopyWith<$Res> {
  factory $OpportunityNoteCopyWith(
    OpportunityNote value,
    $Res Function(OpportunityNote) then,
  ) = _$OpportunityNoteCopyWithImpl<$Res, OpportunityNote>;
  @useResult
  $Res call({
    String id,
    String? opportunityId,
    String? subject,
    String? description,
    DateTime date,
    OpportunityNoteAuthor? createdBy,
  });

  $OpportunityNoteAuthorCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$OpportunityNoteCopyWithImpl<$Res, $Val extends OpportunityNote>
    implements $OpportunityNoteCopyWith<$Res> {
  _$OpportunityNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunityNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? opportunityId = freezed,
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
            opportunityId: freezed == opportunityId
                ? _value.opportunityId
                : opportunityId // ignore: cast_nullable_to_non_nullable
                      as String?,
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
                      as OpportunityNoteAuthor?,
          )
          as $Val,
    );
  }

  /// Create a copy of OpportunityNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpportunityNoteAuthorCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $OpportunityNoteAuthorCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpportunityNoteImplCopyWith<$Res>
    implements $OpportunityNoteCopyWith<$Res> {
  factory _$$OpportunityNoteImplCopyWith(
    _$OpportunityNoteImpl value,
    $Res Function(_$OpportunityNoteImpl) then,
  ) = __$$OpportunityNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? opportunityId,
    String? subject,
    String? description,
    DateTime date,
    OpportunityNoteAuthor? createdBy,
  });

  @override
  $OpportunityNoteAuthorCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$OpportunityNoteImplCopyWithImpl<$Res>
    extends _$OpportunityNoteCopyWithImpl<$Res, _$OpportunityNoteImpl>
    implements _$$OpportunityNoteImplCopyWith<$Res> {
  __$$OpportunityNoteImplCopyWithImpl(
    _$OpportunityNoteImpl _value,
    $Res Function(_$OpportunityNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpportunityNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? opportunityId = freezed,
    Object? subject = freezed,
    Object? description = freezed,
    Object? date = null,
    Object? createdBy = freezed,
  }) {
    return _then(
      _$OpportunityNoteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        opportunityId: freezed == opportunityId
            ? _value.opportunityId
            : opportunityId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
                  as OpportunityNoteAuthor?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpportunityNoteImpl implements _OpportunityNote {
  const _$OpportunityNoteImpl({
    required this.id,
    this.opportunityId,
    this.subject,
    this.description,
    required this.date,
    this.createdBy,
  });

  factory _$OpportunityNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpportunityNoteImplFromJson(json);

  @override
  final String id;
  @override
  final String? opportunityId;
  @override
  final String? subject;
  @override
  final String? description;
  @override
  final DateTime date;
  @override
  final OpportunityNoteAuthor? createdBy;

  @override
  String toString() {
    return 'OpportunityNote(id: $id, opportunityId: $opportunityId, subject: $subject, description: $description, date: $date, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunityNoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.opportunityId, opportunityId) ||
                other.opportunityId == opportunityId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    opportunityId,
    subject,
    description,
    date,
    createdBy,
  );

  /// Create a copy of OpportunityNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunityNoteImplCopyWith<_$OpportunityNoteImpl> get copyWith =>
      __$$OpportunityNoteImplCopyWithImpl<_$OpportunityNoteImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpportunityNoteImplToJson(this);
  }
}

abstract class _OpportunityNote implements OpportunityNote {
  const factory _OpportunityNote({
    required final String id,
    final String? opportunityId,
    final String? subject,
    final String? description,
    required final DateTime date,
    final OpportunityNoteAuthor? createdBy,
  }) = _$OpportunityNoteImpl;

  factory _OpportunityNote.fromJson(Map<String, dynamic> json) =
      _$OpportunityNoteImpl.fromJson;

  @override
  String get id;
  @override
  String? get opportunityId;
  @override
  String? get subject;
  @override
  String? get description;
  @override
  DateTime get date;
  @override
  OpportunityNoteAuthor? get createdBy;

  /// Create a copy of OpportunityNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunityNoteImplCopyWith<_$OpportunityNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpportunityNoteAuthor _$OpportunityNoteAuthorFromJson(
  Map<String, dynamic> json,
) {
  return _OpportunityNoteAuthor.fromJson(json);
}

/// @nodoc
mixin _$OpportunityNoteAuthor {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this OpportunityNoteAuthor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpportunityNoteAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityNoteAuthorCopyWith<OpportunityNoteAuthor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityNoteAuthorCopyWith<$Res> {
  factory $OpportunityNoteAuthorCopyWith(
    OpportunityNoteAuthor value,
    $Res Function(OpportunityNoteAuthor) then,
  ) = _$OpportunityNoteAuthorCopyWithImpl<$Res, OpportunityNoteAuthor>;
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class _$OpportunityNoteAuthorCopyWithImpl<
  $Res,
  $Val extends OpportunityNoteAuthor
>
    implements $OpportunityNoteAuthorCopyWith<$Res> {
  _$OpportunityNoteAuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunityNoteAuthor
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
abstract class _$$OpportunityNoteAuthorImplCopyWith<$Res>
    implements $OpportunityNoteAuthorCopyWith<$Res> {
  factory _$$OpportunityNoteAuthorImplCopyWith(
    _$OpportunityNoteAuthorImpl value,
    $Res Function(_$OpportunityNoteAuthorImpl) then,
  ) = __$$OpportunityNoteAuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class __$$OpportunityNoteAuthorImplCopyWithImpl<$Res>
    extends
        _$OpportunityNoteAuthorCopyWithImpl<$Res, _$OpportunityNoteAuthorImpl>
    implements _$$OpportunityNoteAuthorImplCopyWith<$Res> {
  __$$OpportunityNoteAuthorImplCopyWithImpl(
    _$OpportunityNoteAuthorImpl _value,
    $Res Function(_$OpportunityNoteAuthorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpportunityNoteAuthor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = freezed, Object? lastName = freezed}) {
    return _then(
      _$OpportunityNoteAuthorImpl(
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
class _$OpportunityNoteAuthorImpl implements _OpportunityNoteAuthor {
  const _$OpportunityNoteAuthorImpl({this.firstName, this.lastName});

  factory _$OpportunityNoteAuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpportunityNoteAuthorImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'OpportunityNoteAuthor(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunityNoteAuthorImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of OpportunityNoteAuthor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunityNoteAuthorImplCopyWith<_$OpportunityNoteAuthorImpl>
  get copyWith =>
      __$$OpportunityNoteAuthorImplCopyWithImpl<_$OpportunityNoteAuthorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpportunityNoteAuthorImplToJson(this);
  }
}

abstract class _OpportunityNoteAuthor implements OpportunityNoteAuthor {
  const factory _OpportunityNoteAuthor({
    final String? firstName,
    final String? lastName,
  }) = _$OpportunityNoteAuthorImpl;

  factory _OpportunityNoteAuthor.fromJson(Map<String, dynamic> json) =
      _$OpportunityNoteAuthorImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;

  /// Create a copy of OpportunityNoteAuthor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunityNoteAuthorImplCopyWith<_$OpportunityNoteAuthorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
