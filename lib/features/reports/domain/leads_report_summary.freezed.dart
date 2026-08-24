// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leads_report_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadsReportSummary _$LeadsReportSummaryFromJson(Map<String, dynamic> json) {
  return _LeadsReportSummary.fromJson(json);
}

/// @nodoc
mixin _$LeadsReportSummary {
  LeadsReportCounts get summary => throw _privateConstructorUsedError;

  /// Serializes this LeadsReportSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadsReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadsReportSummaryCopyWith<LeadsReportSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsReportSummaryCopyWith<$Res> {
  factory $LeadsReportSummaryCopyWith(
    LeadsReportSummary value,
    $Res Function(LeadsReportSummary) then,
  ) = _$LeadsReportSummaryCopyWithImpl<$Res, LeadsReportSummary>;
  @useResult
  $Res call({LeadsReportCounts summary});

  $LeadsReportCountsCopyWith<$Res> get summary;
}

/// @nodoc
class _$LeadsReportSummaryCopyWithImpl<$Res, $Val extends LeadsReportSummary>
    implements $LeadsReportSummaryCopyWith<$Res> {
  _$LeadsReportSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadsReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? summary = null}) {
    return _then(
      _value.copyWith(
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as LeadsReportCounts,
          )
          as $Val,
    );
  }

  /// Create a copy of LeadsReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadsReportCountsCopyWith<$Res> get summary {
    return $LeadsReportCountsCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadsReportSummaryImplCopyWith<$Res>
    implements $LeadsReportSummaryCopyWith<$Res> {
  factory _$$LeadsReportSummaryImplCopyWith(
    _$LeadsReportSummaryImpl value,
    $Res Function(_$LeadsReportSummaryImpl) then,
  ) = __$$LeadsReportSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LeadsReportCounts summary});

  @override
  $LeadsReportCountsCopyWith<$Res> get summary;
}

/// @nodoc
class __$$LeadsReportSummaryImplCopyWithImpl<$Res>
    extends _$LeadsReportSummaryCopyWithImpl<$Res, _$LeadsReportSummaryImpl>
    implements _$$LeadsReportSummaryImplCopyWith<$Res> {
  __$$LeadsReportSummaryImplCopyWithImpl(
    _$LeadsReportSummaryImpl _value,
    $Res Function(_$LeadsReportSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadsReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? summary = null}) {
    return _then(
      _$LeadsReportSummaryImpl(
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as LeadsReportCounts,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadsReportSummaryImpl implements _LeadsReportSummary {
  const _$LeadsReportSummaryImpl({required this.summary});

  factory _$LeadsReportSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadsReportSummaryImplFromJson(json);

  @override
  final LeadsReportCounts summary;

  @override
  String toString() {
    return 'LeadsReportSummary(summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadsReportSummaryImpl &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary);

  /// Create a copy of LeadsReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadsReportSummaryImplCopyWith<_$LeadsReportSummaryImpl> get copyWith =>
      __$$LeadsReportSummaryImplCopyWithImpl<_$LeadsReportSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadsReportSummaryImplToJson(this);
  }
}

abstract class _LeadsReportSummary implements LeadsReportSummary {
  const factory _LeadsReportSummary({
    required final LeadsReportCounts summary,
  }) = _$LeadsReportSummaryImpl;

  factory _LeadsReportSummary.fromJson(Map<String, dynamic> json) =
      _$LeadsReportSummaryImpl.fromJson;

  @override
  LeadsReportCounts get summary;

  /// Create a copy of LeadsReportSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadsReportSummaryImplCopyWith<_$LeadsReportSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadsReportCounts _$LeadsReportCountsFromJson(Map<String, dynamic> json) {
  return _LeadsReportCounts.fromJson(json);
}

/// @nodoc
mixin _$LeadsReportCounts {
  int get total => throw _privateConstructorUsedError;
  Map<String, int> get byStage => throw _privateConstructorUsedError;
  Map<String, int> get byStatus => throw _privateConstructorUsedError;

  /// Serializes this LeadsReportCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadsReportCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadsReportCountsCopyWith<LeadsReportCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsReportCountsCopyWith<$Res> {
  factory $LeadsReportCountsCopyWith(
    LeadsReportCounts value,
    $Res Function(LeadsReportCounts) then,
  ) = _$LeadsReportCountsCopyWithImpl<$Res, LeadsReportCounts>;
  @useResult
  $Res call({int total, Map<String, int> byStage, Map<String, int> byStatus});
}

/// @nodoc
class _$LeadsReportCountsCopyWithImpl<$Res, $Val extends LeadsReportCounts>
    implements $LeadsReportCountsCopyWith<$Res> {
  _$LeadsReportCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadsReportCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? byStage = null,
    Object? byStatus = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            byStage: null == byStage
                ? _value.byStage
                : byStage // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            byStatus: null == byStatus
                ? _value.byStatus
                : byStatus // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadsReportCountsImplCopyWith<$Res>
    implements $LeadsReportCountsCopyWith<$Res> {
  factory _$$LeadsReportCountsImplCopyWith(
    _$LeadsReportCountsImpl value,
    $Res Function(_$LeadsReportCountsImpl) then,
  ) = __$$LeadsReportCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, Map<String, int> byStage, Map<String, int> byStatus});
}

/// @nodoc
class __$$LeadsReportCountsImplCopyWithImpl<$Res>
    extends _$LeadsReportCountsCopyWithImpl<$Res, _$LeadsReportCountsImpl>
    implements _$$LeadsReportCountsImplCopyWith<$Res> {
  __$$LeadsReportCountsImplCopyWithImpl(
    _$LeadsReportCountsImpl _value,
    $Res Function(_$LeadsReportCountsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadsReportCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? byStage = null,
    Object? byStatus = null,
  }) {
    return _then(
      _$LeadsReportCountsImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        byStage: null == byStage
            ? _value._byStage
            : byStage // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        byStatus: null == byStatus
            ? _value._byStatus
            : byStatus // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadsReportCountsImpl implements _LeadsReportCounts {
  const _$LeadsReportCountsImpl({
    this.total = 0,
    final Map<String, int> byStage = const <String, int>{},
    final Map<String, int> byStatus = const <String, int>{},
  }) : _byStage = byStage,
       _byStatus = byStatus;

  factory _$LeadsReportCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadsReportCountsImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  final Map<String, int> _byStage;
  @override
  @JsonKey()
  Map<String, int> get byStage {
    if (_byStage is EqualUnmodifiableMapView) return _byStage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byStage);
  }

  final Map<String, int> _byStatus;
  @override
  @JsonKey()
  Map<String, int> get byStatus {
    if (_byStatus is EqualUnmodifiableMapView) return _byStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byStatus);
  }

  @override
  String toString() {
    return 'LeadsReportCounts(total: $total, byStage: $byStage, byStatus: $byStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadsReportCountsImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._byStage, _byStage) &&
            const DeepCollectionEquality().equals(other._byStatus, _byStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    const DeepCollectionEquality().hash(_byStage),
    const DeepCollectionEquality().hash(_byStatus),
  );

  /// Create a copy of LeadsReportCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadsReportCountsImplCopyWith<_$LeadsReportCountsImpl> get copyWith =>
      __$$LeadsReportCountsImplCopyWithImpl<_$LeadsReportCountsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadsReportCountsImplToJson(this);
  }
}

abstract class _LeadsReportCounts implements LeadsReportCounts {
  const factory _LeadsReportCounts({
    final int total,
    final Map<String, int> byStage,
    final Map<String, int> byStatus,
  }) = _$LeadsReportCountsImpl;

  factory _LeadsReportCounts.fromJson(Map<String, dynamic> json) =
      _$LeadsReportCountsImpl.fromJson;

  @override
  int get total;
  @override
  Map<String, int> get byStage;
  @override
  Map<String, int> get byStatus;

  /// Create a copy of LeadsReportCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadsReportCountsImplCopyWith<_$LeadsReportCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
