// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_performance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PerformanceEntry _$PerformanceEntryFromJson(Map<String, dynamic> json) {
  return _PerformanceEntry.fromJson(json);
}

/// @nodoc
mixin _$PerformanceEntry {
  PerformanceUserRef get user => throw _privateConstructorUsedError;
  PerformanceMetrics get metrics => throw _privateConstructorUsedError;

  /// Serializes this PerformanceEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceEntryCopyWith<PerformanceEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceEntryCopyWith<$Res> {
  factory $PerformanceEntryCopyWith(
    PerformanceEntry value,
    $Res Function(PerformanceEntry) then,
  ) = _$PerformanceEntryCopyWithImpl<$Res, PerformanceEntry>;
  @useResult
  $Res call({PerformanceUserRef user, PerformanceMetrics metrics});

  $PerformanceUserRefCopyWith<$Res> get user;
  $PerformanceMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$PerformanceEntryCopyWithImpl<$Res, $Val extends PerformanceEntry>
    implements $PerformanceEntryCopyWith<$Res> {
  _$PerformanceEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? metrics = null}) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as PerformanceUserRef,
            metrics: null == metrics
                ? _value.metrics
                : metrics // ignore: cast_nullable_to_non_nullable
                      as PerformanceMetrics,
          )
          as $Val,
    );
  }

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerformanceUserRefCopyWith<$Res> get user {
    return $PerformanceUserRefCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerformanceMetricsCopyWith<$Res> get metrics {
    return $PerformanceMetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PerformanceEntryImplCopyWith<$Res>
    implements $PerformanceEntryCopyWith<$Res> {
  factory _$$PerformanceEntryImplCopyWith(
    _$PerformanceEntryImpl value,
    $Res Function(_$PerformanceEntryImpl) then,
  ) = __$$PerformanceEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PerformanceUserRef user, PerformanceMetrics metrics});

  @override
  $PerformanceUserRefCopyWith<$Res> get user;
  @override
  $PerformanceMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$PerformanceEntryImplCopyWithImpl<$Res>
    extends _$PerformanceEntryCopyWithImpl<$Res, _$PerformanceEntryImpl>
    implements _$$PerformanceEntryImplCopyWith<$Res> {
  __$$PerformanceEntryImplCopyWithImpl(
    _$PerformanceEntryImpl _value,
    $Res Function(_$PerformanceEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? metrics = null}) {
    return _then(
      _$PerformanceEntryImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as PerformanceUserRef,
        metrics: null == metrics
            ? _value.metrics
            : metrics // ignore: cast_nullable_to_non_nullable
                  as PerformanceMetrics,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceEntryImpl implements _PerformanceEntry {
  const _$PerformanceEntryImpl({required this.user, required this.metrics});

  factory _$PerformanceEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceEntryImplFromJson(json);

  @override
  final PerformanceUserRef user;
  @override
  final PerformanceMetrics metrics;

  @override
  String toString() {
    return 'PerformanceEntry(user: $user, metrics: $metrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceEntryImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.metrics, metrics) || other.metrics == metrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, metrics);

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceEntryImplCopyWith<_$PerformanceEntryImpl> get copyWith =>
      __$$PerformanceEntryImplCopyWithImpl<_$PerformanceEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceEntryImplToJson(this);
  }
}

abstract class _PerformanceEntry implements PerformanceEntry {
  const factory _PerformanceEntry({
    required final PerformanceUserRef user,
    required final PerformanceMetrics metrics,
  }) = _$PerformanceEntryImpl;

  factory _PerformanceEntry.fromJson(Map<String, dynamic> json) =
      _$PerformanceEntryImpl.fromJson;

  @override
  PerformanceUserRef get user;
  @override
  PerformanceMetrics get metrics;

  /// Create a copy of PerformanceEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceEntryImplCopyWith<_$PerformanceEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceUserRef _$PerformanceUserRefFromJson(Map<String, dynamic> json) {
  return _PerformanceUserRef.fromJson(json);
}

/// @nodoc
mixin _$PerformanceUserRef {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get branch => throw _privateConstructorUsedError;

  /// Serializes this PerformanceUserRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceUserRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceUserRefCopyWith<PerformanceUserRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceUserRefCopyWith<$Res> {
  factory $PerformanceUserRefCopyWith(
    PerformanceUserRef value,
    $Res Function(PerformanceUserRef) then,
  ) = _$PerformanceUserRefCopyWithImpl<$Res, PerformanceUserRef>;
  @useResult
  $Res call({String id, String name, String? role, String? branch});
}

/// @nodoc
class _$PerformanceUserRefCopyWithImpl<$Res, $Val extends PerformanceUserRef>
    implements $PerformanceUserRefCopyWith<$Res> {
  _$PerformanceUserRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceUserRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = freezed,
    Object? branch = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            branch: freezed == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PerformanceUserRefImplCopyWith<$Res>
    implements $PerformanceUserRefCopyWith<$Res> {
  factory _$$PerformanceUserRefImplCopyWith(
    _$PerformanceUserRefImpl value,
    $Res Function(_$PerformanceUserRefImpl) then,
  ) = __$$PerformanceUserRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? role, String? branch});
}

/// @nodoc
class __$$PerformanceUserRefImplCopyWithImpl<$Res>
    extends _$PerformanceUserRefCopyWithImpl<$Res, _$PerformanceUserRefImpl>
    implements _$$PerformanceUserRefImplCopyWith<$Res> {
  __$$PerformanceUserRefImplCopyWithImpl(
    _$PerformanceUserRefImpl _value,
    $Res Function(_$PerformanceUserRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceUserRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = freezed,
    Object? branch = freezed,
  }) {
    return _then(
      _$PerformanceUserRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        branch: freezed == branch
            ? _value.branch
            : branch // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceUserRefImpl implements _PerformanceUserRef {
  const _$PerformanceUserRefImpl({
    required this.id,
    required this.name,
    this.role,
    this.branch,
  });

  factory _$PerformanceUserRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceUserRefImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? role;
  @override
  final String? branch;

  @override
  String toString() {
    return 'PerformanceUserRef(id: $id, name: $name, role: $role, branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceUserRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, branch);

  /// Create a copy of PerformanceUserRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceUserRefImplCopyWith<_$PerformanceUserRefImpl> get copyWith =>
      __$$PerformanceUserRefImplCopyWithImpl<_$PerformanceUserRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceUserRefImplToJson(this);
  }
}

abstract class _PerformanceUserRef implements PerformanceUserRef {
  const factory _PerformanceUserRef({
    required final String id,
    required final String name,
    final String? role,
    final String? branch,
  }) = _$PerformanceUserRefImpl;

  factory _PerformanceUserRef.fromJson(Map<String, dynamic> json) =
      _$PerformanceUserRefImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get role;
  @override
  String? get branch;

  /// Create a copy of PerformanceUserRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceUserRefImplCopyWith<_$PerformanceUserRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceMetrics _$PerformanceMetricsFromJson(Map<String, dynamic> json) {
  return _PerformanceMetrics.fromJson(json);
}

/// @nodoc
mixin _$PerformanceMetrics {
  int get leadsAssigned => throw _privateConstructorUsedError;
  int get leadsConverted => throw _privateConstructorUsedError;
  double get conversionRate => throw _privateConstructorUsedError;
  int get callsMade => throw _privateConstructorUsedError;
  int get meetingsHeld => throw _privateConstructorUsedError;

  /// Serializes this PerformanceMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceMetricsCopyWith<PerformanceMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceMetricsCopyWith<$Res> {
  factory $PerformanceMetricsCopyWith(
    PerformanceMetrics value,
    $Res Function(PerformanceMetrics) then,
  ) = _$PerformanceMetricsCopyWithImpl<$Res, PerformanceMetrics>;
  @useResult
  $Res call({
    int leadsAssigned,
    int leadsConverted,
    double conversionRate,
    int callsMade,
    int meetingsHeld,
  });
}

/// @nodoc
class _$PerformanceMetricsCopyWithImpl<$Res, $Val extends PerformanceMetrics>
    implements $PerformanceMetricsCopyWith<$Res> {
  _$PerformanceMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadsAssigned = null,
    Object? leadsConverted = null,
    Object? conversionRate = null,
    Object? callsMade = null,
    Object? meetingsHeld = null,
  }) {
    return _then(
      _value.copyWith(
            leadsAssigned: null == leadsAssigned
                ? _value.leadsAssigned
                : leadsAssigned // ignore: cast_nullable_to_non_nullable
                      as int,
            leadsConverted: null == leadsConverted
                ? _value.leadsConverted
                : leadsConverted // ignore: cast_nullable_to_non_nullable
                      as int,
            conversionRate: null == conversionRate
                ? _value.conversionRate
                : conversionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            callsMade: null == callsMade
                ? _value.callsMade
                : callsMade // ignore: cast_nullable_to_non_nullable
                      as int,
            meetingsHeld: null == meetingsHeld
                ? _value.meetingsHeld
                : meetingsHeld // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PerformanceMetricsImplCopyWith<$Res>
    implements $PerformanceMetricsCopyWith<$Res> {
  factory _$$PerformanceMetricsImplCopyWith(
    _$PerformanceMetricsImpl value,
    $Res Function(_$PerformanceMetricsImpl) then,
  ) = __$$PerformanceMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int leadsAssigned,
    int leadsConverted,
    double conversionRate,
    int callsMade,
    int meetingsHeld,
  });
}

/// @nodoc
class __$$PerformanceMetricsImplCopyWithImpl<$Res>
    extends _$PerformanceMetricsCopyWithImpl<$Res, _$PerformanceMetricsImpl>
    implements _$$PerformanceMetricsImplCopyWith<$Res> {
  __$$PerformanceMetricsImplCopyWithImpl(
    _$PerformanceMetricsImpl _value,
    $Res Function(_$PerformanceMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leadsAssigned = null,
    Object? leadsConverted = null,
    Object? conversionRate = null,
    Object? callsMade = null,
    Object? meetingsHeld = null,
  }) {
    return _then(
      _$PerformanceMetricsImpl(
        leadsAssigned: null == leadsAssigned
            ? _value.leadsAssigned
            : leadsAssigned // ignore: cast_nullable_to_non_nullable
                  as int,
        leadsConverted: null == leadsConverted
            ? _value.leadsConverted
            : leadsConverted // ignore: cast_nullable_to_non_nullable
                  as int,
        conversionRate: null == conversionRate
            ? _value.conversionRate
            : conversionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        callsMade: null == callsMade
            ? _value.callsMade
            : callsMade // ignore: cast_nullable_to_non_nullable
                  as int,
        meetingsHeld: null == meetingsHeld
            ? _value.meetingsHeld
            : meetingsHeld // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceMetricsImpl implements _PerformanceMetrics {
  const _$PerformanceMetricsImpl({
    this.leadsAssigned = 0,
    this.leadsConverted = 0,
    this.conversionRate = 0,
    this.callsMade = 0,
    this.meetingsHeld = 0,
  });

  factory _$PerformanceMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceMetricsImplFromJson(json);

  @override
  @JsonKey()
  final int leadsAssigned;
  @override
  @JsonKey()
  final int leadsConverted;
  @override
  @JsonKey()
  final double conversionRate;
  @override
  @JsonKey()
  final int callsMade;
  @override
  @JsonKey()
  final int meetingsHeld;

  @override
  String toString() {
    return 'PerformanceMetrics(leadsAssigned: $leadsAssigned, leadsConverted: $leadsConverted, conversionRate: $conversionRate, callsMade: $callsMade, meetingsHeld: $meetingsHeld)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceMetricsImpl &&
            (identical(other.leadsAssigned, leadsAssigned) ||
                other.leadsAssigned == leadsAssigned) &&
            (identical(other.leadsConverted, leadsConverted) ||
                other.leadsConverted == leadsConverted) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            (identical(other.callsMade, callsMade) ||
                other.callsMade == callsMade) &&
            (identical(other.meetingsHeld, meetingsHeld) ||
                other.meetingsHeld == meetingsHeld));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    leadsAssigned,
    leadsConverted,
    conversionRate,
    callsMade,
    meetingsHeld,
  );

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceMetricsImplCopyWith<_$PerformanceMetricsImpl> get copyWith =>
      __$$PerformanceMetricsImplCopyWithImpl<_$PerformanceMetricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceMetricsImplToJson(this);
  }
}

abstract class _PerformanceMetrics implements PerformanceMetrics {
  const factory _PerformanceMetrics({
    final int leadsAssigned,
    final int leadsConverted,
    final double conversionRate,
    final int callsMade,
    final int meetingsHeld,
  }) = _$PerformanceMetricsImpl;

  factory _PerformanceMetrics.fromJson(Map<String, dynamic> json) =
      _$PerformanceMetricsImpl.fromJson;

  @override
  int get leadsAssigned;
  @override
  int get leadsConverted;
  @override
  double get conversionRate;
  @override
  int get callsMade;
  @override
  int get meetingsHeld;

  /// Create a copy of PerformanceMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceMetricsImplCopyWith<_$PerformanceMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
