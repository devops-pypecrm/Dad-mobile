// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_timeline_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadTimelineItem _$LeadTimelineItemFromJson(Map<String, dynamic> json) {
  return _LeadTimelineItem.fromJson(json);
}

/// @nodoc
mixin _$LeadTimelineItem {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get subType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  LeadTimelineActor? get actor => throw _privateConstructorUsedError;
  LeadTimelineMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this LeadTimelineItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadTimelineItemCopyWith<LeadTimelineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadTimelineItemCopyWith<$Res> {
  factory $LeadTimelineItemCopyWith(
    LeadTimelineItem value,
    $Res Function(LeadTimelineItem) then,
  ) = _$LeadTimelineItemCopyWithImpl<$Res, LeadTimelineItem>;
  @useResult
  $Res call({
    String id,
    String type,
    String subType,
    String title,
    String? description,
    DateTime date,
    LeadTimelineActor? actor,
    LeadTimelineMeta? meta,
  });

  $LeadTimelineActorCopyWith<$Res>? get actor;
  $LeadTimelineMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$LeadTimelineItemCopyWithImpl<$Res, $Val extends LeadTimelineItem>
    implements $LeadTimelineItemCopyWith<$Res> {
  _$LeadTimelineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? subType = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? actor = freezed,
    Object? meta = freezed,
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
            subType: null == subType
                ? _value.subType
                : subType // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as LeadTimelineActor?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as LeadTimelineMeta?,
          )
          as $Val,
    );
  }

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadTimelineActorCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $LeadTimelineActorCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadTimelineMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $LeadTimelineMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadTimelineItemImplCopyWith<$Res>
    implements $LeadTimelineItemCopyWith<$Res> {
  factory _$$LeadTimelineItemImplCopyWith(
    _$LeadTimelineItemImpl value,
    $Res Function(_$LeadTimelineItemImpl) then,
  ) = __$$LeadTimelineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String subType,
    String title,
    String? description,
    DateTime date,
    LeadTimelineActor? actor,
    LeadTimelineMeta? meta,
  });

  @override
  $LeadTimelineActorCopyWith<$Res>? get actor;
  @override
  $LeadTimelineMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$LeadTimelineItemImplCopyWithImpl<$Res>
    extends _$LeadTimelineItemCopyWithImpl<$Res, _$LeadTimelineItemImpl>
    implements _$$LeadTimelineItemImplCopyWith<$Res> {
  __$$LeadTimelineItemImplCopyWithImpl(
    _$LeadTimelineItemImpl _value,
    $Res Function(_$LeadTimelineItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? subType = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? actor = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _$LeadTimelineItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        subType: null == subType
            ? _value.subType
            : subType // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as LeadTimelineActor?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as LeadTimelineMeta?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadTimelineItemImpl implements _LeadTimelineItem {
  const _$LeadTimelineItemImpl({
    required this.id,
    required this.type,
    required this.subType,
    required this.title,
    this.description,
    required this.date,
    this.actor,
    this.meta,
  });

  factory _$LeadTimelineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadTimelineItemImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String subType;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime date;
  @override
  final LeadTimelineActor? actor;
  @override
  final LeadTimelineMeta? meta;

  @override
  String toString() {
    return 'LeadTimelineItem(id: $id, type: $type, subType: $subType, title: $title, description: $description, date: $date, actor: $actor, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadTimelineItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.meta, meta) || other.meta == meta));
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
    meta,
  );

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadTimelineItemImplCopyWith<_$LeadTimelineItemImpl> get copyWith =>
      __$$LeadTimelineItemImplCopyWithImpl<_$LeadTimelineItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadTimelineItemImplToJson(this);
  }
}

abstract class _LeadTimelineItem implements LeadTimelineItem {
  const factory _LeadTimelineItem({
    required final String id,
    required final String type,
    required final String subType,
    required final String title,
    final String? description,
    required final DateTime date,
    final LeadTimelineActor? actor,
    final LeadTimelineMeta? meta,
  }) = _$LeadTimelineItemImpl;

  factory _LeadTimelineItem.fromJson(Map<String, dynamic> json) =
      _$LeadTimelineItemImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get subType;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get date;
  @override
  LeadTimelineActor? get actor;
  @override
  LeadTimelineMeta? get meta;

  /// Create a copy of LeadTimelineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadTimelineItemImplCopyWith<_$LeadTimelineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadTimelineActor _$LeadTimelineActorFromJson(Map<String, dynamic> json) {
  return _LeadTimelineActor.fromJson(json);
}

/// @nodoc
mixin _$LeadTimelineActor {
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this LeadTimelineActor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadTimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadTimelineActorCopyWith<LeadTimelineActor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadTimelineActorCopyWith<$Res> {
  factory $LeadTimelineActorCopyWith(
    LeadTimelineActor value,
    $Res Function(LeadTimelineActor) then,
  ) = _$LeadTimelineActorCopyWithImpl<$Res, LeadTimelineActor>;
  @useResult
  $Res call({String firstName, String? lastName});
}

/// @nodoc
class _$LeadTimelineActorCopyWithImpl<$Res, $Val extends LeadTimelineActor>
    implements $LeadTimelineActorCopyWith<$Res> {
  _$LeadTimelineActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadTimelineActor
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
abstract class _$$LeadTimelineActorImplCopyWith<$Res>
    implements $LeadTimelineActorCopyWith<$Res> {
  factory _$$LeadTimelineActorImplCopyWith(
    _$LeadTimelineActorImpl value,
    $Res Function(_$LeadTimelineActorImpl) then,
  ) = __$$LeadTimelineActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String? lastName});
}

/// @nodoc
class __$$LeadTimelineActorImplCopyWithImpl<$Res>
    extends _$LeadTimelineActorCopyWithImpl<$Res, _$LeadTimelineActorImpl>
    implements _$$LeadTimelineActorImplCopyWith<$Res> {
  __$$LeadTimelineActorImplCopyWithImpl(
    _$LeadTimelineActorImpl _value,
    $Res Function(_$LeadTimelineActorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadTimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? firstName = null, Object? lastName = freezed}) {
    return _then(
      _$LeadTimelineActorImpl(
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
class _$LeadTimelineActorImpl implements _LeadTimelineActor {
  const _$LeadTimelineActorImpl({required this.firstName, this.lastName});

  factory _$LeadTimelineActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadTimelineActorImplFromJson(json);

  @override
  final String firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'LeadTimelineActor(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadTimelineActorImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of LeadTimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadTimelineActorImplCopyWith<_$LeadTimelineActorImpl> get copyWith =>
      __$$LeadTimelineActorImplCopyWithImpl<_$LeadTimelineActorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadTimelineActorImplToJson(this);
  }
}

abstract class _LeadTimelineActor implements LeadTimelineActor {
  const factory _LeadTimelineActor({
    required final String firstName,
    final String? lastName,
  }) = _$LeadTimelineActorImpl;

  factory _LeadTimelineActor.fromJson(Map<String, dynamic> json) =
      _$LeadTimelineActorImpl.fromJson;

  @override
  String get firstName;
  @override
  String? get lastName;

  /// Create a copy of LeadTimelineActor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadTimelineActorImplCopyWith<_$LeadTimelineActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadTimelineMeta _$LeadTimelineMetaFromJson(Map<String, dynamic> json) {
  return _LeadTimelineMeta.fromJson(json);
}

/// @nodoc
mixin _$LeadTimelineMeta {
  String? get direction => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  double? get recordingDuration => throw _privateConstructorUsedError;
  double? get hardwareDuration => throw _privateConstructorUsedError;
  String? get recordingUrl => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  String? get fileType => throw _privateConstructorUsedError;
  double? get fileSize => throw _privateConstructorUsedError;
  String? get callType => throw _privateConstructorUsedError;

  /// Serializes this LeadTimelineMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadTimelineMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadTimelineMetaCopyWith<LeadTimelineMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadTimelineMetaCopyWith<$Res> {
  factory $LeadTimelineMetaCopyWith(
    LeadTimelineMeta value,
    $Res Function(LeadTimelineMeta) then,
  ) = _$LeadTimelineMetaCopyWithImpl<$Res, LeadTimelineMeta>;
  @useResult
  $Res call({
    String? direction,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? recordingUrl,
    String? priority,
    String? location,
    String? fileUrl,
    String? fileType,
    double? fileSize,
    String? callType,
  });
}

/// @nodoc
class _$LeadTimelineMetaCopyWithImpl<$Res, $Val extends LeadTimelineMeta>
    implements $LeadTimelineMetaCopyWith<$Res> {
  _$LeadTimelineMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadTimelineMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = freezed,
    Object? duration = freezed,
    Object? recordingDuration = freezed,
    Object? hardwareDuration = freezed,
    Object? recordingUrl = freezed,
    Object? priority = freezed,
    Object? location = freezed,
    Object? fileUrl = freezed,
    Object? fileType = freezed,
    Object? fileSize = freezed,
    Object? callType = freezed,
  }) {
    return _then(
      _value.copyWith(
            direction: freezed == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as double?,
            recordingDuration: freezed == recordingDuration
                ? _value.recordingDuration
                : recordingDuration // ignore: cast_nullable_to_non_nullable
                      as double?,
            hardwareDuration: freezed == hardwareDuration
                ? _value.hardwareDuration
                : hardwareDuration // ignore: cast_nullable_to_non_nullable
                      as double?,
            recordingUrl: freezed == recordingUrl
                ? _value.recordingUrl
                : recordingUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileType: freezed == fileType
                ? _value.fileType
                : fileType // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileSize: freezed == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as double?,
            callType: freezed == callType
                ? _value.callType
                : callType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadTimelineMetaImplCopyWith<$Res>
    implements $LeadTimelineMetaCopyWith<$Res> {
  factory _$$LeadTimelineMetaImplCopyWith(
    _$LeadTimelineMetaImpl value,
    $Res Function(_$LeadTimelineMetaImpl) then,
  ) = __$$LeadTimelineMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? direction,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? recordingUrl,
    String? priority,
    String? location,
    String? fileUrl,
    String? fileType,
    double? fileSize,
    String? callType,
  });
}

/// @nodoc
class __$$LeadTimelineMetaImplCopyWithImpl<$Res>
    extends _$LeadTimelineMetaCopyWithImpl<$Res, _$LeadTimelineMetaImpl>
    implements _$$LeadTimelineMetaImplCopyWith<$Res> {
  __$$LeadTimelineMetaImplCopyWithImpl(
    _$LeadTimelineMetaImpl _value,
    $Res Function(_$LeadTimelineMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadTimelineMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = freezed,
    Object? duration = freezed,
    Object? recordingDuration = freezed,
    Object? hardwareDuration = freezed,
    Object? recordingUrl = freezed,
    Object? priority = freezed,
    Object? location = freezed,
    Object? fileUrl = freezed,
    Object? fileType = freezed,
    Object? fileSize = freezed,
    Object? callType = freezed,
  }) {
    return _then(
      _$LeadTimelineMetaImpl(
        direction: freezed == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as double?,
        recordingDuration: freezed == recordingDuration
            ? _value.recordingDuration
            : recordingDuration // ignore: cast_nullable_to_non_nullable
                  as double?,
        hardwareDuration: freezed == hardwareDuration
            ? _value.hardwareDuration
            : hardwareDuration // ignore: cast_nullable_to_non_nullable
                  as double?,
        recordingUrl: freezed == recordingUrl
            ? _value.recordingUrl
            : recordingUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileType: freezed == fileType
            ? _value.fileType
            : fileType // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileSize: freezed == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as double?,
        callType: freezed == callType
            ? _value.callType
            : callType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadTimelineMetaImpl implements _LeadTimelineMeta {
  const _$LeadTimelineMetaImpl({
    this.direction,
    this.duration,
    this.recordingDuration,
    this.hardwareDuration,
    this.recordingUrl,
    this.priority,
    this.location,
    this.fileUrl,
    this.fileType,
    this.fileSize,
    this.callType,
  });

  factory _$LeadTimelineMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadTimelineMetaImplFromJson(json);

  @override
  final String? direction;
  @override
  final double? duration;
  @override
  final double? recordingDuration;
  @override
  final double? hardwareDuration;
  @override
  final String? recordingUrl;
  @override
  final String? priority;
  @override
  final String? location;
  @override
  final String? fileUrl;
  @override
  final String? fileType;
  @override
  final double? fileSize;
  @override
  final String? callType;

  @override
  String toString() {
    return 'LeadTimelineMeta(direction: $direction, duration: $duration, recordingDuration: $recordingDuration, hardwareDuration: $hardwareDuration, recordingUrl: $recordingUrl, priority: $priority, location: $location, fileUrl: $fileUrl, fileType: $fileType, fileSize: $fileSize, callType: $callType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadTimelineMetaImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.recordingDuration, recordingDuration) ||
                other.recordingDuration == recordingDuration) &&
            (identical(other.hardwareDuration, hardwareDuration) ||
                other.hardwareDuration == hardwareDuration) &&
            (identical(other.recordingUrl, recordingUrl) ||
                other.recordingUrl == recordingUrl) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.callType, callType) ||
                other.callType == callType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    direction,
    duration,
    recordingDuration,
    hardwareDuration,
    recordingUrl,
    priority,
    location,
    fileUrl,
    fileType,
    fileSize,
    callType,
  );

  /// Create a copy of LeadTimelineMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadTimelineMetaImplCopyWith<_$LeadTimelineMetaImpl> get copyWith =>
      __$$LeadTimelineMetaImplCopyWithImpl<_$LeadTimelineMetaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadTimelineMetaImplToJson(this);
  }
}

abstract class _LeadTimelineMeta implements LeadTimelineMeta {
  const factory _LeadTimelineMeta({
    final String? direction,
    final double? duration,
    final double? recordingDuration,
    final double? hardwareDuration,
    final String? recordingUrl,
    final String? priority,
    final String? location,
    final String? fileUrl,
    final String? fileType,
    final double? fileSize,
    final String? callType,
  }) = _$LeadTimelineMetaImpl;

  factory _LeadTimelineMeta.fromJson(Map<String, dynamic> json) =
      _$LeadTimelineMetaImpl.fromJson;

  @override
  String? get direction;
  @override
  double? get duration;
  @override
  double? get recordingDuration;
  @override
  double? get hardwareDuration;
  @override
  String? get recordingUrl;
  @override
  String? get priority;
  @override
  String? get location;
  @override
  String? get fileUrl;
  @override
  String? get fileType;
  @override
  double? get fileSize;
  @override
  String? get callType;

  /// Create a copy of LeadTimelineMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadTimelineMetaImplCopyWith<_$LeadTimelineMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
