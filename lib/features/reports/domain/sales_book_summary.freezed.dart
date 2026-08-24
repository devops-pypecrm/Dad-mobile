// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_book_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SalesBookSummary _$SalesBookSummaryFromJson(Map<String, dynamic> json) {
  return _SalesBookSummary.fromJson(json);
}

/// @nodoc
mixin _$SalesBookSummary {
  String get period => throw _privateConstructorUsedError;
  SalesBookTotals get summary => throw _privateConstructorUsedError;

  /// Serializes this SalesBookSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesBookSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesBookSummaryCopyWith<SalesBookSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesBookSummaryCopyWith<$Res> {
  factory $SalesBookSummaryCopyWith(
    SalesBookSummary value,
    $Res Function(SalesBookSummary) then,
  ) = _$SalesBookSummaryCopyWithImpl<$Res, SalesBookSummary>;
  @useResult
  $Res call({String period, SalesBookTotals summary});

  $SalesBookTotalsCopyWith<$Res> get summary;
}

/// @nodoc
class _$SalesBookSummaryCopyWithImpl<$Res, $Val extends SalesBookSummary>
    implements $SalesBookSummaryCopyWith<$Res> {
  _$SalesBookSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesBookSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? period = null, Object? summary = null}) {
    return _then(
      _value.copyWith(
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as SalesBookTotals,
          )
          as $Val,
    );
  }

  /// Create a copy of SalesBookSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesBookTotalsCopyWith<$Res> get summary {
    return $SalesBookTotalsCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesBookSummaryImplCopyWith<$Res>
    implements $SalesBookSummaryCopyWith<$Res> {
  factory _$$SalesBookSummaryImplCopyWith(
    _$SalesBookSummaryImpl value,
    $Res Function(_$SalesBookSummaryImpl) then,
  ) = __$$SalesBookSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String period, SalesBookTotals summary});

  @override
  $SalesBookTotalsCopyWith<$Res> get summary;
}

/// @nodoc
class __$$SalesBookSummaryImplCopyWithImpl<$Res>
    extends _$SalesBookSummaryCopyWithImpl<$Res, _$SalesBookSummaryImpl>
    implements _$$SalesBookSummaryImplCopyWith<$Res> {
  __$$SalesBookSummaryImplCopyWithImpl(
    _$SalesBookSummaryImpl _value,
    $Res Function(_$SalesBookSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalesBookSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? period = null, Object? summary = null}) {
    return _then(
      _$SalesBookSummaryImpl(
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as SalesBookTotals,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesBookSummaryImpl implements _SalesBookSummary {
  const _$SalesBookSummaryImpl({required this.period, required this.summary});

  factory _$SalesBookSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesBookSummaryImplFromJson(json);

  @override
  final String period;
  @override
  final SalesBookTotals summary;

  @override
  String toString() {
    return 'SalesBookSummary(period: $period, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesBookSummaryImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, period, summary);

  /// Create a copy of SalesBookSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesBookSummaryImplCopyWith<_$SalesBookSummaryImpl> get copyWith =>
      __$$SalesBookSummaryImplCopyWithImpl<_$SalesBookSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesBookSummaryImplToJson(this);
  }
}

abstract class _SalesBookSummary implements SalesBookSummary {
  const factory _SalesBookSummary({
    required final String period,
    required final SalesBookTotals summary,
  }) = _$SalesBookSummaryImpl;

  factory _SalesBookSummary.fromJson(Map<String, dynamic> json) =
      _$SalesBookSummaryImpl.fromJson;

  @override
  String get period;
  @override
  SalesBookTotals get summary;

  /// Create a copy of SalesBookSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesBookSummaryImplCopyWith<_$SalesBookSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalesBookTotals _$SalesBookTotalsFromJson(Map<String, dynamic> json) {
  return _SalesBookTotals.fromJson(json);
}

/// @nodoc
mixin _$SalesBookTotals {
  int get totalDeals => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get averageDealSize => throw _privateConstructorUsedError;

  /// Serializes this SalesBookTotals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesBookTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesBookTotalsCopyWith<SalesBookTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesBookTotalsCopyWith<$Res> {
  factory $SalesBookTotalsCopyWith(
    SalesBookTotals value,
    $Res Function(SalesBookTotals) then,
  ) = _$SalesBookTotalsCopyWithImpl<$Res, SalesBookTotals>;
  @useResult
  $Res call({int totalDeals, double totalValue, double averageDealSize});
}

/// @nodoc
class _$SalesBookTotalsCopyWithImpl<$Res, $Val extends SalesBookTotals>
    implements $SalesBookTotalsCopyWith<$Res> {
  _$SalesBookTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesBookTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeals = null,
    Object? totalValue = null,
    Object? averageDealSize = null,
  }) {
    return _then(
      _value.copyWith(
            totalDeals: null == totalDeals
                ? _value.totalDeals
                : totalDeals // ignore: cast_nullable_to_non_nullable
                      as int,
            totalValue: null == totalValue
                ? _value.totalValue
                : totalValue // ignore: cast_nullable_to_non_nullable
                      as double,
            averageDealSize: null == averageDealSize
                ? _value.averageDealSize
                : averageDealSize // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SalesBookTotalsImplCopyWith<$Res>
    implements $SalesBookTotalsCopyWith<$Res> {
  factory _$$SalesBookTotalsImplCopyWith(
    _$SalesBookTotalsImpl value,
    $Res Function(_$SalesBookTotalsImpl) then,
  ) = __$$SalesBookTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalDeals, double totalValue, double averageDealSize});
}

/// @nodoc
class __$$SalesBookTotalsImplCopyWithImpl<$Res>
    extends _$SalesBookTotalsCopyWithImpl<$Res, _$SalesBookTotalsImpl>
    implements _$$SalesBookTotalsImplCopyWith<$Res> {
  __$$SalesBookTotalsImplCopyWithImpl(
    _$SalesBookTotalsImpl _value,
    $Res Function(_$SalesBookTotalsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalesBookTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeals = null,
    Object? totalValue = null,
    Object? averageDealSize = null,
  }) {
    return _then(
      _$SalesBookTotalsImpl(
        totalDeals: null == totalDeals
            ? _value.totalDeals
            : totalDeals // ignore: cast_nullable_to_non_nullable
                  as int,
        totalValue: null == totalValue
            ? _value.totalValue
            : totalValue // ignore: cast_nullable_to_non_nullable
                  as double,
        averageDealSize: null == averageDealSize
            ? _value.averageDealSize
            : averageDealSize // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesBookTotalsImpl implements _SalesBookTotals {
  const _$SalesBookTotalsImpl({
    this.totalDeals = 0,
    this.totalValue = 0,
    this.averageDealSize = 0,
  });

  factory _$SalesBookTotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesBookTotalsImplFromJson(json);

  @override
  @JsonKey()
  final int totalDeals;
  @override
  @JsonKey()
  final double totalValue;
  @override
  @JsonKey()
  final double averageDealSize;

  @override
  String toString() {
    return 'SalesBookTotals(totalDeals: $totalDeals, totalValue: $totalValue, averageDealSize: $averageDealSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesBookTotalsImpl &&
            (identical(other.totalDeals, totalDeals) ||
                other.totalDeals == totalDeals) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.averageDealSize, averageDealSize) ||
                other.averageDealSize == averageDealSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalDeals, totalValue, averageDealSize);

  /// Create a copy of SalesBookTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesBookTotalsImplCopyWith<_$SalesBookTotalsImpl> get copyWith =>
      __$$SalesBookTotalsImplCopyWithImpl<_$SalesBookTotalsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesBookTotalsImplToJson(this);
  }
}

abstract class _SalesBookTotals implements SalesBookTotals {
  const factory _SalesBookTotals({
    final int totalDeals,
    final double totalValue,
    final double averageDealSize,
  }) = _$SalesBookTotalsImpl;

  factory _SalesBookTotals.fromJson(Map<String, dynamic> json) =
      _$SalesBookTotalsImpl.fromJson;

  @override
  int get totalDeals;
  @override
  double get totalValue;
  @override
  double get averageDealSize;

  /// Create a copy of SalesBookTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesBookTotalsImplCopyWith<_$SalesBookTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
