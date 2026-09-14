// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity_timeline_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpportunityTimelineItem _$OpportunityTimelineItemFromJson(
  Map<String, dynamic> json,
) {
  return _OpportunityTimelineItem.fromJson(json);
}

/// @nodoc
mixin _$OpportunityTimelineItem {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get subType => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimelineActor? get actor => throw _privateConstructorUsedError;
  Map<String, dynamic> get meta => throw _privateConstructorUsedError;

  /// Serializes this OpportunityTimelineItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpportunityTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityTimelineItemCopyWith<OpportunityTimelineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityTimelineItemCopyWith<$Res> {
  factory $OpportunityTimelineItemCopyWith(
    OpportunityTimelineItem value,
    $Res Function(OpportunityTimelineItem) then,
  ) = _$OpportunityTimelineItemCopyWithImpl<$Res, OpportunityTimelineItem>;
  @useResult
  $Res call({
    String id,
    String type,
    String? subType,
    String? title,
    String? description,
    DateTime date,
    TimelineActor? actor,
    Map<String, dynamic> meta,
  });

  $TimelineActorCopyWith<$Res>? get actor;
}

/// @nodoc
class _$OpportunityTimelineItemCopyWithImpl<
  $Res,
  $Val extends OpportunityTimelineItem
>
    implements $OpportunityTimelineItemCopyWith<$Res> {
  _$OpportunityTimelineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunityTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? subType = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = null,
    Object? actor = freezed,
    Object? meta = null,
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
            subType: freezed == subType
                ? _value.subType
                : subType // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            actor: freezed == actor
                ? _value.actor
                : actor // ignore: cast_nullable_to_non_nullable
                      as TimelineActor?,
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }

  /// Create a copy of OpportunityTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimelineActorCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $TimelineActorCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpportunityTimelineItemImplCopyWith<$Res>
    implements $OpportunityTimelineItemCopyWith<$Res> {
  factory _$$OpportunityTimelineItemImplCopyWith(
    _$OpportunityTimelineItemImpl value,
    $Res Function(_$OpportunityTimelineItemImpl) then,
  ) = __$$OpportunityTimelineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String? subType,
    String? title,
    String? description,
    DateTime date,
    TimelineActor? actor,
    Map<String, dynamic> meta,
  });

  @override
  $TimelineActorCopyWith<$Res>? get actor;
}

/// @nodoc
class __$$OpportunityTimelineItemImplCopyWithImpl<$Res>
    extends
        _$OpportunityTimelineItemCopyWithImpl<
          $Res,
          _$OpportunityTimelineItemImpl
        >
    implements _$$OpportunityTimelineItemImplCopyWith<$Res> {
  __$$OpportunityTimelineItemImplCopyWithImpl(
    _$OpportunityTimelineItemImpl _value,
    $Res Function(_$OpportunityTimelineItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpportunityTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? subType = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = null,
    Object? actor = freezed,
    Object? meta = null,
  }) {
    return _then(
      _$OpportunityTimelineItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        subType: freezed == subType
            ? _value.subType
            : subType // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        actor: freezed == actor
            ? _value.actor
            : actor // ignore: cast_nullable_to_non_nullable
                  as TimelineActor?,
        meta: null == meta
            ? _value._meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpportunityTimelineItemImpl implements _OpportunityTimelineItem {
  const _$OpportunityTimelineItemImpl({
    required this.id,
    required this.type,
    this.subType,
    this.title,
    this.description,
    required this.date,
    this.actor,
    final Map<String, dynamic> meta = const <String, dynamic>{},
  }) : _meta = meta;

  factory _$OpportunityTimelineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpportunityTimelineItemImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String? subType;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final DateTime date;
  @override
  final TimelineActor? actor;
  final Map<String, dynamic> _meta;
  @override
  @JsonKey()
  Map<String, dynamic> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  String toString() {
    return 'OpportunityTimelineItem(id: $id, type: $type, subType: $subType, title: $title, description: $description, date: $date, actor: $actor, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunityTimelineItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    subType,
    title,
    description,
    date,
    actor,
    const DeepCollectionEquality().hash(_meta),
  );

  /// Create a copy of OpportunityTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunityTimelineItemImplCopyWith<_$OpportunityTimelineItemImpl>
  get copyWith =>
      __$$OpportunityTimelineItemImplCopyWithImpl<
        _$OpportunityTimelineItemImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpportunityTimelineItemImplToJson(this);
  }
}

abstract class _OpportunityTimelineItem implements OpportunityTimelineItem {
  const factory _OpportunityTimelineItem({
    required final String id,
    required final String type,
    final String? subType,
    final String? title,
    final String? description,
    required final DateTime date,
    final TimelineActor? actor,
    final Map<String, dynamic> meta,
  }) = _$OpportunityTimelineItemImpl;

  factory _OpportunityTimelineItem.fromJson(Map<String, dynamic> json) =
      _$OpportunityTimelineItemImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String? get subType;
  @override
  String? get title;
  @override
  String? get description;
  @override
  DateTime get date;
  @override
  TimelineActor? get actor;
  @override
  Map<String, dynamic> get meta;

  /// Create a copy of OpportunityTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunityTimelineItemImplCopyWith<_$OpportunityTimelineItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TimelineActor _$TimelineActorFromJson(Map<String, dynamic> json) {
  return _TimelineActor.fromJson(json);
}

/// @nodoc
mixin _$TimelineActor {
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this TimelineActor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineActorCopyWith<TimelineActor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineActorCopyWith<$Res> {
  factory $TimelineActorCopyWith(
    TimelineActor value,
    $Res Function(TimelineActor) then,
  ) = _$TimelineActorCopyWithImpl<$Res, TimelineActor>;
  @useResult
  $Res call({String firstName, String? lastName});
}

/// @nodoc
class _$TimelineActorCopyWithImpl<$Res, $Val extends TimelineActor>
    implements $TimelineActorCopyWith<$Res> {
  _$TimelineActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineActor
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
abstract class _$$TimelineActorImplCopyWith<$Res>
    implements $TimelineActorCopyWith<$Res> {
  factory _$$TimelineActorImplCopyWith(
    _$TimelineActorImpl value,
    $Res Function(_$TimelineActorImpl) then,
  ) = __$$TimelineActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String? lastName});
}

/// @nodoc
class __$$TimelineActorImplCopyWithImpl<$Res>
    extends _$TimelineActorCopyWithImpl<$Res, _$TimelineActorImpl>
    implements _$$TimelineActorImplCopyWith<$Res> {
  __$$TimelineActorImplCopyWithImpl(
    _$TimelineActorImpl _value,
    $Res Function(_$TimelineActorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = null, Object? lastName = freezed}) {
    return _then(
      _$TimelineActorImpl(
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
class _$TimelineActorImpl extends _TimelineActor {
  const _$TimelineActorImpl({required this.firstName, this.lastName})
    : super._();

  factory _$TimelineActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineActorImplFromJson(json);

  @override
  final String firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'TimelineActor(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineActorImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of TimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineActorImplCopyWith<_$TimelineActorImpl> get copyWith =>
      __$$TimelineActorImplCopyWithImpl<_$TimelineActorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineActorImplToJson(this);
  }
}

abstract class _TimelineActor extends TimelineActor {
  const factory _TimelineActor({
    required final String firstName,
    final String? lastName,
  }) = _$TimelineActorImpl;
  const _TimelineActor._() : super._();

  factory _TimelineActor.fromJson(Map<String, dynamic> json) =
      _$TimelineActorImpl.fromJson;

  @override
  String get firstName;
  @override
  String? get lastName;

  /// Create a copy of TimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineActorImplCopyWith<_$TimelineActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
