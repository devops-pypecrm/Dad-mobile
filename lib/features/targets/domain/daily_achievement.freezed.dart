// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyAchievement _$DailyAchievementFromJson(Map<String, dynamic> json) {
  return _DailyAchievement.fromJson(json);
}

/// @nodoc
mixin _$DailyAchievement {
  bool get hasTarget => throw _privateConstructorUsedError;
  bool get showNotification => throw _privateConstructorUsedError;
  DailyTargetSummary? get target => throw _privateConstructorUsedError;

  /// Serializes this DailyAchievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyAchievementCopyWith<DailyAchievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyAchievementCopyWith<$Res> {
  factory $DailyAchievementCopyWith(
    DailyAchievement value,
    $Res Function(DailyAchievement) then,
  ) = _$DailyAchievementCopyWithImpl<$Res, DailyAchievement>;
  @useResult
  $Res call({
    bool hasTarget,
    bool showNotification,
    DailyTargetSummary? target,
  });

  $DailyTargetSummaryCopyWith<$Res>? get target;
}

/// @nodoc
class _$DailyAchievementCopyWithImpl<$Res, $Val extends DailyAchievement>
    implements $DailyAchievementCopyWith<$Res> {
  _$DailyAchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasTarget = null,
    Object? showNotification = null,
    Object? target = freezed,
  }) {
    return _then(
      _value.copyWith(
            hasTarget: null == hasTarget
                ? _value.hasTarget
                : hasTarget // ignore: cast_nullable_to_non_nullable
                      as bool,
            showNotification: null == showNotification
                ? _value.showNotification
                : showNotification // ignore: cast_nullable_to_non_nullable
                      as bool,
            target: freezed == target
                ? _value.target
                : target // ignore: cast_nullable_to_non_nullable
                      as DailyTargetSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of DailyAchievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyTargetSummaryCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $DailyTargetSummaryCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyAchievementImplCopyWith<$Res>
    implements $DailyAchievementCopyWith<$Res> {
  factory _$$DailyAchievementImplCopyWith(
    _$DailyAchievementImpl value,
    $Res Function(_$DailyAchievementImpl) then,
  ) = __$$DailyAchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool hasTarget,
    bool showNotification,
    DailyTargetSummary? target,
  });

  @override
  $DailyTargetSummaryCopyWith<$Res>? get target;
}

/// @nodoc
class __$$DailyAchievementImplCopyWithImpl<$Res>
    extends _$DailyAchievementCopyWithImpl<$Res, _$DailyAchievementImpl>
    implements _$$DailyAchievementImplCopyWith<$Res> {
  __$$DailyAchievementImplCopyWithImpl(
    _$DailyAchievementImpl _value,
    $Res Function(_$DailyAchievementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasTarget = null,
    Object? showNotification = null,
    Object? target = freezed,
  }) {
    return _then(
      _$DailyAchievementImpl(
        hasTarget: null == hasTarget
            ? _value.hasTarget
            : hasTarget // ignore: cast_nullable_to_non_nullable
                  as bool,
        showNotification: null == showNotification
            ? _value.showNotification
            : showNotification // ignore: cast_nullable_to_non_nullable
                  as bool,
        target: freezed == target
            ? _value.target
            : target // ignore: cast_nullable_to_non_nullable
                  as DailyTargetSummary?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyAchievementImpl implements _DailyAchievement {
  const _$DailyAchievementImpl({
    this.hasTarget = false,
    this.showNotification = false,
    this.target,
  });

  factory _$DailyAchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyAchievementImplFromJson(json);

  @override
  @JsonKey()
  final bool hasTarget;
  @override
  @JsonKey()
  final bool showNotification;
  @override
  final DailyTargetSummary? target;

  @override
  String toString() {
    return 'DailyAchievement(hasTarget: $hasTarget, showNotification: $showNotification, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyAchievementImpl &&
            (identical(other.hasTarget, hasTarget) ||
                other.hasTarget == hasTarget) &&
            (identical(other.showNotification, showNotification) ||
                other.showNotification == showNotification) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hasTarget, showNotification, target);

  /// Create a copy of DailyAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyAchievementImplCopyWith<_$DailyAchievementImpl> get copyWith =>
      __$$DailyAchievementImplCopyWithImpl<_$DailyAchievementImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyAchievementImplToJson(this);
  }
}

abstract class _DailyAchievement implements DailyAchievement {
  const factory _DailyAchievement({
    final bool hasTarget,
    final bool showNotification,
    final DailyTargetSummary? target,
  }) = _$DailyAchievementImpl;

  factory _DailyAchievement.fromJson(Map<String, dynamic> json) =
      _$DailyAchievementImpl.fromJson;

  @override
  bool get hasTarget;
  @override
  bool get showNotification;
  @override
  DailyTargetSummary? get target;

  /// Create a copy of DailyAchievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyAchievementImplCopyWith<_$DailyAchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyTargetSummary _$DailyTargetSummaryFromJson(Map<String, dynamic> json) {
  return _DailyTargetSummary.fromJson(json);
}

/// @nodoc
mixin _$DailyTargetSummary {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  double get achievedValue => throw _privateConstructorUsedError;
  int get achievementPercent => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  int get daysRemaining => throw _privateConstructorUsedError;
  double get amountRemaining => throw _privateConstructorUsedError;

  /// Serializes this DailyTargetSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTargetSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTargetSummaryCopyWith<DailyTargetSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTargetSummaryCopyWith<$Res> {
  factory $DailyTargetSummaryCopyWith(
    DailyTargetSummary value,
    $Res Function(DailyTargetSummary) then,
  ) = _$DailyTargetSummaryCopyWithImpl<$Res, DailyTargetSummary>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    double targetValue,
    double achievedValue,
    int achievementPercent,
    String period,
    int daysRemaining,
    double amountRemaining,
  });
}

/// @nodoc
class _$DailyTargetSummaryCopyWithImpl<$Res, $Val extends DailyTargetSummary>
    implements $DailyTargetSummaryCopyWith<$Res> {
  _$DailyTargetSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTargetSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? achievementPercent = null,
    Object? period = null,
    Object? daysRemaining = null,
    Object? amountRemaining = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            targetValue: null == targetValue
                ? _value.targetValue
                : targetValue // ignore: cast_nullable_to_non_nullable
                      as double,
            achievedValue: null == achievedValue
                ? _value.achievedValue
                : achievedValue // ignore: cast_nullable_to_non_nullable
                      as double,
            achievementPercent: null == achievementPercent
                ? _value.achievementPercent
                : achievementPercent // ignore: cast_nullable_to_non_nullable
                      as int,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
            daysRemaining: null == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
            amountRemaining: null == amountRemaining
                ? _value.amountRemaining
                : amountRemaining // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyTargetSummaryImplCopyWith<$Res>
    implements $DailyTargetSummaryCopyWith<$Res> {
  factory _$$DailyTargetSummaryImplCopyWith(
    _$DailyTargetSummaryImpl value,
    $Res Function(_$DailyTargetSummaryImpl) then,
  ) = __$$DailyTargetSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    double targetValue,
    double achievedValue,
    int achievementPercent,
    String period,
    int daysRemaining,
    double amountRemaining,
  });
}

/// @nodoc
class __$$DailyTargetSummaryImplCopyWithImpl<$Res>
    extends _$DailyTargetSummaryCopyWithImpl<$Res, _$DailyTargetSummaryImpl>
    implements _$$DailyTargetSummaryImplCopyWith<$Res> {
  __$$DailyTargetSummaryImplCopyWithImpl(
    _$DailyTargetSummaryImpl _value,
    $Res Function(_$DailyTargetSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyTargetSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? achievementPercent = null,
    Object? period = null,
    Object? daysRemaining = null,
    Object? amountRemaining = null,
  }) {
    return _then(
      _$DailyTargetSummaryImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetValue: null == targetValue
            ? _value.targetValue
            : targetValue // ignore: cast_nullable_to_non_nullable
                  as double,
        achievedValue: null == achievedValue
            ? _value.achievedValue
            : achievedValue // ignore: cast_nullable_to_non_nullable
                  as double,
        achievementPercent: null == achievementPercent
            ? _value.achievementPercent
            : achievementPercent // ignore: cast_nullable_to_non_nullable
                  as int,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
        daysRemaining: null == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
        amountRemaining: null == amountRemaining
            ? _value.amountRemaining
            : amountRemaining // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTargetSummaryImpl implements _DailyTargetSummary {
  const _$DailyTargetSummaryImpl({
    @JsonKey(name: '_id') this.id,
    required this.targetValue,
    required this.achievedValue,
    required this.achievementPercent,
    required this.period,
    required this.daysRemaining,
    required this.amountRemaining,
  });

  factory _$DailyTargetSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTargetSummaryImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final double targetValue;
  @override
  final double achievedValue;
  @override
  final int achievementPercent;
  @override
  final String period;
  @override
  final int daysRemaining;
  @override
  final double amountRemaining;

  @override
  String toString() {
    return 'DailyTargetSummary(id: $id, targetValue: $targetValue, achievedValue: $achievedValue, achievementPercent: $achievementPercent, period: $period, daysRemaining: $daysRemaining, amountRemaining: $amountRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTargetSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.achievedValue, achievedValue) ||
                other.achievedValue == achievedValue) &&
            (identical(other.achievementPercent, achievementPercent) ||
                other.achievementPercent == achievementPercent) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.amountRemaining, amountRemaining) ||
                other.amountRemaining == amountRemaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    targetValue,
    achievedValue,
    achievementPercent,
    period,
    daysRemaining,
    amountRemaining,
  );

  /// Create a copy of DailyTargetSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTargetSummaryImplCopyWith<_$DailyTargetSummaryImpl> get copyWith =>
      __$$DailyTargetSummaryImplCopyWithImpl<_$DailyTargetSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTargetSummaryImplToJson(this);
  }
}

abstract class _DailyTargetSummary implements DailyTargetSummary {
  const factory _DailyTargetSummary({
    @JsonKey(name: '_id') final String? id,
    required final double targetValue,
    required final double achievedValue,
    required final int achievementPercent,
    required final String period,
    required final int daysRemaining,
    required final double amountRemaining,
  }) = _$DailyTargetSummaryImpl;

  factory _DailyTargetSummary.fromJson(Map<String, dynamic> json) =
      _$DailyTargetSummaryImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  double get targetValue;
  @override
  double get achievedValue;
  @override
  int get achievementPercent;
  @override
  String get period;
  @override
  int get daysRemaining;
  @override
  double get amountRemaining;

  /// Create a copy of DailyTargetSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTargetSummaryImplCopyWith<_$DailyTargetSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
