// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expected_revenue_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExpectedRevenueReport _$ExpectedRevenueReportFromJson(
  Map<String, dynamic> json,
) {
  return _ExpectedRevenueReport.fromJson(json);
}

/// @nodoc
mixin _$ExpectedRevenueReport {
  String get periodLabel => throw _privateConstructorUsedError;
  ExpectedRevenueSummary get summary => throw _privateConstructorUsedError;
  List<ExpectedRevenueDeal> get deals => throw _privateConstructorUsedError;

  /// Serializes this ExpectedRevenueReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpectedRevenueReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpectedRevenueReportCopyWith<ExpectedRevenueReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpectedRevenueReportCopyWith<$Res> {
  factory $ExpectedRevenueReportCopyWith(
    ExpectedRevenueReport value,
    $Res Function(ExpectedRevenueReport) then,
  ) = _$ExpectedRevenueReportCopyWithImpl<$Res, ExpectedRevenueReport>;
  @useResult
  $Res call({
    String periodLabel,
    ExpectedRevenueSummary summary,
    List<ExpectedRevenueDeal> deals,
  });

  $ExpectedRevenueSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$ExpectedRevenueReportCopyWithImpl<
  $Res,
  $Val extends ExpectedRevenueReport
>
    implements $ExpectedRevenueReportCopyWith<$Res> {
  _$ExpectedRevenueReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpectedRevenueReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodLabel = null,
    Object? summary = null,
    Object? deals = null,
  }) {
    return _then(
      _value.copyWith(
            periodLabel: null == periodLabel
                ? _value.periodLabel
                : periodLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as ExpectedRevenueSummary,
            deals: null == deals
                ? _value.deals
                : deals // ignore: cast_nullable_to_non_nullable
                      as List<ExpectedRevenueDeal>,
          )
          as $Val,
    );
  }

  /// Create a copy of ExpectedRevenueReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpectedRevenueSummaryCopyWith<$Res> get summary {
    return $ExpectedRevenueSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpectedRevenueReportImplCopyWith<$Res>
    implements $ExpectedRevenueReportCopyWith<$Res> {
  factory _$$ExpectedRevenueReportImplCopyWith(
    _$ExpectedRevenueReportImpl value,
    $Res Function(_$ExpectedRevenueReportImpl) then,
  ) = __$$ExpectedRevenueReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String periodLabel,
    ExpectedRevenueSummary summary,
    List<ExpectedRevenueDeal> deals,
  });

  @override
  $ExpectedRevenueSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$ExpectedRevenueReportImplCopyWithImpl<$Res>
    extends
        _$ExpectedRevenueReportCopyWithImpl<$Res, _$ExpectedRevenueReportImpl>
    implements _$$ExpectedRevenueReportImplCopyWith<$Res> {
  __$$ExpectedRevenueReportImplCopyWithImpl(
    _$ExpectedRevenueReportImpl _value,
    $Res Function(_$ExpectedRevenueReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpectedRevenueReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodLabel = null,
    Object? summary = null,
    Object? deals = null,
  }) {
    return _then(
      _$ExpectedRevenueReportImpl(
        periodLabel: null == periodLabel
            ? _value.periodLabel
            : periodLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as ExpectedRevenueSummary,
        deals: null == deals
            ? _value._deals
            : deals // ignore: cast_nullable_to_non_nullable
                  as List<ExpectedRevenueDeal>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpectedRevenueReportImpl implements _ExpectedRevenueReport {
  const _$ExpectedRevenueReportImpl({
    required this.periodLabel,
    required this.summary,
    final List<ExpectedRevenueDeal> deals = const <ExpectedRevenueDeal>[],
  }) : _deals = deals;

  factory _$ExpectedRevenueReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpectedRevenueReportImplFromJson(json);

  @override
  final String periodLabel;
  @override
  final ExpectedRevenueSummary summary;
  final List<ExpectedRevenueDeal> _deals;
  @override
  @JsonKey()
  List<ExpectedRevenueDeal> get deals {
    if (_deals is EqualUnmodifiableListView) return _deals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deals);
  }

  @override
  String toString() {
    return 'ExpectedRevenueReport(periodLabel: $periodLabel, summary: $summary, deals: $deals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpectedRevenueReportImpl &&
            (identical(other.periodLabel, periodLabel) ||
                other.periodLabel == periodLabel) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._deals, _deals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    periodLabel,
    summary,
    const DeepCollectionEquality().hash(_deals),
  );

  /// Create a copy of ExpectedRevenueReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpectedRevenueReportImplCopyWith<_$ExpectedRevenueReportImpl>
  get copyWith =>
      __$$ExpectedRevenueReportImplCopyWithImpl<_$ExpectedRevenueReportImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpectedRevenueReportImplToJson(this);
  }
}

abstract class _ExpectedRevenueReport implements ExpectedRevenueReport {
  const factory _ExpectedRevenueReport({
    required final String periodLabel,
    required final ExpectedRevenueSummary summary,
    final List<ExpectedRevenueDeal> deals,
  }) = _$ExpectedRevenueReportImpl;

  factory _ExpectedRevenueReport.fromJson(Map<String, dynamic> json) =
      _$ExpectedRevenueReportImpl.fromJson;

  @override
  String get periodLabel;
  @override
  ExpectedRevenueSummary get summary;
  @override
  List<ExpectedRevenueDeal> get deals;

  /// Create a copy of ExpectedRevenueReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpectedRevenueReportImplCopyWith<_$ExpectedRevenueReportImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ExpectedRevenueSummary _$ExpectedRevenueSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _ExpectedRevenueSummary.fromJson(json);
}

/// @nodoc
mixin _$ExpectedRevenueSummary {
  double get totalExpectedRevenue => throw _privateConstructorUsedError;
  double get currentPeriodAmount => throw _privateConstructorUsedError;
  int get currentPeriodCount => throw _privateConstructorUsedError;
  double get carriedForwardAmount => throw _privateConstructorUsedError;
  int get carriedForwardCount => throw _privateConstructorUsedError;
  double get upcomingAmount => throw _privateConstructorUsedError;
  int get upcomingCount => throw _privateConstructorUsedError;
  double get noCloseDateAmount => throw _privateConstructorUsedError;
  int get noCloseDateCount => throw _privateConstructorUsedError;

  /// Serializes this ExpectedRevenueSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpectedRevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpectedRevenueSummaryCopyWith<ExpectedRevenueSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpectedRevenueSummaryCopyWith<$Res> {
  factory $ExpectedRevenueSummaryCopyWith(
    ExpectedRevenueSummary value,
    $Res Function(ExpectedRevenueSummary) then,
  ) = _$ExpectedRevenueSummaryCopyWithImpl<$Res, ExpectedRevenueSummary>;
  @useResult
  $Res call({
    double totalExpectedRevenue,
    double currentPeriodAmount,
    int currentPeriodCount,
    double carriedForwardAmount,
    int carriedForwardCount,
    double upcomingAmount,
    int upcomingCount,
    double noCloseDateAmount,
    int noCloseDateCount,
  });
}

/// @nodoc
class _$ExpectedRevenueSummaryCopyWithImpl<
  $Res,
  $Val extends ExpectedRevenueSummary
>
    implements $ExpectedRevenueSummaryCopyWith<$Res> {
  _$ExpectedRevenueSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpectedRevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpectedRevenue = null,
    Object? currentPeriodAmount = null,
    Object? currentPeriodCount = null,
    Object? carriedForwardAmount = null,
    Object? carriedForwardCount = null,
    Object? upcomingAmount = null,
    Object? upcomingCount = null,
    Object? noCloseDateAmount = null,
    Object? noCloseDateCount = null,
  }) {
    return _then(
      _value.copyWith(
            totalExpectedRevenue: null == totalExpectedRevenue
                ? _value.totalExpectedRevenue
                : totalExpectedRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            currentPeriodAmount: null == currentPeriodAmount
                ? _value.currentPeriodAmount
                : currentPeriodAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            currentPeriodCount: null == currentPeriodCount
                ? _value.currentPeriodCount
                : currentPeriodCount // ignore: cast_nullable_to_non_nullable
                      as int,
            carriedForwardAmount: null == carriedForwardAmount
                ? _value.carriedForwardAmount
                : carriedForwardAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            carriedForwardCount: null == carriedForwardCount
                ? _value.carriedForwardCount
                : carriedForwardCount // ignore: cast_nullable_to_non_nullable
                      as int,
            upcomingAmount: null == upcomingAmount
                ? _value.upcomingAmount
                : upcomingAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            upcomingCount: null == upcomingCount
                ? _value.upcomingCount
                : upcomingCount // ignore: cast_nullable_to_non_nullable
                      as int,
            noCloseDateAmount: null == noCloseDateAmount
                ? _value.noCloseDateAmount
                : noCloseDateAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            noCloseDateCount: null == noCloseDateCount
                ? _value.noCloseDateCount
                : noCloseDateCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExpectedRevenueSummaryImplCopyWith<$Res>
    implements $ExpectedRevenueSummaryCopyWith<$Res> {
  factory _$$ExpectedRevenueSummaryImplCopyWith(
    _$ExpectedRevenueSummaryImpl value,
    $Res Function(_$ExpectedRevenueSummaryImpl) then,
  ) = __$$ExpectedRevenueSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalExpectedRevenue,
    double currentPeriodAmount,
    int currentPeriodCount,
    double carriedForwardAmount,
    int carriedForwardCount,
    double upcomingAmount,
    int upcomingCount,
    double noCloseDateAmount,
    int noCloseDateCount,
  });
}

/// @nodoc
class __$$ExpectedRevenueSummaryImplCopyWithImpl<$Res>
    extends
        _$ExpectedRevenueSummaryCopyWithImpl<$Res, _$ExpectedRevenueSummaryImpl>
    implements _$$ExpectedRevenueSummaryImplCopyWith<$Res> {
  __$$ExpectedRevenueSummaryImplCopyWithImpl(
    _$ExpectedRevenueSummaryImpl _value,
    $Res Function(_$ExpectedRevenueSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpectedRevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpectedRevenue = null,
    Object? currentPeriodAmount = null,
    Object? currentPeriodCount = null,
    Object? carriedForwardAmount = null,
    Object? carriedForwardCount = null,
    Object? upcomingAmount = null,
    Object? upcomingCount = null,
    Object? noCloseDateAmount = null,
    Object? noCloseDateCount = null,
  }) {
    return _then(
      _$ExpectedRevenueSummaryImpl(
        totalExpectedRevenue: null == totalExpectedRevenue
            ? _value.totalExpectedRevenue
            : totalExpectedRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        currentPeriodAmount: null == currentPeriodAmount
            ? _value.currentPeriodAmount
            : currentPeriodAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        currentPeriodCount: null == currentPeriodCount
            ? _value.currentPeriodCount
            : currentPeriodCount // ignore: cast_nullable_to_non_nullable
                  as int,
        carriedForwardAmount: null == carriedForwardAmount
            ? _value.carriedForwardAmount
            : carriedForwardAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        carriedForwardCount: null == carriedForwardCount
            ? _value.carriedForwardCount
            : carriedForwardCount // ignore: cast_nullable_to_non_nullable
                  as int,
        upcomingAmount: null == upcomingAmount
            ? _value.upcomingAmount
            : upcomingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        upcomingCount: null == upcomingCount
            ? _value.upcomingCount
            : upcomingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        noCloseDateAmount: null == noCloseDateAmount
            ? _value.noCloseDateAmount
            : noCloseDateAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        noCloseDateCount: null == noCloseDateCount
            ? _value.noCloseDateCount
            : noCloseDateCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpectedRevenueSummaryImpl implements _ExpectedRevenueSummary {
  const _$ExpectedRevenueSummaryImpl({
    this.totalExpectedRevenue = 0,
    this.currentPeriodAmount = 0,
    this.currentPeriodCount = 0,
    this.carriedForwardAmount = 0,
    this.carriedForwardCount = 0,
    this.upcomingAmount = 0,
    this.upcomingCount = 0,
    this.noCloseDateAmount = 0,
    this.noCloseDateCount = 0,
  });

  factory _$ExpectedRevenueSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpectedRevenueSummaryImplFromJson(json);

  @override
  @JsonKey()
  final double totalExpectedRevenue;
  @override
  @JsonKey()
  final double currentPeriodAmount;
  @override
  @JsonKey()
  final int currentPeriodCount;
  @override
  @JsonKey()
  final double carriedForwardAmount;
  @override
  @JsonKey()
  final int carriedForwardCount;
  @override
  @JsonKey()
  final double upcomingAmount;
  @override
  @JsonKey()
  final int upcomingCount;
  @override
  @JsonKey()
  final double noCloseDateAmount;
  @override
  @JsonKey()
  final int noCloseDateCount;

  @override
  String toString() {
    return 'ExpectedRevenueSummary(totalExpectedRevenue: $totalExpectedRevenue, currentPeriodAmount: $currentPeriodAmount, currentPeriodCount: $currentPeriodCount, carriedForwardAmount: $carriedForwardAmount, carriedForwardCount: $carriedForwardCount, upcomingAmount: $upcomingAmount, upcomingCount: $upcomingCount, noCloseDateAmount: $noCloseDateAmount, noCloseDateCount: $noCloseDateCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpectedRevenueSummaryImpl &&
            (identical(other.totalExpectedRevenue, totalExpectedRevenue) ||
                other.totalExpectedRevenue == totalExpectedRevenue) &&
            (identical(other.currentPeriodAmount, currentPeriodAmount) ||
                other.currentPeriodAmount == currentPeriodAmount) &&
            (identical(other.currentPeriodCount, currentPeriodCount) ||
                other.currentPeriodCount == currentPeriodCount) &&
            (identical(other.carriedForwardAmount, carriedForwardAmount) ||
                other.carriedForwardAmount == carriedForwardAmount) &&
            (identical(other.carriedForwardCount, carriedForwardCount) ||
                other.carriedForwardCount == carriedForwardCount) &&
            (identical(other.upcomingAmount, upcomingAmount) ||
                other.upcomingAmount == upcomingAmount) &&
            (identical(other.upcomingCount, upcomingCount) ||
                other.upcomingCount == upcomingCount) &&
            (identical(other.noCloseDateAmount, noCloseDateAmount) ||
                other.noCloseDateAmount == noCloseDateAmount) &&
            (identical(other.noCloseDateCount, noCloseDateCount) ||
                other.noCloseDateCount == noCloseDateCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalExpectedRevenue,
    currentPeriodAmount,
    currentPeriodCount,
    carriedForwardAmount,
    carriedForwardCount,
    upcomingAmount,
    upcomingCount,
    noCloseDateAmount,
    noCloseDateCount,
  );

  /// Create a copy of ExpectedRevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpectedRevenueSummaryImplCopyWith<_$ExpectedRevenueSummaryImpl>
  get copyWith =>
      __$$ExpectedRevenueSummaryImplCopyWithImpl<_$ExpectedRevenueSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpectedRevenueSummaryImplToJson(this);
  }
}

abstract class _ExpectedRevenueSummary implements ExpectedRevenueSummary {
  const factory _ExpectedRevenueSummary({
    final double totalExpectedRevenue,
    final double currentPeriodAmount,
    final int currentPeriodCount,
    final double carriedForwardAmount,
    final int carriedForwardCount,
    final double upcomingAmount,
    final int upcomingCount,
    final double noCloseDateAmount,
    final int noCloseDateCount,
  }) = _$ExpectedRevenueSummaryImpl;

  factory _ExpectedRevenueSummary.fromJson(Map<String, dynamic> json) =
      _$ExpectedRevenueSummaryImpl.fromJson;

  @override
  double get totalExpectedRevenue;
  @override
  double get currentPeriodAmount;
  @override
  int get currentPeriodCount;
  @override
  double get carriedForwardAmount;
  @override
  int get carriedForwardCount;
  @override
  double get upcomingAmount;
  @override
  int get upcomingCount;
  @override
  double get noCloseDateAmount;
  @override
  int get noCloseDateCount;

  /// Create a copy of ExpectedRevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpectedRevenueSummaryImplCopyWith<_$ExpectedRevenueSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ExpectedRevenueDeal _$ExpectedRevenueDealFromJson(Map<String, dynamic> json) {
  return _ExpectedRevenueDeal.fromJson(json);
}

/// @nodoc
mixin _$ExpectedRevenueDeal {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get probability => throw _privateConstructorUsedError;
  DateTime? get closeDate => throw _privateConstructorUsedError;
  ExpectedRevenueDealStatus get status => throw _privateConstructorUsedError;

  /// Serializes this ExpectedRevenueDeal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpectedRevenueDeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpectedRevenueDealCopyWith<ExpectedRevenueDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpectedRevenueDealCopyWith<$Res> {
  factory $ExpectedRevenueDealCopyWith(
    ExpectedRevenueDeal value,
    $Res Function(ExpectedRevenueDeal) then,
  ) = _$ExpectedRevenueDealCopyWithImpl<$Res, ExpectedRevenueDeal>;
  @useResult
  $Res call({
    String id,
    String name,
    String customerName,
    String ownerName,
    String branchName,
    String stage,
    double amount,
    int probability,
    DateTime? closeDate,
    ExpectedRevenueDealStatus status,
  });
}

/// @nodoc
class _$ExpectedRevenueDealCopyWithImpl<$Res, $Val extends ExpectedRevenueDeal>
    implements $ExpectedRevenueDealCopyWith<$Res> {
  _$ExpectedRevenueDealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpectedRevenueDeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? customerName = null,
    Object? ownerName = null,
    Object? branchName = null,
    Object? stage = null,
    Object? amount = null,
    Object? probability = null,
    Object? closeDate = freezed,
    Object? status = null,
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
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            ownerName: null == ownerName
                ? _value.ownerName
                : ownerName // ignore: cast_nullable_to_non_nullable
                      as String,
            branchName: null == branchName
                ? _value.branchName
                : branchName // ignore: cast_nullable_to_non_nullable
                      as String,
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as int,
            closeDate: freezed == closeDate
                ? _value.closeDate
                : closeDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ExpectedRevenueDealStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExpectedRevenueDealImplCopyWith<$Res>
    implements $ExpectedRevenueDealCopyWith<$Res> {
  factory _$$ExpectedRevenueDealImplCopyWith(
    _$ExpectedRevenueDealImpl value,
    $Res Function(_$ExpectedRevenueDealImpl) then,
  ) = __$$ExpectedRevenueDealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String customerName,
    String ownerName,
    String branchName,
    String stage,
    double amount,
    int probability,
    DateTime? closeDate,
    ExpectedRevenueDealStatus status,
  });
}

/// @nodoc
class __$$ExpectedRevenueDealImplCopyWithImpl<$Res>
    extends _$ExpectedRevenueDealCopyWithImpl<$Res, _$ExpectedRevenueDealImpl>
    implements _$$ExpectedRevenueDealImplCopyWith<$Res> {
  __$$ExpectedRevenueDealImplCopyWithImpl(
    _$ExpectedRevenueDealImpl _value,
    $Res Function(_$ExpectedRevenueDealImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpectedRevenueDeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? customerName = null,
    Object? ownerName = null,
    Object? branchName = null,
    Object? stage = null,
    Object? amount = null,
    Object? probability = null,
    Object? closeDate = freezed,
    Object? status = null,
  }) {
    return _then(
      _$ExpectedRevenueDealImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        ownerName: null == ownerName
            ? _value.ownerName
            : ownerName // ignore: cast_nullable_to_non_nullable
                  as String,
        branchName: null == branchName
            ? _value.branchName
            : branchName // ignore: cast_nullable_to_non_nullable
                  as String,
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as int,
        closeDate: freezed == closeDate
            ? _value.closeDate
            : closeDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ExpectedRevenueDealStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpectedRevenueDealImpl implements _ExpectedRevenueDeal {
  const _$ExpectedRevenueDealImpl({
    required this.id,
    required this.name,
    required this.customerName,
    required this.ownerName,
    required this.branchName,
    required this.stage,
    this.amount = 0,
    this.probability = 0,
    this.closeDate,
    required this.status,
  });

  factory _$ExpectedRevenueDealImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpectedRevenueDealImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String customerName;
  @override
  final String ownerName;
  @override
  final String branchName;
  @override
  final String stage;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final int probability;
  @override
  final DateTime? closeDate;
  @override
  final ExpectedRevenueDealStatus status;

  @override
  String toString() {
    return 'ExpectedRevenueDeal(id: $id, name: $name, customerName: $customerName, ownerName: $ownerName, branchName: $branchName, stage: $stage, amount: $amount, probability: $probability, closeDate: $closeDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpectedRevenueDealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    customerName,
    ownerName,
    branchName,
    stage,
    amount,
    probability,
    closeDate,
    status,
  );

  /// Create a copy of ExpectedRevenueDeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpectedRevenueDealImplCopyWith<_$ExpectedRevenueDealImpl> get copyWith =>
      __$$ExpectedRevenueDealImplCopyWithImpl<_$ExpectedRevenueDealImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpectedRevenueDealImplToJson(this);
  }
}

abstract class _ExpectedRevenueDeal implements ExpectedRevenueDeal {
  const factory _ExpectedRevenueDeal({
    required final String id,
    required final String name,
    required final String customerName,
    required final String ownerName,
    required final String branchName,
    required final String stage,
    final double amount,
    final int probability,
    final DateTime? closeDate,
    required final ExpectedRevenueDealStatus status,
  }) = _$ExpectedRevenueDealImpl;

  factory _ExpectedRevenueDeal.fromJson(Map<String, dynamic> json) =
      _$ExpectedRevenueDealImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get customerName;
  @override
  String get ownerName;
  @override
  String get branchName;
  @override
  String get stage;
  @override
  double get amount;
  @override
  int get probability;
  @override
  DateTime? get closeDate;
  @override
  ExpectedRevenueDealStatus get status;

  /// Create a copy of ExpectedRevenueDeal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpectedRevenueDealImplCopyWith<_$ExpectedRevenueDealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
