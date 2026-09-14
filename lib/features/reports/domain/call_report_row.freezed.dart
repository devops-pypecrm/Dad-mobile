// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_report_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallReportRow _$CallReportRowFromJson(Map<String, dynamic> json) {
  return _CallReportRow.fromJson(json);
}

/// @nodoc
mixin _$CallReportRow {
  String get userId => throw _privateConstructorUsedError;
  String get agentName => throw _privateConstructorUsedError;
  String? get branch => throw _privateConstructorUsedError;
  int get totalCalls => throw _privateConstructorUsedError;
  int get connectedCalls => throw _privateConstructorUsedError;
  double get totalDurationSeconds => throw _privateConstructorUsedError;

  /// Serializes this CallReportRow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallReportRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallReportRowCopyWith<CallReportRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallReportRowCopyWith<$Res> {
  factory $CallReportRowCopyWith(
    CallReportRow value,
    $Res Function(CallReportRow) then,
  ) = _$CallReportRowCopyWithImpl<$Res, CallReportRow>;
  @useResult
  $Res call({
    String userId,
    String agentName,
    String? branch,
    int totalCalls,
    int connectedCalls,
    double totalDurationSeconds,
  });
}

/// @nodoc
class _$CallReportRowCopyWithImpl<$Res, $Val extends CallReportRow>
    implements $CallReportRowCopyWith<$Res> {
  _$CallReportRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallReportRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? agentName = null,
    Object? branch = freezed,
    Object? totalCalls = null,
    Object? connectedCalls = null,
    Object? totalDurationSeconds = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            agentName: null == agentName
                ? _value.agentName
                : agentName // ignore: cast_nullable_to_non_nullable
                      as String,
            branch: freezed == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalCalls: null == totalCalls
                ? _value.totalCalls
                : totalCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            connectedCalls: null == connectedCalls
                ? _value.connectedCalls
                : connectedCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDurationSeconds: null == totalDurationSeconds
                ? _value.totalDurationSeconds
                : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallReportRowImplCopyWith<$Res>
    implements $CallReportRowCopyWith<$Res> {
  factory _$$CallReportRowImplCopyWith(
    _$CallReportRowImpl value,
    $Res Function(_$CallReportRowImpl) then,
  ) = __$$CallReportRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String agentName,
    String? branch,
    int totalCalls,
    int connectedCalls,
    double totalDurationSeconds,
  });
}

/// @nodoc
class __$$CallReportRowImplCopyWithImpl<$Res>
    extends _$CallReportRowCopyWithImpl<$Res, _$CallReportRowImpl>
    implements _$$CallReportRowImplCopyWith<$Res> {
  __$$CallReportRowImplCopyWithImpl(
    _$CallReportRowImpl _value,
    $Res Function(_$CallReportRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallReportRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? agentName = null,
    Object? branch = freezed,
    Object? totalCalls = null,
    Object? connectedCalls = null,
    Object? totalDurationSeconds = null,
  }) {
    return _then(
      _$CallReportRowImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        agentName: null == agentName
            ? _value.agentName
            : agentName // ignore: cast_nullable_to_non_nullable
                  as String,
        branch: freezed == branch
            ? _value.branch
            : branch // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalCalls: null == totalCalls
            ? _value.totalCalls
            : totalCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        connectedCalls: null == connectedCalls
            ? _value.connectedCalls
            : connectedCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDurationSeconds: null == totalDurationSeconds
            ? _value.totalDurationSeconds
            : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallReportRowImpl extends _CallReportRow {
  const _$CallReportRowImpl({
    required this.userId,
    required this.agentName,
    this.branch,
    this.totalCalls = 0,
    this.connectedCalls = 0,
    this.totalDurationSeconds = 0,
  }) : super._();

  factory _$CallReportRowImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallReportRowImplFromJson(json);

  @override
  final String userId;
  @override
  final String agentName;
  @override
  final String? branch;
  @override
  @JsonKey()
  final int totalCalls;
  @override
  @JsonKey()
  final int connectedCalls;
  @override
  @JsonKey()
  final double totalDurationSeconds;

  @override
  String toString() {
    return 'CallReportRow(userId: $userId, agentName: $agentName, branch: $branch, totalCalls: $totalCalls, connectedCalls: $connectedCalls, totalDurationSeconds: $totalDurationSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallReportRowImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.agentName, agentName) ||
                other.agentName == agentName) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.totalCalls, totalCalls) ||
                other.totalCalls == totalCalls) &&
            (identical(other.connectedCalls, connectedCalls) ||
                other.connectedCalls == connectedCalls) &&
            (identical(other.totalDurationSeconds, totalDurationSeconds) ||
                other.totalDurationSeconds == totalDurationSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    agentName,
    branch,
    totalCalls,
    connectedCalls,
    totalDurationSeconds,
  );

  /// Create a copy of CallReportRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallReportRowImplCopyWith<_$CallReportRowImpl> get copyWith =>
      __$$CallReportRowImplCopyWithImpl<_$CallReportRowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallReportRowImplToJson(this);
  }
}

abstract class _CallReportRow extends CallReportRow {
  const factory _CallReportRow({
    required final String userId,
    required final String agentName,
    final String? branch,
    final int totalCalls,
    final int connectedCalls,
    final double totalDurationSeconds,
  }) = _$CallReportRowImpl;
  const _CallReportRow._() : super._();

  factory _CallReportRow.fromJson(Map<String, dynamic> json) =
      _$CallReportRowImpl.fromJson;

  @override
  String get userId;
  @override
  String get agentName;
  @override
  String? get branch;
  @override
  int get totalCalls;
  @override
  int get connectedCalls;
  @override
  double get totalDurationSeconds;

  /// Create a copy of CallReportRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallReportRowImplCopyWith<_$CallReportRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallReport _$CallReportFromJson(Map<String, dynamic> json) {
  return _CallReport.fromJson(json);
}

/// @nodoc
mixin _$CallReport {
  List<CallReportRow> get reportData => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;

  /// Serializes this CallReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallReportCopyWith<CallReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallReportCopyWith<$Res> {
  factory $CallReportCopyWith(
    CallReport value,
    $Res Function(CallReport) then,
  ) = _$CallReportCopyWithImpl<$Res, CallReport>;
  @useResult
  $Res call({List<CallReportRow> reportData, String period, String direction});
}

/// @nodoc
class _$CallReportCopyWithImpl<$Res, $Val extends CallReport>
    implements $CallReportCopyWith<$Res> {
  _$CallReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportData = null,
    Object? period = null,
    Object? direction = null,
  }) {
    return _then(
      _value.copyWith(
            reportData: null == reportData
                ? _value.reportData
                : reportData // ignore: cast_nullable_to_non_nullable
                      as List<CallReportRow>,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallReportImplCopyWith<$Res>
    implements $CallReportCopyWith<$Res> {
  factory _$$CallReportImplCopyWith(
    _$CallReportImpl value,
    $Res Function(_$CallReportImpl) then,
  ) = __$$CallReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CallReportRow> reportData, String period, String direction});
}

/// @nodoc
class __$$CallReportImplCopyWithImpl<$Res>
    extends _$CallReportCopyWithImpl<$Res, _$CallReportImpl>
    implements _$$CallReportImplCopyWith<$Res> {
  __$$CallReportImplCopyWithImpl(
    _$CallReportImpl _value,
    $Res Function(_$CallReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportData = null,
    Object? period = null,
    Object? direction = null,
  }) {
    return _then(
      _$CallReportImpl(
        reportData: null == reportData
            ? _value._reportData
            : reportData // ignore: cast_nullable_to_non_nullable
                  as List<CallReportRow>,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallReportImpl implements _CallReport {
  const _$CallReportImpl({
    final List<CallReportRow> reportData = const <CallReportRow>[],
    this.period = 'today',
    this.direction = 'all',
  }) : _reportData = reportData;

  factory _$CallReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallReportImplFromJson(json);

  final List<CallReportRow> _reportData;
  @override
  @JsonKey()
  List<CallReportRow> get reportData {
    if (_reportData is EqualUnmodifiableListView) return _reportData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportData);
  }

  @override
  @JsonKey()
  final String period;
  @override
  @JsonKey()
  final String direction;

  @override
  String toString() {
    return 'CallReport(reportData: $reportData, period: $period, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallReportImpl &&
            const DeepCollectionEquality().equals(
              other._reportData,
              _reportData,
            ) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_reportData),
    period,
    direction,
  );

  /// Create a copy of CallReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallReportImplCopyWith<_$CallReportImpl> get copyWith =>
      __$$CallReportImplCopyWithImpl<_$CallReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallReportImplToJson(this);
  }
}

abstract class _CallReport implements CallReport {
  const factory _CallReport({
    final List<CallReportRow> reportData,
    final String period,
    final String direction,
  }) = _$CallReportImpl;

  factory _CallReport.fromJson(Map<String, dynamic> json) =
      _$CallReportImpl.fromJson;

  @override
  List<CallReportRow> get reportData;
  @override
  String get period;
  @override
  String get direction;

  /// Create a copy of CallReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallReportImplCopyWith<_$CallReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
