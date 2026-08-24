// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TeamTarget _$TeamTargetFromJson(Map<String, dynamic> json) {
  return _TeamTarget.fromJson(json);
}

/// @nodoc
mixin _$TeamTarget {
  String get id => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  double get achievedValue => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  OwnerRef? get assignedTo => throw _privateConstructorUsedError;

  /// Serializes this TeamTarget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeamTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamTargetCopyWith<TeamTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamTargetCopyWith<$Res> {
  factory $TeamTargetCopyWith(
    TeamTarget value,
    $Res Function(TeamTarget) then,
  ) = _$TeamTargetCopyWithImpl<$Res, TeamTarget>;
  @useResult
  $Res call({
    String id,
    double targetValue,
    double achievedValue,
    String period,
    String status,
    OwnerRef? assignedTo,
  });

  $OwnerRefCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$TeamTargetCopyWithImpl<$Res, $Val extends TeamTarget>
    implements $TeamTargetCopyWith<$Res> {
  _$TeamTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeamTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? period = null,
    Object? status = null,
    Object? assignedTo = freezed,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as OwnerRef?,
          )
          as $Val,
    );
  }

  /// Create a copy of TeamTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerRefCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $OwnerRefCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamTargetImplCopyWith<$Res>
    implements $TeamTargetCopyWith<$Res> {
  factory _$$TeamTargetImplCopyWith(
    _$TeamTargetImpl value,
    $Res Function(_$TeamTargetImpl) then,
  ) = __$$TeamTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double targetValue,
    double achievedValue,
    String period,
    String status,
    OwnerRef? assignedTo,
  });

  @override
  $OwnerRefCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$TeamTargetImplCopyWithImpl<$Res>
    extends _$TeamTargetCopyWithImpl<$Res, _$TeamTargetImpl>
    implements _$$TeamTargetImplCopyWith<$Res> {
  __$$TeamTargetImplCopyWithImpl(
    _$TeamTargetImpl _value,
    $Res Function(_$TeamTargetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TeamTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? period = null,
    Object? status = null,
    Object? assignedTo = freezed,
  }) {
    return _then(
      _$TeamTargetImpl(
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as OwnerRef?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamTargetImpl extends _TeamTarget {
  const _$TeamTargetImpl({
    required this.id,
    required this.targetValue,
    this.achievedValue = 0,
    required this.period,
    this.status = 'active',
    this.assignedTo,
  }) : super._();

  factory _$TeamTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamTargetImplFromJson(json);

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
  @JsonKey()
  final String status;
  @override
  final OwnerRef? assignedTo;

  @override
  String toString() {
    return 'TeamTarget(id: $id, targetValue: $targetValue, achievedValue: $achievedValue, period: $period, status: $status, assignedTo: $assignedTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamTargetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.achievedValue, achievedValue) ||
                other.achievedValue == achievedValue) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    targetValue,
    achievedValue,
    period,
    status,
    assignedTo,
  );

  /// Create a copy of TeamTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamTargetImplCopyWith<_$TeamTargetImpl> get copyWith =>
      __$$TeamTargetImplCopyWithImpl<_$TeamTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamTargetImplToJson(this);
  }
}

abstract class _TeamTarget extends TeamTarget {
  const factory _TeamTarget({
    required final String id,
    required final double targetValue,
    final double achievedValue,
    required final String period,
    final String status,
    final OwnerRef? assignedTo,
  }) = _$TeamTargetImpl;
  const _TeamTarget._() : super._();

  factory _TeamTarget.fromJson(Map<String, dynamic> json) =
      _$TeamTargetImpl.fromJson;

  @override
  String get id;
  @override
  double get targetValue;
  @override
  double get achievedValue;
  @override
  String get period;
  @override
  String get status;
  @override
  OwnerRef? get assignedTo;

  /// Create a copy of TeamTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamTargetImplCopyWith<_$TeamTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
