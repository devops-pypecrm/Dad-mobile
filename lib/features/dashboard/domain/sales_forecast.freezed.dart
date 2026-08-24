// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SalesForecast _$SalesForecastFromJson(Map<String, dynamic> json) {
  return _SalesForecast.fromJson(json);
}

/// @nodoc
mixin _$SalesForecast {
  double get weightedForecast => throw _privateConstructorUsedError;
  double get totalPipeline => throw _privateConstructorUsedError;

  /// Serializes this SalesForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesForecastCopyWith<SalesForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesForecastCopyWith<$Res> {
  factory $SalesForecastCopyWith(
    SalesForecast value,
    $Res Function(SalesForecast) then,
  ) = _$SalesForecastCopyWithImpl<$Res, SalesForecast>;
  @useResult
  $Res call({double weightedForecast, double totalPipeline});
}

/// @nodoc
class _$SalesForecastCopyWithImpl<$Res, $Val extends SalesForecast>
    implements $SalesForecastCopyWith<$Res> {
  _$SalesForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? weightedForecast = null, Object? totalPipeline = null}) {
    return _then(
      _value.copyWith(
            weightedForecast: null == weightedForecast
                ? _value.weightedForecast
                : weightedForecast // ignore: cast_nullable_to_non_nullable
                      as double,
            totalPipeline: null == totalPipeline
                ? _value.totalPipeline
                : totalPipeline // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SalesForecastImplCopyWith<$Res>
    implements $SalesForecastCopyWith<$Res> {
  factory _$$SalesForecastImplCopyWith(
    _$SalesForecastImpl value,
    $Res Function(_$SalesForecastImpl) then,
  ) = __$$SalesForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double weightedForecast, double totalPipeline});
}

/// @nodoc
class __$$SalesForecastImplCopyWithImpl<$Res>
    extends _$SalesForecastCopyWithImpl<$Res, _$SalesForecastImpl>
    implements _$$SalesForecastImplCopyWith<$Res> {
  __$$SalesForecastImplCopyWithImpl(
    _$SalesForecastImpl _value,
    $Res Function(_$SalesForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalesForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? weightedForecast = null, Object? totalPipeline = null}) {
    return _then(
      _$SalesForecastImpl(
        weightedForecast: null == weightedForecast
            ? _value.weightedForecast
            : weightedForecast // ignore: cast_nullable_to_non_nullable
                  as double,
        totalPipeline: null == totalPipeline
            ? _value.totalPipeline
            : totalPipeline // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesForecastImpl implements _SalesForecast {
  const _$SalesForecastImpl({
    this.weightedForecast = 0,
    this.totalPipeline = 0,
  });

  factory _$SalesForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesForecastImplFromJson(json);

  @override
  @JsonKey()
  final double weightedForecast;
  @override
  @JsonKey()
  final double totalPipeline;

  @override
  String toString() {
    return 'SalesForecast(weightedForecast: $weightedForecast, totalPipeline: $totalPipeline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesForecastImpl &&
            (identical(other.weightedForecast, weightedForecast) ||
                other.weightedForecast == weightedForecast) &&
            (identical(other.totalPipeline, totalPipeline) ||
                other.totalPipeline == totalPipeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weightedForecast, totalPipeline);

  /// Create a copy of SalesForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesForecastImplCopyWith<_$SalesForecastImpl> get copyWith =>
      __$$SalesForecastImplCopyWithImpl<_$SalesForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesForecastImplToJson(this);
  }
}

abstract class _SalesForecast implements SalesForecast {
  const factory _SalesForecast({
    final double weightedForecast,
    final double totalPipeline,
  }) = _$SalesForecastImpl;

  factory _SalesForecast.fromJson(Map<String, dynamic> json) =
      _$SalesForecastImpl.fromJson;

  @override
  double get weightedForecast;
  @override
  double get totalPipeline;

  /// Create a copy of SalesForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesForecastImplCopyWith<_$SalesForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
