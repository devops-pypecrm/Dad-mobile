// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  int get totalLeads => throw _privateConstructorUsedError;
  int get activeOpportunities => throw _privateConstructorUsedError;
  int get pendingFollowUps => throw _privateConstructorUsedError;
  double get salesRevenue => throw _privateConstructorUsedError;
  double get revenueThisMonth => throw _privateConstructorUsedError;
  double get winRate => throw _privateConstructorUsedError;
  LeadCounts? get leads => throw _privateConstructorUsedError;
  OpportunityCounts? get opportunities => throw _privateConstructorUsedError;

  /// Serializes this DashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
    DashboardStats value,
    $Res Function(DashboardStats) then,
  ) = _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call({
    int totalLeads,
    int activeOpportunities,
    int pendingFollowUps,
    double salesRevenue,
    double revenueThisMonth,
    double winRate,
    LeadCounts? leads,
    OpportunityCounts? opportunities,
  });

  $LeadCountsCopyWith<$Res>? get leads;
  $OpportunityCountsCopyWith<$Res>? get opportunities;
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLeads = null,
    Object? activeOpportunities = null,
    Object? pendingFollowUps = null,
    Object? salesRevenue = null,
    Object? revenueThisMonth = null,
    Object? winRate = null,
    Object? leads = freezed,
    Object? opportunities = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalLeads: null == totalLeads
                ? _value.totalLeads
                : totalLeads // ignore: cast_nullable_to_non_nullable
                      as int,
            activeOpportunities: null == activeOpportunities
                ? _value.activeOpportunities
                : activeOpportunities // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingFollowUps: null == pendingFollowUps
                ? _value.pendingFollowUps
                : pendingFollowUps // ignore: cast_nullable_to_non_nullable
                      as int,
            salesRevenue: null == salesRevenue
                ? _value.salesRevenue
                : salesRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            revenueThisMonth: null == revenueThisMonth
                ? _value.revenueThisMonth
                : revenueThisMonth // ignore: cast_nullable_to_non_nullable
                      as double,
            winRate: null == winRate
                ? _value.winRate
                : winRate // ignore: cast_nullable_to_non_nullable
                      as double,
            leads: freezed == leads
                ? _value.leads
                : leads // ignore: cast_nullable_to_non_nullable
                      as LeadCounts?,
            opportunities: freezed == opportunities
                ? _value.opportunities
                : opportunities // ignore: cast_nullable_to_non_nullable
                      as OpportunityCounts?,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadCountsCopyWith<$Res>? get leads {
    if (_value.leads == null) {
      return null;
    }

    return $LeadCountsCopyWith<$Res>(_value.leads!, (value) {
      return _then(_value.copyWith(leads: value) as $Val);
    });
  }

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpportunityCountsCopyWith<$Res>? get opportunities {
    if (_value.opportunities == null) {
      return null;
    }

    return $OpportunityCountsCopyWith<$Res>(_value.opportunities!, (value) {
      return _then(_value.copyWith(opportunities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(
    _$DashboardStatsImpl value,
    $Res Function(_$DashboardStatsImpl) then,
  ) = __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalLeads,
    int activeOpportunities,
    int pendingFollowUps,
    double salesRevenue,
    double revenueThisMonth,
    double winRate,
    LeadCounts? leads,
    OpportunityCounts? opportunities,
  });

  @override
  $LeadCountsCopyWith<$Res>? get leads;
  @override
  $OpportunityCountsCopyWith<$Res>? get opportunities;
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
    _$DashboardStatsImpl _value,
    $Res Function(_$DashboardStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLeads = null,
    Object? activeOpportunities = null,
    Object? pendingFollowUps = null,
    Object? salesRevenue = null,
    Object? revenueThisMonth = null,
    Object? winRate = null,
    Object? leads = freezed,
    Object? opportunities = freezed,
  }) {
    return _then(
      _$DashboardStatsImpl(
        totalLeads: null == totalLeads
            ? _value.totalLeads
            : totalLeads // ignore: cast_nullable_to_non_nullable
                  as int,
        activeOpportunities: null == activeOpportunities
            ? _value.activeOpportunities
            : activeOpportunities // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingFollowUps: null == pendingFollowUps
            ? _value.pendingFollowUps
            : pendingFollowUps // ignore: cast_nullable_to_non_nullable
                  as int,
        salesRevenue: null == salesRevenue
            ? _value.salesRevenue
            : salesRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        revenueThisMonth: null == revenueThisMonth
            ? _value.revenueThisMonth
            : revenueThisMonth // ignore: cast_nullable_to_non_nullable
                  as double,
        winRate: null == winRate
            ? _value.winRate
            : winRate // ignore: cast_nullable_to_non_nullable
                  as double,
        leads: freezed == leads
            ? _value.leads
            : leads // ignore: cast_nullable_to_non_nullable
                  as LeadCounts?,
        opportunities: freezed == opportunities
            ? _value.opportunities
            : opportunities // ignore: cast_nullable_to_non_nullable
                  as OpportunityCounts?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl({
    this.totalLeads = 0,
    this.activeOpportunities = 0,
    this.pendingFollowUps = 0,
    this.salesRevenue = 0,
    this.revenueThisMonth = 0,
    this.winRate = 0,
    this.leads,
    this.opportunities,
  });

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalLeads;
  @override
  @JsonKey()
  final int activeOpportunities;
  @override
  @JsonKey()
  final int pendingFollowUps;
  @override
  @JsonKey()
  final double salesRevenue;
  @override
  @JsonKey()
  final double revenueThisMonth;
  @override
  @JsonKey()
  final double winRate;
  @override
  final LeadCounts? leads;
  @override
  final OpportunityCounts? opportunities;

  @override
  String toString() {
    return 'DashboardStats(totalLeads: $totalLeads, activeOpportunities: $activeOpportunities, pendingFollowUps: $pendingFollowUps, salesRevenue: $salesRevenue, revenueThisMonth: $revenueThisMonth, winRate: $winRate, leads: $leads, opportunities: $opportunities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.totalLeads, totalLeads) ||
                other.totalLeads == totalLeads) &&
            (identical(other.activeOpportunities, activeOpportunities) ||
                other.activeOpportunities == activeOpportunities) &&
            (identical(other.pendingFollowUps, pendingFollowUps) ||
                other.pendingFollowUps == pendingFollowUps) &&
            (identical(other.salesRevenue, salesRevenue) ||
                other.salesRevenue == salesRevenue) &&
            (identical(other.revenueThisMonth, revenueThisMonth) ||
                other.revenueThisMonth == revenueThisMonth) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.leads, leads) || other.leads == leads) &&
            (identical(other.opportunities, opportunities) ||
                other.opportunities == opportunities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalLeads,
    activeOpportunities,
    pendingFollowUps,
    salesRevenue,
    revenueThisMonth,
    winRate,
    leads,
    opportunities,
  );

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(this);
  }
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats({
    final int totalLeads,
    final int activeOpportunities,
    final int pendingFollowUps,
    final double salesRevenue,
    final double revenueThisMonth,
    final double winRate,
    final LeadCounts? leads,
    final OpportunityCounts? opportunities,
  }) = _$DashboardStatsImpl;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  int get totalLeads;
  @override
  int get activeOpportunities;
  @override
  int get pendingFollowUps;
  @override
  double get salesRevenue;
  @override
  double get revenueThisMonth;
  @override
  double get winRate;
  @override
  LeadCounts? get leads;
  @override
  OpportunityCounts? get opportunities;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadCounts _$LeadCountsFromJson(Map<String, dynamic> json) {
  return _LeadCounts.fromJson(json);
}

/// @nodoc
mixin _$LeadCounts {
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'new')
  int get newCount => throw _privateConstructorUsedError;
  int get converted => throw _privateConstructorUsedError;

  /// Serializes this LeadCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadCountsCopyWith<LeadCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadCountsCopyWith<$Res> {
  factory $LeadCountsCopyWith(
    LeadCounts value,
    $Res Function(LeadCounts) then,
  ) = _$LeadCountsCopyWithImpl<$Res, LeadCounts>;
  @useResult
  $Res call({int total, @JsonKey(name: 'new') int newCount, int converted});
}

/// @nodoc
class _$LeadCountsCopyWithImpl<$Res, $Val extends LeadCounts>
    implements $LeadCountsCopyWith<$Res> {
  _$LeadCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? newCount = null,
    Object? converted = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            newCount: null == newCount
                ? _value.newCount
                : newCount // ignore: cast_nullable_to_non_nullable
                      as int,
            converted: null == converted
                ? _value.converted
                : converted // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadCountsImplCopyWith<$Res>
    implements $LeadCountsCopyWith<$Res> {
  factory _$$LeadCountsImplCopyWith(
    _$LeadCountsImpl value,
    $Res Function(_$LeadCountsImpl) then,
  ) = __$$LeadCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, @JsonKey(name: 'new') int newCount, int converted});
}

/// @nodoc
class __$$LeadCountsImplCopyWithImpl<$Res>
    extends _$LeadCountsCopyWithImpl<$Res, _$LeadCountsImpl>
    implements _$$LeadCountsImplCopyWith<$Res> {
  __$$LeadCountsImplCopyWithImpl(
    _$LeadCountsImpl _value,
    $Res Function(_$LeadCountsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? newCount = null,
    Object? converted = null,
  }) {
    return _then(
      _$LeadCountsImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        newCount: null == newCount
            ? _value.newCount
            : newCount // ignore: cast_nullable_to_non_nullable
                  as int,
        converted: null == converted
            ? _value.converted
            : converted // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadCountsImpl implements _LeadCounts {
  const _$LeadCountsImpl({
    this.total = 0,
    @JsonKey(name: 'new') this.newCount = 0,
    this.converted = 0,
  });

  factory _$LeadCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadCountsImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'new')
  final int newCount;
  @override
  @JsonKey()
  final int converted;

  @override
  String toString() {
    return 'LeadCounts(total: $total, newCount: $newCount, converted: $converted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadCountsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.newCount, newCount) ||
                other.newCount == newCount) &&
            (identical(other.converted, converted) ||
                other.converted == converted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, newCount, converted);

  /// Create a copy of LeadCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadCountsImplCopyWith<_$LeadCountsImpl> get copyWith =>
      __$$LeadCountsImplCopyWithImpl<_$LeadCountsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadCountsImplToJson(this);
  }
}

abstract class _LeadCounts implements LeadCounts {
  const factory _LeadCounts({
    final int total,
    @JsonKey(name: 'new') final int newCount,
    final int converted,
  }) = _$LeadCountsImpl;

  factory _LeadCounts.fromJson(Map<String, dynamic> json) =
      _$LeadCountsImpl.fromJson;

  @override
  int get total;
  @override
  @JsonKey(name: 'new')
  int get newCount;
  @override
  int get converted;

  /// Create a copy of LeadCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadCountsImplCopyWith<_$LeadCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpportunityCounts _$OpportunityCountsFromJson(Map<String, dynamic> json) {
  return _OpportunityCounts.fromJson(json);
}

/// @nodoc
mixin _$OpportunityCounts {
  int get total => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  int get won => throw _privateConstructorUsedError;
  int get lost => throw _privateConstructorUsedError;

  /// Serializes this OpportunityCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpportunityCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityCountsCopyWith<OpportunityCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityCountsCopyWith<$Res> {
  factory $OpportunityCountsCopyWith(
    OpportunityCounts value,
    $Res Function(OpportunityCounts) then,
  ) = _$OpportunityCountsCopyWithImpl<$Res, OpportunityCounts>;
  @useResult
  $Res call({int total, double value, int won, int lost});
}

/// @nodoc
class _$OpportunityCountsCopyWithImpl<$Res, $Val extends OpportunityCounts>
    implements $OpportunityCountsCopyWith<$Res> {
  _$OpportunityCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunityCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? value = null,
    Object? won = null,
    Object? lost = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            won: null == won
                ? _value.won
                : won // ignore: cast_nullable_to_non_nullable
                      as int,
            lost: null == lost
                ? _value.lost
                : lost // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpportunityCountsImplCopyWith<$Res>
    implements $OpportunityCountsCopyWith<$Res> {
  factory _$$OpportunityCountsImplCopyWith(
    _$OpportunityCountsImpl value,
    $Res Function(_$OpportunityCountsImpl) then,
  ) = __$$OpportunityCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, double value, int won, int lost});
}

/// @nodoc
class __$$OpportunityCountsImplCopyWithImpl<$Res>
    extends _$OpportunityCountsCopyWithImpl<$Res, _$OpportunityCountsImpl>
    implements _$$OpportunityCountsImplCopyWith<$Res> {
  __$$OpportunityCountsImplCopyWithImpl(
    _$OpportunityCountsImpl _value,
    $Res Function(_$OpportunityCountsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpportunityCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? value = null,
    Object? won = null,
    Object? lost = null,
  }) {
    return _then(
      _$OpportunityCountsImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        won: null == won
            ? _value.won
            : won // ignore: cast_nullable_to_non_nullable
                  as int,
        lost: null == lost
            ? _value.lost
            : lost // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpportunityCountsImpl implements _OpportunityCounts {
  const _$OpportunityCountsImpl({
    this.total = 0,
    this.value = 0,
    this.won = 0,
    this.lost = 0,
  });

  factory _$OpportunityCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpportunityCountsImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final double value;
  @override
  @JsonKey()
  final int won;
  @override
  @JsonKey()
  final int lost;

  @override
  String toString() {
    return 'OpportunityCounts(total: $total, value: $value, won: $won, lost: $lost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunityCountsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.won, won) || other.won == won) &&
            (identical(other.lost, lost) || other.lost == lost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, value, won, lost);

  /// Create a copy of OpportunityCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunityCountsImplCopyWith<_$OpportunityCountsImpl> get copyWith =>
      __$$OpportunityCountsImplCopyWithImpl<_$OpportunityCountsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpportunityCountsImplToJson(this);
  }
}

abstract class _OpportunityCounts implements OpportunityCounts {
  const factory _OpportunityCounts({
    final int total,
    final double value,
    final int won,
    final int lost,
  }) = _$OpportunityCountsImpl;

  factory _OpportunityCounts.fromJson(Map<String, dynamic> json) =
      _$OpportunityCountsImpl.fromJson;

  @override
  int get total;
  @override
  double get value;
  @override
  int get won;
  @override
  int get lost;

  /// Create a copy of OpportunityCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunityCountsImplCopyWith<_$OpportunityCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
