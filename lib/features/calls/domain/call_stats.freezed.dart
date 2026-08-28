// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallStats _$CallStatsFromJson(Map<String, dynamic> json) {
  return _CallStats.fromJson(json);
}

/// @nodoc
mixin _$CallStats {
  int get totalCalls => throw _privateConstructorUsedError;
  int get outboundCalls => throw _privateConstructorUsedError;
  int get inboundCalls => throw _privateConstructorUsedError;
  int get missedCalls => throw _privateConstructorUsedError;
  int get completedCalls => throw _privateConstructorUsedError;

  /// Minutes, one decimal place — matches the backend's own rounding.
  double get avgDuration => throw _privateConstructorUsedError;
  int get callsWithRecording => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  /// Serializes this CallStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallStatsCopyWith<CallStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallStatsCopyWith<$Res> {
  factory $CallStatsCopyWith(CallStats value, $Res Function(CallStats) then) =
      _$CallStatsCopyWithImpl<$Res, CallStats>;
  @useResult
  $Res call({
    int totalCalls,
    int outboundCalls,
    int inboundCalls,
    int missedCalls,
    int completedCalls,
    double avgDuration,
    int callsWithRecording,
    String period,
  });
}

/// @nodoc
class _$CallStatsCopyWithImpl<$Res, $Val extends CallStats>
    implements $CallStatsCopyWith<$Res> {
  _$CallStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCalls = null,
    Object? outboundCalls = null,
    Object? inboundCalls = null,
    Object? missedCalls = null,
    Object? completedCalls = null,
    Object? avgDuration = null,
    Object? callsWithRecording = null,
    Object? period = null,
  }) {
    return _then(
      _value.copyWith(
            totalCalls: null == totalCalls
                ? _value.totalCalls
                : totalCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            outboundCalls: null == outboundCalls
                ? _value.outboundCalls
                : outboundCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            inboundCalls: null == inboundCalls
                ? _value.inboundCalls
                : inboundCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            missedCalls: null == missedCalls
                ? _value.missedCalls
                : missedCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            completedCalls: null == completedCalls
                ? _value.completedCalls
                : completedCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            avgDuration: null == avgDuration
                ? _value.avgDuration
                : avgDuration // ignore: cast_nullable_to_non_nullable
                      as double,
            callsWithRecording: null == callsWithRecording
                ? _value.callsWithRecording
                : callsWithRecording // ignore: cast_nullable_to_non_nullable
                      as int,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallStatsImplCopyWith<$Res>
    implements $CallStatsCopyWith<$Res> {
  factory _$$CallStatsImplCopyWith(
    _$CallStatsImpl value,
    $Res Function(_$CallStatsImpl) then,
  ) = __$$CallStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalCalls,
    int outboundCalls,
    int inboundCalls,
    int missedCalls,
    int completedCalls,
    double avgDuration,
    int callsWithRecording,
    String period,
  });
}

/// @nodoc
class __$$CallStatsImplCopyWithImpl<$Res>
    extends _$CallStatsCopyWithImpl<$Res, _$CallStatsImpl>
    implements _$$CallStatsImplCopyWith<$Res> {
  __$$CallStatsImplCopyWithImpl(
    _$CallStatsImpl _value,
    $Res Function(_$CallStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCalls = null,
    Object? outboundCalls = null,
    Object? inboundCalls = null,
    Object? missedCalls = null,
    Object? completedCalls = null,
    Object? avgDuration = null,
    Object? callsWithRecording = null,
    Object? period = null,
  }) {
    return _then(
      _$CallStatsImpl(
        totalCalls: null == totalCalls
            ? _value.totalCalls
            : totalCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        outboundCalls: null == outboundCalls
            ? _value.outboundCalls
            : outboundCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        inboundCalls: null == inboundCalls
            ? _value.inboundCalls
            : inboundCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        missedCalls: null == missedCalls
            ? _value.missedCalls
            : missedCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        completedCalls: null == completedCalls
            ? _value.completedCalls
            : completedCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        avgDuration: null == avgDuration
            ? _value.avgDuration
            : avgDuration // ignore: cast_nullable_to_non_nullable
                  as double,
        callsWithRecording: null == callsWithRecording
            ? _value.callsWithRecording
            : callsWithRecording // ignore: cast_nullable_to_non_nullable
                  as int,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallStatsImpl implements _CallStats {
  const _$CallStatsImpl({
    this.totalCalls = 0,
    this.outboundCalls = 0,
    this.inboundCalls = 0,
    this.missedCalls = 0,
    this.completedCalls = 0,
    this.avgDuration = 0,
    this.callsWithRecording = 0,
    this.period = 'week',
  });

  factory _$CallStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalCalls;
  @override
  @JsonKey()
  final int outboundCalls;
  @override
  @JsonKey()
  final int inboundCalls;
  @override
  @JsonKey()
  final int missedCalls;
  @override
  @JsonKey()
  final int completedCalls;

  /// Minutes, one decimal place — matches the backend's own rounding.
  @override
  @JsonKey()
  final double avgDuration;
  @override
  @JsonKey()
  final int callsWithRecording;
  @override
  @JsonKey()
  final String period;

  @override
  String toString() {
    return 'CallStats(totalCalls: $totalCalls, outboundCalls: $outboundCalls, inboundCalls: $inboundCalls, missedCalls: $missedCalls, completedCalls: $completedCalls, avgDuration: $avgDuration, callsWithRecording: $callsWithRecording, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallStatsImpl &&
            (identical(other.totalCalls, totalCalls) ||
                other.totalCalls == totalCalls) &&
            (identical(other.outboundCalls, outboundCalls) ||
                other.outboundCalls == outboundCalls) &&
            (identical(other.inboundCalls, inboundCalls) ||
                other.inboundCalls == inboundCalls) &&
            (identical(other.missedCalls, missedCalls) ||
                other.missedCalls == missedCalls) &&
            (identical(other.completedCalls, completedCalls) ||
                other.completedCalls == completedCalls) &&
            (identical(other.avgDuration, avgDuration) ||
                other.avgDuration == avgDuration) &&
            (identical(other.callsWithRecording, callsWithRecording) ||
                other.callsWithRecording == callsWithRecording) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalCalls,
    outboundCalls,
    inboundCalls,
    missedCalls,
    completedCalls,
    avgDuration,
    callsWithRecording,
    period,
  );

  /// Create a copy of CallStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallStatsImplCopyWith<_$CallStatsImpl> get copyWith =>
      __$$CallStatsImplCopyWithImpl<_$CallStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallStatsImplToJson(this);
  }
}

abstract class _CallStats implements CallStats {
  const factory _CallStats({
    final int totalCalls,
    final int outboundCalls,
    final int inboundCalls,
    final int missedCalls,
    final int completedCalls,
    final double avgDuration,
    final int callsWithRecording,
    final String period,
  }) = _$CallStatsImpl;

  factory _CallStats.fromJson(Map<String, dynamic> json) =
      _$CallStatsImpl.fromJson;

  @override
  int get totalCalls;
  @override
  int get outboundCalls;
  @override
  int get inboundCalls;
  @override
  int get missedCalls;
  @override
  int get completedCalls;

  /// Minutes, one decimal place — matches the backend's own rounding.
  @override
  double get avgDuration;
  @override
  int get callsWithRecording;
  @override
  String get period;

  /// Create a copy of CallStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallStatsImplCopyWith<_$CallStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
