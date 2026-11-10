// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_re_enquiry_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadReEnquiryEvent _$LeadReEnquiryEventFromJson(Map<String, dynamic> json) {
  return _LeadReEnquiryEvent.fromJson(json);
}

/// @nodoc
mixin _$LeadReEnquiryEvent {
  int? get eventIndex => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get enquiryAbout => throw _privateConstructorUsedError;
  bool get hasFullSnapshot => throw _privateConstructorUsedError;
  String? get alreadySplitLeadId => throw _privateConstructorUsedError;
  ReEnquiryFollowUpRef? get followUp => throw _privateConstructorUsedError;

  /// Serializes this LeadReEnquiryEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadReEnquiryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadReEnquiryEventCopyWith<LeadReEnquiryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadReEnquiryEventCopyWith<$Res> {
  factory $LeadReEnquiryEventCopyWith(
    LeadReEnquiryEvent value,
    $Res Function(LeadReEnquiryEvent) then,
  ) = _$LeadReEnquiryEventCopyWithImpl<$Res, LeadReEnquiryEvent>;
  @useResult
  $Res call({
    int? eventIndex,
    DateTime date,
    String type,
    String? name,
    String? phone,
    String? email,
    String? source,
    String? enquiryAbout,
    bool hasFullSnapshot,
    String? alreadySplitLeadId,
    ReEnquiryFollowUpRef? followUp,
  });

  $ReEnquiryFollowUpRefCopyWith<$Res>? get followUp;
}

/// @nodoc
class _$LeadReEnquiryEventCopyWithImpl<$Res, $Val extends LeadReEnquiryEvent>
    implements $LeadReEnquiryEventCopyWith<$Res> {
  _$LeadReEnquiryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadReEnquiryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventIndex = freezed,
    Object? date = null,
    Object? type = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? source = freezed,
    Object? enquiryAbout = freezed,
    Object? hasFullSnapshot = null,
    Object? alreadySplitLeadId = freezed,
    Object? followUp = freezed,
  }) {
    return _then(
      _value.copyWith(
            eventIndex: freezed == eventIndex
                ? _value.eventIndex
                : eventIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            enquiryAbout: freezed == enquiryAbout
                ? _value.enquiryAbout
                : enquiryAbout // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasFullSnapshot: null == hasFullSnapshot
                ? _value.hasFullSnapshot
                : hasFullSnapshot // ignore: cast_nullable_to_non_nullable
                      as bool,
            alreadySplitLeadId: freezed == alreadySplitLeadId
                ? _value.alreadySplitLeadId
                : alreadySplitLeadId // ignore: cast_nullable_to_non_nullable
                      as String?,
            followUp: freezed == followUp
                ? _value.followUp
                : followUp // ignore: cast_nullable_to_non_nullable
                      as ReEnquiryFollowUpRef?,
          )
          as $Val,
    );
  }

  /// Create a copy of LeadReEnquiryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReEnquiryFollowUpRefCopyWith<$Res>? get followUp {
    if (_value.followUp == null) {
      return null;
    }

    return $ReEnquiryFollowUpRefCopyWith<$Res>(_value.followUp!, (value) {
      return _then(_value.copyWith(followUp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadReEnquiryEventImplCopyWith<$Res>
    implements $LeadReEnquiryEventCopyWith<$Res> {
  factory _$$LeadReEnquiryEventImplCopyWith(
    _$LeadReEnquiryEventImpl value,
    $Res Function(_$LeadReEnquiryEventImpl) then,
  ) = __$$LeadReEnquiryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? eventIndex,
    DateTime date,
    String type,
    String? name,
    String? phone,
    String? email,
    String? source,
    String? enquiryAbout,
    bool hasFullSnapshot,
    String? alreadySplitLeadId,
    ReEnquiryFollowUpRef? followUp,
  });

  @override
  $ReEnquiryFollowUpRefCopyWith<$Res>? get followUp;
}

/// @nodoc
class __$$LeadReEnquiryEventImplCopyWithImpl<$Res>
    extends _$LeadReEnquiryEventCopyWithImpl<$Res, _$LeadReEnquiryEventImpl>
    implements _$$LeadReEnquiryEventImplCopyWith<$Res> {
  __$$LeadReEnquiryEventImplCopyWithImpl(
    _$LeadReEnquiryEventImpl _value,
    $Res Function(_$LeadReEnquiryEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadReEnquiryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventIndex = freezed,
    Object? date = null,
    Object? type = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? source = freezed,
    Object? enquiryAbout = freezed,
    Object? hasFullSnapshot = null,
    Object? alreadySplitLeadId = freezed,
    Object? followUp = freezed,
  }) {
    return _then(
      _$LeadReEnquiryEventImpl(
        eventIndex: freezed == eventIndex
            ? _value.eventIndex
            : eventIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        enquiryAbout: freezed == enquiryAbout
            ? _value.enquiryAbout
            : enquiryAbout // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasFullSnapshot: null == hasFullSnapshot
            ? _value.hasFullSnapshot
            : hasFullSnapshot // ignore: cast_nullable_to_non_nullable
                  as bool,
        alreadySplitLeadId: freezed == alreadySplitLeadId
            ? _value.alreadySplitLeadId
            : alreadySplitLeadId // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUp: freezed == followUp
            ? _value.followUp
            : followUp // ignore: cast_nullable_to_non_nullable
                  as ReEnquiryFollowUpRef?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadReEnquiryEventImpl implements _LeadReEnquiryEvent {
  const _$LeadReEnquiryEventImpl({
    this.eventIndex,
    required this.date,
    this.type = 're_enquiry',
    this.name,
    this.phone,
    this.email,
    this.source,
    this.enquiryAbout,
    this.hasFullSnapshot = false,
    this.alreadySplitLeadId,
    this.followUp,
  });

  factory _$LeadReEnquiryEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadReEnquiryEventImplFromJson(json);

  @override
  final int? eventIndex;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final String type;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? source;
  @override
  final String? enquiryAbout;
  @override
  @JsonKey()
  final bool hasFullSnapshot;
  @override
  final String? alreadySplitLeadId;
  @override
  final ReEnquiryFollowUpRef? followUp;

  @override
  String toString() {
    return 'LeadReEnquiryEvent(eventIndex: $eventIndex, date: $date, type: $type, name: $name, phone: $phone, email: $email, source: $source, enquiryAbout: $enquiryAbout, hasFullSnapshot: $hasFullSnapshot, alreadySplitLeadId: $alreadySplitLeadId, followUp: $followUp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadReEnquiryEventImpl &&
            (identical(other.eventIndex, eventIndex) ||
                other.eventIndex == eventIndex) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.enquiryAbout, enquiryAbout) ||
                other.enquiryAbout == enquiryAbout) &&
            (identical(other.hasFullSnapshot, hasFullSnapshot) ||
                other.hasFullSnapshot == hasFullSnapshot) &&
            (identical(other.alreadySplitLeadId, alreadySplitLeadId) ||
                other.alreadySplitLeadId == alreadySplitLeadId) &&
            (identical(other.followUp, followUp) ||
                other.followUp == followUp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eventIndex,
    date,
    type,
    name,
    phone,
    email,
    source,
    enquiryAbout,
    hasFullSnapshot,
    alreadySplitLeadId,
    followUp,
  );

  /// Create a copy of LeadReEnquiryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadReEnquiryEventImplCopyWith<_$LeadReEnquiryEventImpl> get copyWith =>
      __$$LeadReEnquiryEventImplCopyWithImpl<_$LeadReEnquiryEventImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadReEnquiryEventImplToJson(this);
  }
}

abstract class _LeadReEnquiryEvent implements LeadReEnquiryEvent {
  const factory _LeadReEnquiryEvent({
    final int? eventIndex,
    required final DateTime date,
    final String type,
    final String? name,
    final String? phone,
    final String? email,
    final String? source,
    final String? enquiryAbout,
    final bool hasFullSnapshot,
    final String? alreadySplitLeadId,
    final ReEnquiryFollowUpRef? followUp,
  }) = _$LeadReEnquiryEventImpl;

  factory _LeadReEnquiryEvent.fromJson(Map<String, dynamic> json) =
      _$LeadReEnquiryEventImpl.fromJson;

  @override
  int? get eventIndex;
  @override
  DateTime get date;
  @override
  String get type;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get source;
  @override
  String? get enquiryAbout;
  @override
  bool get hasFullSnapshot;
  @override
  String? get alreadySplitLeadId;
  @override
  ReEnquiryFollowUpRef? get followUp;

  /// Create a copy of LeadReEnquiryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadReEnquiryEventImplCopyWith<_$LeadReEnquiryEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReEnquiryFollowUpRef _$ReEnquiryFollowUpRefFromJson(Map<String, dynamic> json) {
  return _ReEnquiryFollowUpRef.fromJson(json);
}

/// @nodoc
mixin _$ReEnquiryFollowUpRef {
  String get id => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  LeadAssignee? get assignedTo => throw _privateConstructorUsedError;

  /// Serializes this ReEnquiryFollowUpRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReEnquiryFollowUpRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReEnquiryFollowUpRefCopyWith<ReEnquiryFollowUpRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReEnquiryFollowUpRefCopyWith<$Res> {
  factory $ReEnquiryFollowUpRefCopyWith(
    ReEnquiryFollowUpRef value,
    $Res Function(ReEnquiryFollowUpRef) then,
  ) = _$ReEnquiryFollowUpRefCopyWithImpl<$Res, ReEnquiryFollowUpRef>;
  @useResult
  $Res call({
    String id,
    String? subject,
    String? description,
    String? status,
    String? priority,
    LeadAssignee? assignedTo,
  });

  $LeadAssigneeCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$ReEnquiryFollowUpRefCopyWithImpl<$Res, $Val extends ReEnquiryFollowUpRef>
    implements $ReEnquiryFollowUpRefCopyWith<$Res> {
  _$ReEnquiryFollowUpRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? assignedTo = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as LeadAssignee?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $LeadAssigneeCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $LeadAssigneeCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReEnquiryFollowUpRefImplCopyWith<$Res>
    implements $ReEnquiryFollowUpRefCopyWith<$Res> {
  factory _$$ReEnquiryFollowUpRefImplCopyWith(
    _$ReEnquiryFollowUpRefImpl value,
    $Res Function(_$ReEnquiryFollowUpRefImpl) then,
  ) = __$$ReEnquiryFollowUpRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? subject,
    String? description,
    String? status,
    String? priority,
    LeadAssignee? assignedTo,
  });

  @override
  $LeadAssigneeCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$ReEnquiryFollowUpRefImplCopyWithImpl<$Res>
    extends _$ReEnquiryFollowUpRefCopyWithImpl<$Res, _$ReEnquiryFollowUpRefImpl>
    implements _$$ReEnquiryFollowUpRefImplCopyWith<$Res> {
  __$$ReEnquiryFollowUpRefImplCopyWithImpl(
    _$ReEnquiryFollowUpRefImpl _value,
    $Res Function(_$ReEnquiryFollowUpRefImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? assignedTo = freezed,
  }) {
    return _then(
      _$ReEnquiryFollowUpRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as LeadAssignee?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReEnquiryFollowUpRefImpl implements _ReEnquiryFollowUpRef {
  const _$ReEnquiryFollowUpRefImpl({
    required this.id,
    this.subject,
    this.description,
    this.status,
    this.priority,
    this.assignedTo,
  });

  factory _$ReEnquiryFollowUpRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReEnquiryFollowUpRefImplFromJson(json);

  @override
  final String id;
  @override
  final String? subject;
  @override
  final String? description;
  @override
  final String? status;
  @override
  final String? priority;
  @override
  final LeadAssignee? assignedTo;

  @override
  String toString() {
    return 'ReEnquiryFollowUpRef(id: $id, subject: $subject, description: $description, status: $status, priority: $priority, assignedTo: $assignedTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReEnquiryFollowUpRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    subject,
    description,
    status,
    priority,
    assignedTo,
  );

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReEnquiryFollowUpRefImplCopyWith<_$ReEnquiryFollowUpRefImpl>
  get copyWith =>
      __$$ReEnquiryFollowUpRefImplCopyWithImpl<_$ReEnquiryFollowUpRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReEnquiryFollowUpRefImplToJson(this);
  }
}

abstract class _ReEnquiryFollowUpRef implements ReEnquiryFollowUpRef {
  const factory _ReEnquiryFollowUpRef({
    required final String id,
    final String? subject,
    final String? description,
    final String? status,
    final String? priority,
    final LeadAssignee? assignedTo,
  }) = _$ReEnquiryFollowUpRefImpl;

  factory _ReEnquiryFollowUpRef.fromJson(Map<String, dynamic> json) =
      _$ReEnquiryFollowUpRefImpl.fromJson;

  @override
  String get id;
  @override
  String? get subject;
  @override
  String? get description;
  @override
  String? get status;
  @override
  String? get priority;
  @override
  LeadAssignee? get assignedTo;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReEnquiryFollowUpRefImplCopyWith<_$ReEnquiryFollowUpRefImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadReEnquiryHistory _$LeadReEnquiryHistoryFromJson(Map<String, dynamic> json) {
  return _LeadReEnquiryHistory.fromJson(json);
}

/// @nodoc
mixin _$LeadReEnquiryHistory {
  String get leadId => throw _privateConstructorUsedError;
  String get currentName => throw _privateConstructorUsedError;
  String get currentPhone => throw _privateConstructorUsedError;
  String? get currentEmail => throw _privateConstructorUsedError;
  int get reEnquiryCount => throw _privateConstructorUsedError;
  List<LeadReEnquiryEvent> get events => throw _privateConstructorUsedError;

  /// Serializes this LeadReEnquiryHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadReEnquiryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadReEnquiryHistoryCopyWith<LeadReEnquiryHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadReEnquiryHistoryCopyWith<$Res> {
  factory $LeadReEnquiryHistoryCopyWith(
    LeadReEnquiryHistory value,
    $Res Function(LeadReEnquiryHistory) then,
  ) = _$LeadReEnquiryHistoryCopyWithImpl<$Res, LeadReEnquiryHistory>;
  @useResult
  $Res call({
    String leadId,
    String currentName,
    String currentPhone,
    String? currentEmail,
    int reEnquiryCount,
    List<LeadReEnquiryEvent> events,
  });
}

/// @nodoc
class _$LeadReEnquiryHistoryCopyWithImpl<
  $Res,
  $Val extends LeadReEnquiryHistory
>
    implements $LeadReEnquiryHistoryCopyWith<$Res> {
  _$LeadReEnquiryHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadReEnquiryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadId = null,
    Object? currentName = null,
    Object? currentPhone = null,
    Object? currentEmail = freezed,
    Object? reEnquiryCount = null,
    Object? events = null,
  }) {
    return _then(
      _value.copyWith(
            leadId: null == leadId
                ? _value.leadId
                : leadId // ignore: cast_nullable_to_non_nullable
                      as String,
            currentName: null == currentName
                ? _value.currentName
                : currentName // ignore: cast_nullable_to_non_nullable
                      as String,
            currentPhone: null == currentPhone
                ? _value.currentPhone
                : currentPhone // ignore: cast_nullable_to_non_nullable
                      as String,
            currentEmail: freezed == currentEmail
                ? _value.currentEmail
                : currentEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            reEnquiryCount: null == reEnquiryCount
                ? _value.reEnquiryCount
                : reEnquiryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            events: null == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as List<LeadReEnquiryEvent>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadReEnquiryHistoryImplCopyWith<$Res>
    implements $LeadReEnquiryHistoryCopyWith<$Res> {
  factory _$$LeadReEnquiryHistoryImplCopyWith(
    _$LeadReEnquiryHistoryImpl value,
    $Res Function(_$LeadReEnquiryHistoryImpl) then,
  ) = __$$LeadReEnquiryHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String leadId,
    String currentName,
    String currentPhone,
    String? currentEmail,
    int reEnquiryCount,
    List<LeadReEnquiryEvent> events,
  });
}

/// @nodoc
class __$$LeadReEnquiryHistoryImplCopyWithImpl<$Res>
    extends _$LeadReEnquiryHistoryCopyWithImpl<$Res, _$LeadReEnquiryHistoryImpl>
    implements _$$LeadReEnquiryHistoryImplCopyWith<$Res> {
  __$$LeadReEnquiryHistoryImplCopyWithImpl(
    _$LeadReEnquiryHistoryImpl _value,
    $Res Function(_$LeadReEnquiryHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadReEnquiryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadId = null,
    Object? currentName = null,
    Object? currentPhone = null,
    Object? currentEmail = freezed,
    Object? reEnquiryCount = null,
    Object? events = null,
  }) {
    return _then(
      _$LeadReEnquiryHistoryImpl(
        leadId: null == leadId
            ? _value.leadId
            : leadId // ignore: cast_nullable_to_non_nullable
                  as String,
        currentName: null == currentName
            ? _value.currentName
            : currentName // ignore: cast_nullable_to_non_nullable
                  as String,
        currentPhone: null == currentPhone
            ? _value.currentPhone
            : currentPhone // ignore: cast_nullable_to_non_nullable
                  as String,
        currentEmail: freezed == currentEmail
            ? _value.currentEmail
            : currentEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        reEnquiryCount: null == reEnquiryCount
            ? _value.reEnquiryCount
            : reEnquiryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        events: null == events
            ? _value._events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<LeadReEnquiryEvent>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadReEnquiryHistoryImpl implements _LeadReEnquiryHistory {
  const _$LeadReEnquiryHistoryImpl({
    required this.leadId,
    required this.currentName,
    required this.currentPhone,
    this.currentEmail,
    this.reEnquiryCount = 0,
    final List<LeadReEnquiryEvent> events = const [],
  }) : _events = events;

  factory _$LeadReEnquiryHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadReEnquiryHistoryImplFromJson(json);

  @override
  final String leadId;
  @override
  final String currentName;
  @override
  final String currentPhone;
  @override
  final String? currentEmail;
  @override
  @JsonKey()
  final int reEnquiryCount;
  final List<LeadReEnquiryEvent> _events;
  @override
  @JsonKey()
  List<LeadReEnquiryEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'LeadReEnquiryHistory(leadId: $leadId, currentName: $currentName, currentPhone: $currentPhone, currentEmail: $currentEmail, reEnquiryCount: $reEnquiryCount, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadReEnquiryHistoryImpl &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.currentName, currentName) ||
                other.currentName == currentName) &&
            (identical(other.currentPhone, currentPhone) ||
                other.currentPhone == currentPhone) &&
            (identical(other.currentEmail, currentEmail) ||
                other.currentEmail == currentEmail) &&
            (identical(other.reEnquiryCount, reEnquiryCount) ||
                other.reEnquiryCount == reEnquiryCount) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    leadId,
    currentName,
    currentPhone,
    currentEmail,
    reEnquiryCount,
    const DeepCollectionEquality().hash(_events),
  );

  /// Create a copy of LeadReEnquiryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadReEnquiryHistoryImplCopyWith<_$LeadReEnquiryHistoryImpl>
  get copyWith =>
      __$$LeadReEnquiryHistoryImplCopyWithImpl<_$LeadReEnquiryHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadReEnquiryHistoryImplToJson(this);
  }
}

abstract class _LeadReEnquiryHistory implements LeadReEnquiryHistory {
  const factory _LeadReEnquiryHistory({
    required final String leadId,
    required final String currentName,
    required final String currentPhone,
    final String? currentEmail,
    final int reEnquiryCount,
    final List<LeadReEnquiryEvent> events,
  }) = _$LeadReEnquiryHistoryImpl;

  factory _LeadReEnquiryHistory.fromJson(Map<String, dynamic> json) =
      _$LeadReEnquiryHistoryImpl.fromJson;

  @override
  String get leadId;
  @override
  String get currentName;
  @override
  String get currentPhone;
  @override
  String? get currentEmail;
  @override
  int get reEnquiryCount;
  @override
  List<LeadReEnquiryEvent> get events;

  /// Create a copy of LeadReEnquiryHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadReEnquiryHistoryImplCopyWith<_$LeadReEnquiryHistoryImpl>
  get copyWith => throw _privateConstructorUsedError;
}
