// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_whatsapp_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadWhatsAppActivity _$LeadWhatsAppActivityFromJson(Map<String, dynamic> json) {
  return _LeadWhatsAppActivity.fromJson(json);
}

/// @nodoc
mixin _$LeadWhatsAppActivity {
  String get id => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String? get direction => throw _privateConstructorUsedError;
  String? get messageType => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get actor => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  double? get recordingDuration => throw _privateConstructorUsedError;
  double? get hardwareDuration => throw _privateConstructorUsedError;
  String? get callStatus => throw _privateConstructorUsedError;
  String? get recordingUrl => throw _privateConstructorUsedError;

  /// Serializes this LeadWhatsAppActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadWhatsAppActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadWhatsAppActivityCopyWith<LeadWhatsAppActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadWhatsAppActivityCopyWith<$Res> {
  factory $LeadWhatsAppActivityCopyWith(
    LeadWhatsAppActivity value,
    $Res Function(LeadWhatsAppActivity) then,
  ) = _$LeadWhatsAppActivityCopyWithImpl<$Res, LeadWhatsAppActivity>;
  @useResult
  $Res call({
    String id,
    String source,
    String? direction,
    String? messageType,
    String? content,
    String? status,
    String? phoneNumber,
    DateTime date,
    String? actor,
    String? subject,
    String? description,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? callStatus,
    String? recordingUrl,
  });
}

/// @nodoc
class _$LeadWhatsAppActivityCopyWithImpl<
  $Res,
  $Val extends LeadWhatsAppActivity
>
    implements $LeadWhatsAppActivityCopyWith<$Res> {
  _$LeadWhatsAppActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadWhatsAppActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? source = null,
    Object? direction = freezed,
    Object? messageType = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? phoneNumber = freezed,
    Object? date = null,
    Object? actor = freezed,
    Object? subject = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? recordingDuration = freezed,
    Object? hardwareDuration = freezed,
    Object? callStatus = freezed,
    Object? recordingUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            direction: freezed == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageType: freezed == messageType
                ? _value.messageType
                : messageType // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            actor: freezed == actor
                ? _value.actor
                : actor // ignore: cast_nullable_to_non_nullable
                      as String?,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
            callStatus: freezed == callStatus
                ? _value.callStatus
                : callStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordingUrl: freezed == recordingUrl
                ? _value.recordingUrl
                : recordingUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadWhatsAppActivityImplCopyWith<$Res>
    implements $LeadWhatsAppActivityCopyWith<$Res> {
  factory _$$LeadWhatsAppActivityImplCopyWith(
    _$LeadWhatsAppActivityImpl value,
    $Res Function(_$LeadWhatsAppActivityImpl) then,
  ) = __$$LeadWhatsAppActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String source,
    String? direction,
    String? messageType,
    String? content,
    String? status,
    String? phoneNumber,
    DateTime date,
    String? actor,
    String? subject,
    String? description,
    double? duration,
    double? recordingDuration,
    double? hardwareDuration,
    String? callStatus,
    String? recordingUrl,
  });
}

/// @nodoc
class __$$LeadWhatsAppActivityImplCopyWithImpl<$Res>
    extends _$LeadWhatsAppActivityCopyWithImpl<$Res, _$LeadWhatsAppActivityImpl>
    implements _$$LeadWhatsAppActivityImplCopyWith<$Res> {
  __$$LeadWhatsAppActivityImplCopyWithImpl(
    _$LeadWhatsAppActivityImpl _value,
    $Res Function(_$LeadWhatsAppActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadWhatsAppActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? source = null,
    Object? direction = freezed,
    Object? messageType = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? phoneNumber = freezed,
    Object? date = null,
    Object? actor = freezed,
    Object? subject = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? recordingDuration = freezed,
    Object? hardwareDuration = freezed,
    Object? callStatus = freezed,
    Object? recordingUrl = freezed,
  }) {
    return _then(
      _$LeadWhatsAppActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: freezed == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageType: freezed == messageType
            ? _value.messageType
            : messageType // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        actor: freezed == actor
            ? _value.actor
            : actor // ignore: cast_nullable_to_non_nullable
                  as String?,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
        callStatus: freezed == callStatus
            ? _value.callStatus
            : callStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordingUrl: freezed == recordingUrl
            ? _value.recordingUrl
            : recordingUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadWhatsAppActivityImpl implements _LeadWhatsAppActivity {
  const _$LeadWhatsAppActivityImpl({
    required this.id,
    required this.source,
    this.direction,
    this.messageType,
    this.content,
    this.status,
    this.phoneNumber,
    required this.date,
    this.actor,
    this.subject,
    this.description,
    this.duration,
    this.recordingDuration,
    this.hardwareDuration,
    this.callStatus,
    this.recordingUrl,
  });

  factory _$LeadWhatsAppActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadWhatsAppActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String source;
  @override
  final String? direction;
  @override
  final String? messageType;
  @override
  final String? content;
  @override
  final String? status;
  @override
  final String? phoneNumber;
  @override
  final DateTime date;
  @override
  final String? actor;
  @override
  final String? subject;
  @override
  final String? description;
  @override
  final double? duration;
  @override
  final double? recordingDuration;
  @override
  final double? hardwareDuration;
  @override
  final String? callStatus;
  @override
  final String? recordingUrl;

  @override
  String toString() {
    return 'LeadWhatsAppActivity(id: $id, source: $source, direction: $direction, messageType: $messageType, content: $content, status: $status, phoneNumber: $phoneNumber, date: $date, actor: $actor, subject: $subject, description: $description, duration: $duration, recordingDuration: $recordingDuration, hardwareDuration: $hardwareDuration, callStatus: $callStatus, recordingUrl: $recordingUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadWhatsAppActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.recordingDuration, recordingDuration) ||
                other.recordingDuration == recordingDuration) &&
            (identical(other.hardwareDuration, hardwareDuration) ||
                other.hardwareDuration == hardwareDuration) &&
            (identical(other.callStatus, callStatus) ||
                other.callStatus == callStatus) &&
            (identical(other.recordingUrl, recordingUrl) ||
                other.recordingUrl == recordingUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    source,
    direction,
    messageType,
    content,
    status,
    phoneNumber,
    date,
    actor,
    subject,
    description,
    duration,
    recordingDuration,
    hardwareDuration,
    callStatus,
    recordingUrl,
  );

  /// Create a copy of LeadWhatsAppActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadWhatsAppActivityImplCopyWith<_$LeadWhatsAppActivityImpl>
  get copyWith =>
      __$$LeadWhatsAppActivityImplCopyWithImpl<_$LeadWhatsAppActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadWhatsAppActivityImplToJson(this);
  }
}

abstract class _LeadWhatsAppActivity implements LeadWhatsAppActivity {
  const factory _LeadWhatsAppActivity({
    required final String id,
    required final String source,
    final String? direction,
    final String? messageType,
    final String? content,
    final String? status,
    final String? phoneNumber,
    required final DateTime date,
    final String? actor,
    final String? subject,
    final String? description,
    final double? duration,
    final double? recordingDuration,
    final double? hardwareDuration,
    final String? callStatus,
    final String? recordingUrl,
  }) = _$LeadWhatsAppActivityImpl;

  factory _LeadWhatsAppActivity.fromJson(Map<String, dynamic> json) =
      _$LeadWhatsAppActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get source;
  @override
  String? get direction;
  @override
  String? get messageType;
  @override
  String? get content;
  @override
  String? get status;
  @override
  String? get phoneNumber;
  @override
  DateTime get date;
  @override
  String? get actor;
  @override
  String? get subject;
  @override
  String? get description;
  @override
  double? get duration;
  @override
  double? get recordingDuration;
  @override
  double? get hardwareDuration;
  @override
  String? get callStatus;
  @override
  String? get recordingUrl;

  /// Create a copy of LeadWhatsAppActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadWhatsAppActivityImplCopyWith<_$LeadWhatsAppActivityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
