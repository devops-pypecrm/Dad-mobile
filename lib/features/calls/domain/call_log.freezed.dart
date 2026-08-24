// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallLog _$CallLogFromJson(Map<String, dynamic> json) {
  return _CallLog.fromJson(json);
}

/// @nodoc
mixin _$CallLog {
  String get id => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  int? get recordingDuration => throw _privateConstructorUsedError;
  String? get recordingUrl => throw _privateConstructorUsedError;
  String? get callStatus => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  CallLogAgent? get createdBy => throw _privateConstructorUsedError;
  CallLogLead? get lead => throw _privateConstructorUsedError;
  CallLogContact? get contact => throw _privateConstructorUsedError;

  /// Serializes this CallLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogCopyWith<CallLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogCopyWith<$Res> {
  factory $CallLogCopyWith(CallLog value, $Res Function(CallLog) then) =
      _$CallLogCopyWithImpl<$Res, CallLog>;
  @useResult
  $Res call({
    String id,
    String direction,
    String? subject,
    DateTime date,
    double? duration,
    int? recordingDuration,
    String? recordingUrl,
    String? callStatus,
    String? phoneNumber,
    CallLogAgent? createdBy,
    CallLogLead? lead,
    CallLogContact? contact,
  });

  $CallLogAgentCopyWith<$Res>? get createdBy;
  $CallLogLeadCopyWith<$Res>? get lead;
  $CallLogContactCopyWith<$Res>? get contact;
}

/// @nodoc
class _$CallLogCopyWithImpl<$Res, $Val extends CallLog>
    implements $CallLogCopyWith<$Res> {
  _$CallLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? direction = null,
    Object? subject = freezed,
    Object? date = null,
    Object? duration = freezed,
    Object? recordingDuration = freezed,
    Object? recordingUrl = freezed,
    Object? callStatus = freezed,
    Object? phoneNumber = freezed,
    Object? createdBy = freezed,
    Object? lead = freezed,
    Object? contact = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as double?,
            recordingDuration: freezed == recordingDuration
                ? _value.recordingDuration
                : recordingDuration // ignore: cast_nullable_to_non_nullable
                      as int?,
            recordingUrl: freezed == recordingUrl
                ? _value.recordingUrl
                : recordingUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            callStatus: freezed == callStatus
                ? _value.callStatus
                : callStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as CallLogAgent?,
            lead: freezed == lead
                ? _value.lead
                : lead // ignore: cast_nullable_to_non_nullable
                      as CallLogLead?,
            contact: freezed == contact
                ? _value.contact
                : contact // ignore: cast_nullable_to_non_nullable
                      as CallLogContact?,
          )
          as $Val,
    );
  }

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CallLogAgentCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $CallLogAgentCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CallLogLeadCopyWith<$Res>? get lead {
    if (_value.lead == null) {
      return null;
    }

    return $CallLogLeadCopyWith<$Res>(_value.lead!, (value) {
      return _then(_value.copyWith(lead: value) as $Val);
    });
  }

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CallLogContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $CallLogContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CallLogImplCopyWith<$Res> implements $CallLogCopyWith<$Res> {
  factory _$$CallLogImplCopyWith(
    _$CallLogImpl value,
    $Res Function(_$CallLogImpl) then,
  ) = __$$CallLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String direction,
    String? subject,
    DateTime date,
    double? duration,
    int? recordingDuration,
    String? recordingUrl,
    String? callStatus,
    String? phoneNumber,
    CallLogAgent? createdBy,
    CallLogLead? lead,
    CallLogContact? contact,
  });

  @override
  $CallLogAgentCopyWith<$Res>? get createdBy;
  @override
  $CallLogLeadCopyWith<$Res>? get lead;
  @override
  $CallLogContactCopyWith<$Res>? get contact;
}

/// @nodoc
class __$$CallLogImplCopyWithImpl<$Res>
    extends _$CallLogCopyWithImpl<$Res, _$CallLogImpl>
    implements _$$CallLogImplCopyWith<$Res> {
  __$$CallLogImplCopyWithImpl(
    _$CallLogImpl _value,
    $Res Function(_$CallLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? direction = null,
    Object? subject = freezed,
    Object? date = null,
    Object? duration = freezed,
    Object? recordingDuration = freezed,
    Object? recordingUrl = freezed,
    Object? callStatus = freezed,
    Object? phoneNumber = freezed,
    Object? createdBy = freezed,
    Object? lead = freezed,
    Object? contact = freezed,
  }) {
    return _then(
      _$CallLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as double?,
        recordingDuration: freezed == recordingDuration
            ? _value.recordingDuration
            : recordingDuration // ignore: cast_nullable_to_non_nullable
                  as int?,
        recordingUrl: freezed == recordingUrl
            ? _value.recordingUrl
            : recordingUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        callStatus: freezed == callStatus
            ? _value.callStatus
            : callStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as CallLogAgent?,
        lead: freezed == lead
            ? _value.lead
            : lead // ignore: cast_nullable_to_non_nullable
                  as CallLogLead?,
        contact: freezed == contact
            ? _value.contact
            : contact // ignore: cast_nullable_to_non_nullable
                  as CallLogContact?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogImpl extends _CallLog {
  const _$CallLogImpl({
    required this.id,
    this.direction = 'outbound',
    this.subject,
    required this.date,
    this.duration,
    this.recordingDuration,
    this.recordingUrl,
    this.callStatus,
    this.phoneNumber,
    this.createdBy,
    this.lead,
    this.contact,
  }) : super._();

  factory _$CallLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String direction;
  @override
  final String? subject;
  @override
  final DateTime date;
  @override
  final double? duration;
  @override
  final int? recordingDuration;
  @override
  final String? recordingUrl;
  @override
  final String? callStatus;
  @override
  final String? phoneNumber;
  @override
  final CallLogAgent? createdBy;
  @override
  final CallLogLead? lead;
  @override
  final CallLogContact? contact;

  @override
  String toString() {
    return 'CallLog(id: $id, direction: $direction, subject: $subject, date: $date, duration: $duration, recordingDuration: $recordingDuration, recordingUrl: $recordingUrl, callStatus: $callStatus, phoneNumber: $phoneNumber, createdBy: $createdBy, lead: $lead, contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.recordingDuration, recordingDuration) ||
                other.recordingDuration == recordingDuration) &&
            (identical(other.recordingUrl, recordingUrl) ||
                other.recordingUrl == recordingUrl) &&
            (identical(other.callStatus, callStatus) ||
                other.callStatus == callStatus) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lead, lead) || other.lead == lead) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    direction,
    subject,
    date,
    duration,
    recordingDuration,
    recordingUrl,
    callStatus,
    phoneNumber,
    createdBy,
    lead,
    contact,
  );

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogImplCopyWith<_$CallLogImpl> get copyWith =>
      __$$CallLogImplCopyWithImpl<_$CallLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogImplToJson(this);
  }
}

abstract class _CallLog extends CallLog {
  const factory _CallLog({
    required final String id,
    final String direction,
    final String? subject,
    required final DateTime date,
    final double? duration,
    final int? recordingDuration,
    final String? recordingUrl,
    final String? callStatus,
    final String? phoneNumber,
    final CallLogAgent? createdBy,
    final CallLogLead? lead,
    final CallLogContact? contact,
  }) = _$CallLogImpl;
  const _CallLog._() : super._();

  factory _CallLog.fromJson(Map<String, dynamic> json) = _$CallLogImpl.fromJson;

  @override
  String get id;
  @override
  String get direction;
  @override
  String? get subject;
  @override
  DateTime get date;
  @override
  double? get duration;
  @override
  int? get recordingDuration;
  @override
  String? get recordingUrl;
  @override
  String? get callStatus;
  @override
  String? get phoneNumber;
  @override
  CallLogAgent? get createdBy;
  @override
  CallLogLead? get lead;
  @override
  CallLogContact? get contact;

  /// Create a copy of CallLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogImplCopyWith<_$CallLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
