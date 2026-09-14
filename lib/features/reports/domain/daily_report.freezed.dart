// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyReport _$DailyReportFromJson(Map<String, dynamic> json) {
  return _DailyReport.fromJson(json);
}

/// @nodoc
mixin _$DailyReport {
  List<DailyReportRow> get table => throw _privateConstructorUsedError;
  DailyReportSummary? get summary => throw _privateConstructorUsedError;

  /// Serializes this DailyReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyReportCopyWith<DailyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReportCopyWith<$Res> {
  factory $DailyReportCopyWith(
    DailyReport value,
    $Res Function(DailyReport) then,
  ) = _$DailyReportCopyWithImpl<$Res, DailyReport>;
  @useResult
  $Res call({List<DailyReportRow> table, DailyReportSummary? summary});

  $DailyReportSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$DailyReportCopyWithImpl<$Res, $Val extends DailyReport>
    implements $DailyReportCopyWith<$Res> {
  _$DailyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? table = null, Object? summary = freezed}) {
    return _then(
      _value.copyWith(
            table: null == table
                ? _value.table
                : table // ignore: cast_nullable_to_non_nullable
                      as List<DailyReportRow>,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as DailyReportSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyReportSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $DailyReportSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyReportImplCopyWith<$Res>
    implements $DailyReportCopyWith<$Res> {
  factory _$$DailyReportImplCopyWith(
    _$DailyReportImpl value,
    $Res Function(_$DailyReportImpl) then,
  ) = __$$DailyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DailyReportRow> table, DailyReportSummary? summary});

  @override
  $DailyReportSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$DailyReportImplCopyWithImpl<$Res>
    extends _$DailyReportCopyWithImpl<$Res, _$DailyReportImpl>
    implements _$$DailyReportImplCopyWith<$Res> {
  __$$DailyReportImplCopyWithImpl(
    _$DailyReportImpl _value,
    $Res Function(_$DailyReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? table = null, Object? summary = freezed}) {
    return _then(
      _$DailyReportImpl(
        table: null == table
            ? _value._table
            : table // ignore: cast_nullable_to_non_nullable
                  as List<DailyReportRow>,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as DailyReportSummary?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyReportImpl implements _DailyReport {
  const _$DailyReportImpl({
    final List<DailyReportRow> table = const <DailyReportRow>[],
    this.summary,
  }) : _table = table;

  factory _$DailyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyReportImplFromJson(json);

  final List<DailyReportRow> _table;
  @override
  @JsonKey()
  List<DailyReportRow> get table {
    if (_table is EqualUnmodifiableListView) return _table;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_table);
  }

  @override
  final DailyReportSummary? summary;

  @override
  String toString() {
    return 'DailyReport(table: $table, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReportImpl &&
            const DeepCollectionEquality().equals(other._table, _table) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_table),
    summary,
  );

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReportImplCopyWith<_$DailyReportImpl> get copyWith =>
      __$$DailyReportImplCopyWithImpl<_$DailyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyReportImplToJson(this);
  }
}

abstract class _DailyReport implements DailyReport {
  const factory _DailyReport({
    final List<DailyReportRow> table,
    final DailyReportSummary? summary,
  }) = _$DailyReportImpl;

  factory _DailyReport.fromJson(Map<String, dynamic> json) =
      _$DailyReportImpl.fromJson;

  @override
  List<DailyReportRow> get table;
  @override
  DailyReportSummary? get summary;

  /// Create a copy of DailyReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyReportImplCopyWith<_$DailyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyReportRow _$DailyReportRowFromJson(Map<String, dynamic> json) {
  return _DailyReportRow.fromJson(json);
}

/// @nodoc
mixin _$DailyReportRow {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get branch => throw _privateConstructorUsedError;
  int get totalCalls => throw _privateConstructorUsedError;
  int get totalConnected => throw _privateConstructorUsedError;
  int get totalUnconnected => throw _privateConstructorUsedError;
  int get totalConverted => throw _privateConstructorUsedError;
  int get totalLost => throw _privateConstructorUsedError;

  /// Serializes this DailyReportRow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyReportRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyReportRowCopyWith<DailyReportRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReportRowCopyWith<$Res> {
  factory $DailyReportRowCopyWith(
    DailyReportRow value,
    $Res Function(DailyReportRow) then,
  ) = _$DailyReportRowCopyWithImpl<$Res, DailyReportRow>;
  @useResult
  $Res call({
    String id,
    String userName,
    String? branch,
    int totalCalls,
    int totalConnected,
    int totalUnconnected,
    int totalConverted,
    int totalLost,
  });
}

/// @nodoc
class _$DailyReportRowCopyWithImpl<$Res, $Val extends DailyReportRow>
    implements $DailyReportRowCopyWith<$Res> {
  _$DailyReportRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyReportRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? branch = freezed,
    Object? totalCalls = null,
    Object? totalConnected = null,
    Object? totalUnconnected = null,
    Object? totalConverted = null,
    Object? totalLost = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userName: null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String,
            branch: freezed == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalCalls: null == totalCalls
                ? _value.totalCalls
                : totalCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            totalConnected: null == totalConnected
                ? _value.totalConnected
                : totalConnected // ignore: cast_nullable_to_non_nullable
                      as int,
            totalUnconnected: null == totalUnconnected
                ? _value.totalUnconnected
                : totalUnconnected // ignore: cast_nullable_to_non_nullable
                      as int,
            totalConverted: null == totalConverted
                ? _value.totalConverted
                : totalConverted // ignore: cast_nullable_to_non_nullable
                      as int,
            totalLost: null == totalLost
                ? _value.totalLost
                : totalLost // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyReportRowImplCopyWith<$Res>
    implements $DailyReportRowCopyWith<$Res> {
  factory _$$DailyReportRowImplCopyWith(
    _$DailyReportRowImpl value,
    $Res Function(_$DailyReportRowImpl) then,
  ) = __$$DailyReportRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userName,
    String? branch,
    int totalCalls,
    int totalConnected,
    int totalUnconnected,
    int totalConverted,
    int totalLost,
  });
}

/// @nodoc
class __$$DailyReportRowImplCopyWithImpl<$Res>
    extends _$DailyReportRowCopyWithImpl<$Res, _$DailyReportRowImpl>
    implements _$$DailyReportRowImplCopyWith<$Res> {
  __$$DailyReportRowImplCopyWithImpl(
    _$DailyReportRowImpl _value,
    $Res Function(_$DailyReportRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyReportRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? branch = freezed,
    Object? totalCalls = null,
    Object? totalConnected = null,
    Object? totalUnconnected = null,
    Object? totalConverted = null,
    Object? totalLost = null,
  }) {
    return _then(
      _$DailyReportRowImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        branch: freezed == branch
            ? _value.branch
            : branch // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalCalls: null == totalCalls
            ? _value.totalCalls
            : totalCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        totalConnected: null == totalConnected
            ? _value.totalConnected
            : totalConnected // ignore: cast_nullable_to_non_nullable
                  as int,
        totalUnconnected: null == totalUnconnected
            ? _value.totalUnconnected
            : totalUnconnected // ignore: cast_nullable_to_non_nullable
                  as int,
        totalConverted: null == totalConverted
            ? _value.totalConverted
            : totalConverted // ignore: cast_nullable_to_non_nullable
                  as int,
        totalLost: null == totalLost
            ? _value.totalLost
            : totalLost // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyReportRowImpl implements _DailyReportRow {
  const _$DailyReportRowImpl({
    required this.id,
    required this.userName,
    this.branch,
    this.totalCalls = 0,
    this.totalConnected = 0,
    this.totalUnconnected = 0,
    this.totalConverted = 0,
    this.totalLost = 0,
  });

  factory _$DailyReportRowImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyReportRowImplFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String? branch;
  @override
  @JsonKey()
  final int totalCalls;
  @override
  @JsonKey()
  final int totalConnected;
  @override
  @JsonKey()
  final int totalUnconnected;
  @override
  @JsonKey()
  final int totalConverted;
  @override
  @JsonKey()
  final int totalLost;

  @override
  String toString() {
    return 'DailyReportRow(id: $id, userName: $userName, branch: $branch, totalCalls: $totalCalls, totalConnected: $totalConnected, totalUnconnected: $totalUnconnected, totalConverted: $totalConverted, totalLost: $totalLost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReportRowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.totalCalls, totalCalls) ||
                other.totalCalls == totalCalls) &&
            (identical(other.totalConnected, totalConnected) ||
                other.totalConnected == totalConnected) &&
            (identical(other.totalUnconnected, totalUnconnected) ||
                other.totalUnconnected == totalUnconnected) &&
            (identical(other.totalConverted, totalConverted) ||
                other.totalConverted == totalConverted) &&
            (identical(other.totalLost, totalLost) ||
                other.totalLost == totalLost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userName,
    branch,
    totalCalls,
    totalConnected,
    totalUnconnected,
    totalConverted,
    totalLost,
  );

  /// Create a copy of DailyReportRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReportRowImplCopyWith<_$DailyReportRowImpl> get copyWith =>
      __$$DailyReportRowImplCopyWithImpl<_$DailyReportRowImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyReportRowImplToJson(this);
  }
}

abstract class _DailyReportRow implements DailyReportRow {
  const factory _DailyReportRow({
    required final String id,
    required final String userName,
    final String? branch,
    final int totalCalls,
    final int totalConnected,
    final int totalUnconnected,
    final int totalConverted,
    final int totalLost,
  }) = _$DailyReportRowImpl;

  factory _DailyReportRow.fromJson(Map<String, dynamic> json) =
      _$DailyReportRowImpl.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String? get branch;
  @override
  int get totalCalls;
  @override
  int get totalConnected;
  @override
  int get totalUnconnected;
  @override
  int get totalConverted;
  @override
  int get totalLost;

  /// Create a copy of DailyReportRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyReportRowImplCopyWith<_$DailyReportRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyReportSummary _$DailyReportSummaryFromJson(Map<String, dynamic> json) {
  return _DailyReportSummary.fromJson(json);
}

/// @nodoc
mixin _$DailyReportSummary {
  int get totalCalls => throw _privateConstructorUsedError;
  int get incoming => throw _privateConstructorUsedError;
  int get outgoing => throw _privateConstructorUsedError;
  int get missed => throw _privateConstructorUsedError;
  int get rejected => throw _privateConstructorUsedError;
  int get neverAttended => throw _privateConstructorUsedError;
  int get notPickedUp => throw _privateConstructorUsedError;
  int get unique => throw _privateConstructorUsedError;
  int get totalDuration => throw _privateConstructorUsedError;
  int get incomingDuration => throw _privateConstructorUsedError;
  int get outgoingDuration => throw _privateConstructorUsedError;

  /// Serializes this DailyReportSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyReportSummaryCopyWith<DailyReportSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReportSummaryCopyWith<$Res> {
  factory $DailyReportSummaryCopyWith(
    DailyReportSummary value,
    $Res Function(DailyReportSummary) then,
  ) = _$DailyReportSummaryCopyWithImpl<$Res, DailyReportSummary>;
  @useResult
  $Res call({
    int totalCalls,
    int incoming,
    int outgoing,
    int missed,
    int rejected,
    int neverAttended,
    int notPickedUp,
    int unique,
    int totalDuration,
    int incomingDuration,
    int outgoingDuration,
  });
}

/// @nodoc
class _$DailyReportSummaryCopyWithImpl<$Res, $Val extends DailyReportSummary>
    implements $DailyReportSummaryCopyWith<$Res> {
  _$DailyReportSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCalls = null,
    Object? incoming = null,
    Object? outgoing = null,
    Object? missed = null,
    Object? rejected = null,
    Object? neverAttended = null,
    Object? notPickedUp = null,
    Object? unique = null,
    Object? totalDuration = null,
    Object? incomingDuration = null,
    Object? outgoingDuration = null,
  }) {
    return _then(
      _value.copyWith(
            totalCalls: null == totalCalls
                ? _value.totalCalls
                : totalCalls // ignore: cast_nullable_to_non_nullable
                      as int,
            incoming: null == incoming
                ? _value.incoming
                : incoming // ignore: cast_nullable_to_non_nullable
                      as int,
            outgoing: null == outgoing
                ? _value.outgoing
                : outgoing // ignore: cast_nullable_to_non_nullable
                      as int,
            missed: null == missed
                ? _value.missed
                : missed // ignore: cast_nullable_to_non_nullable
                      as int,
            rejected: null == rejected
                ? _value.rejected
                : rejected // ignore: cast_nullable_to_non_nullable
                      as int,
            neverAttended: null == neverAttended
                ? _value.neverAttended
                : neverAttended // ignore: cast_nullable_to_non_nullable
                      as int,
            notPickedUp: null == notPickedUp
                ? _value.notPickedUp
                : notPickedUp // ignore: cast_nullable_to_non_nullable
                      as int,
            unique: null == unique
                ? _value.unique
                : unique // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDuration: null == totalDuration
                ? _value.totalDuration
                : totalDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            incomingDuration: null == incomingDuration
                ? _value.incomingDuration
                : incomingDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            outgoingDuration: null == outgoingDuration
                ? _value.outgoingDuration
                : outgoingDuration // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyReportSummaryImplCopyWith<$Res>
    implements $DailyReportSummaryCopyWith<$Res> {
  factory _$$DailyReportSummaryImplCopyWith(
    _$DailyReportSummaryImpl value,
    $Res Function(_$DailyReportSummaryImpl) then,
  ) = __$$DailyReportSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalCalls,
    int incoming,
    int outgoing,
    int missed,
    int rejected,
    int neverAttended,
    int notPickedUp,
    int unique,
    int totalDuration,
    int incomingDuration,
    int outgoingDuration,
  });
}

/// @nodoc
class __$$DailyReportSummaryImplCopyWithImpl<$Res>
    extends _$DailyReportSummaryCopyWithImpl<$Res, _$DailyReportSummaryImpl>
    implements _$$DailyReportSummaryImplCopyWith<$Res> {
  __$$DailyReportSummaryImplCopyWithImpl(
    _$DailyReportSummaryImpl _value,
    $Res Function(_$DailyReportSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCalls = null,
    Object? incoming = null,
    Object? outgoing = null,
    Object? missed = null,
    Object? rejected = null,
    Object? neverAttended = null,
    Object? notPickedUp = null,
    Object? unique = null,
    Object? totalDuration = null,
    Object? incomingDuration = null,
    Object? outgoingDuration = null,
  }) {
    return _then(
      _$DailyReportSummaryImpl(
        totalCalls: null == totalCalls
            ? _value.totalCalls
            : totalCalls // ignore: cast_nullable_to_non_nullable
                  as int,
        incoming: null == incoming
            ? _value.incoming
            : incoming // ignore: cast_nullable_to_non_nullable
                  as int,
        outgoing: null == outgoing
            ? _value.outgoing
            : outgoing // ignore: cast_nullable_to_non_nullable
                  as int,
        missed: null == missed
            ? _value.missed
            : missed // ignore: cast_nullable_to_non_nullable
                  as int,
        rejected: null == rejected
            ? _value.rejected
            : rejected // ignore: cast_nullable_to_non_nullable
                  as int,
        neverAttended: null == neverAttended
            ? _value.neverAttended
            : neverAttended // ignore: cast_nullable_to_non_nullable
                  as int,
        notPickedUp: null == notPickedUp
            ? _value.notPickedUp
            : notPickedUp // ignore: cast_nullable_to_non_nullable
                  as int,
        unique: null == unique
            ? _value.unique
            : unique // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDuration: null == totalDuration
            ? _value.totalDuration
            : totalDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        incomingDuration: null == incomingDuration
            ? _value.incomingDuration
            : incomingDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        outgoingDuration: null == outgoingDuration
            ? _value.outgoingDuration
            : outgoingDuration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyReportSummaryImpl implements _DailyReportSummary {
  const _$DailyReportSummaryImpl({
    this.totalCalls = 0,
    this.incoming = 0,
    this.outgoing = 0,
    this.missed = 0,
    this.rejected = 0,
    this.neverAttended = 0,
    this.notPickedUp = 0,
    this.unique = 0,
    this.totalDuration = 0,
    this.incomingDuration = 0,
    this.outgoingDuration = 0,
  });

  factory _$DailyReportSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyReportSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalCalls;
  @override
  @JsonKey()
  final int incoming;
  @override
  @JsonKey()
  final int outgoing;
  @override
  @JsonKey()
  final int missed;
  @override
  @JsonKey()
  final int rejected;
  @override
  @JsonKey()
  final int neverAttended;
  @override
  @JsonKey()
  final int notPickedUp;
  @override
  @JsonKey()
  final int unique;
  @override
  @JsonKey()
  final int totalDuration;
  @override
  @JsonKey()
  final int incomingDuration;
  @override
  @JsonKey()
  final int outgoingDuration;

  @override
  String toString() {
    return 'DailyReportSummary(totalCalls: $totalCalls, incoming: $incoming, outgoing: $outgoing, missed: $missed, rejected: $rejected, neverAttended: $neverAttended, notPickedUp: $notPickedUp, unique: $unique, totalDuration: $totalDuration, incomingDuration: $incomingDuration, outgoingDuration: $outgoingDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReportSummaryImpl &&
            (identical(other.totalCalls, totalCalls) ||
                other.totalCalls == totalCalls) &&
            (identical(other.incoming, incoming) ||
                other.incoming == incoming) &&
            (identical(other.outgoing, outgoing) ||
                other.outgoing == outgoing) &&
            (identical(other.missed, missed) || other.missed == missed) &&
            (identical(other.rejected, rejected) ||
                other.rejected == rejected) &&
            (identical(other.neverAttended, neverAttended) ||
                other.neverAttended == neverAttended) &&
            (identical(other.notPickedUp, notPickedUp) ||
                other.notPickedUp == notPickedUp) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.incomingDuration, incomingDuration) ||
                other.incomingDuration == incomingDuration) &&
            (identical(other.outgoingDuration, outgoingDuration) ||
                other.outgoingDuration == outgoingDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalCalls,
    incoming,
    outgoing,
    missed,
    rejected,
    neverAttended,
    notPickedUp,
    unique,
    totalDuration,
    incomingDuration,
    outgoingDuration,
  );

  /// Create a copy of DailyReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReportSummaryImplCopyWith<_$DailyReportSummaryImpl> get copyWith =>
      __$$DailyReportSummaryImplCopyWithImpl<_$DailyReportSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyReportSummaryImplToJson(this);
  }
}

abstract class _DailyReportSummary implements DailyReportSummary {
  const factory _DailyReportSummary({
    final int totalCalls,
    final int incoming,
    final int outgoing,
    final int missed,
    final int rejected,
    final int neverAttended,
    final int notPickedUp,
    final int unique,
    final int totalDuration,
    final int incomingDuration,
    final int outgoingDuration,
  }) = _$DailyReportSummaryImpl;

  factory _DailyReportSummary.fromJson(Map<String, dynamic> json) =
      _$DailyReportSummaryImpl.fromJson;

  @override
  int get totalCalls;
  @override
  int get incoming;
  @override
  int get outgoing;
  @override
  int get missed;
  @override
  int get rejected;
  @override
  int get neverAttended;
  @override
  int get notPickedUp;
  @override
  int get unique;
  @override
  int get totalDuration;
  @override
  int get incomingDuration;
  @override
  int get outgoingDuration;

  /// Create a copy of DailyReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyReportSummaryImplCopyWith<_$DailyReportSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
