// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SalesTarget _$SalesTargetFromJson(Map<String, dynamic> json) {
  return _SalesTarget.fromJson(json);
}

/// @nodoc
mixin _$SalesTarget {
  String get id => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  double get achievedValue => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get metric => throw _privateConstructorUsedError;

  /// Serializes this SalesTarget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesTargetCopyWith<SalesTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesTargetCopyWith<$Res> {
  factory $SalesTargetCopyWith(
    SalesTarget value,
    $Res Function(SalesTarget) then,
  ) = _$SalesTargetCopyWithImpl<$Res, SalesTarget>;
  @useResult
  $Res call({
    String id,
    double targetValue,
    double achievedValue,
    String period,
    DateTime startDate,
    DateTime endDate,
    String status,
    String metric,
  });
}

/// @nodoc
class _$SalesTargetCopyWithImpl<$Res, $Val extends SalesTarget>
    implements $SalesTargetCopyWith<$Res> {
  _$SalesTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? metric = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            targetValue: null == targetValue
                ? _value.targetValue
                : targetValue // ignore: cast_nullable_to_non_nullable
                      as double,
            achievedValue: null == achievedValue
                ? _value.achievedValue
                : achievedValue // ignore: cast_nullable_to_non_nullable
                      as double,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SalesTargetImplCopyWith<$Res>
    implements $SalesTargetCopyWith<$Res> {
  factory _$$SalesTargetImplCopyWith(
    _$SalesTargetImpl value,
    $Res Function(_$SalesTargetImpl) then,
  ) = __$$SalesTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double targetValue,
    double achievedValue,
    String period,
    DateTime startDate,
    DateTime endDate,
    String status,
    String metric,
  });
}

/// @nodoc
class __$$SalesTargetImplCopyWithImpl<$Res>
    extends _$SalesTargetCopyWithImpl<$Res, _$SalesTargetImpl>
    implements _$$SalesTargetImplCopyWith<$Res> {
  __$$SalesTargetImplCopyWithImpl(
    _$SalesTargetImpl _value,
    $Res Function(_$SalesTargetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalesTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? metric = null,
  }) {
    return _then(
      _$SalesTargetImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        targetValue: null == targetValue
            ? _value.targetValue
            : targetValue // ignore: cast_nullable_to_non_nullable
                  as double,
        achievedValue: null == achievedValue
            ? _value.achievedValue
            : achievedValue // ignore: cast_nullable_to_non_nullable
                  as double,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesTargetImpl extends _SalesTarget {
  const _$SalesTargetImpl({
    required this.id,
    required this.targetValue,
    this.achievedValue = 0,
    required this.period,
    required this.startDate,
    required this.endDate,
    this.status = 'active',
    this.metric = 'revenue',
  }) : super._();

  factory _$SalesTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesTargetImplFromJson(json);

  @override
  final String id;
  @override
  final double targetValue;
  @override
  @JsonKey()
  final double achievedValue;
  @override
  final String period;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String metric;

  @override
  String toString() {
    return 'SalesTarget(id: $id, targetValue: $targetValue, achievedValue: $achievedValue, period: $period, startDate: $startDate, endDate: $endDate, status: $status, metric: $metric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesTargetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.achievedValue, achievedValue) ||
                other.achievedValue == achievedValue) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.metric, metric) || other.metric == metric));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    targetValue,
    achievedValue,
    period,
    startDate,
    endDate,
    status,
    metric,
  );

  /// Create a copy of SalesTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesTargetImplCopyWith<_$SalesTargetImpl> get copyWith =>
      __$$SalesTargetImplCopyWithImpl<_$SalesTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesTargetImplToJson(this);
  }
}

abstract class _SalesTarget extends SalesTarget {
  const factory _SalesTarget({
    required final String id,
    required final double targetValue,
    final double achievedValue,
    required final String period,
    required final DateTime startDate,
    required final DateTime endDate,
    final String status,
    final String metric,
  }) = _$SalesTargetImpl;
  const _SalesTarget._() : super._();

  factory _SalesTarget.fromJson(Map<String, dynamic> json) =
      _$SalesTargetImpl.fromJson;

  @override
  String get id;
  @override
  double get targetValue;
  @override
  double get achievedValue;
  @override
  String get period;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get status;
  @override
  String get metric;

  /// Create a copy of SalesTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesTargetImplCopyWith<_$SalesTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
