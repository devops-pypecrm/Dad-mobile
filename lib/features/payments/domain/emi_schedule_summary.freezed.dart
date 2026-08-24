// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emi_schedule_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmiScheduleSummary _$EmiScheduleSummaryFromJson(Map<String, dynamic> json) {
  return _EmiScheduleSummary.fromJson(json);
}

/// @nodoc
mixin _$EmiScheduleSummary {
  String get id => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get paidAmount => throw _privateConstructorUsedError;
  double get remainingAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  EmiOpportunityRef get opportunity => throw _privateConstructorUsedError;
  List<EmiInstallment> get installments => throw _privateConstructorUsedError;

  /// Serializes this EmiScheduleSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiScheduleSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiScheduleSummaryCopyWith<EmiScheduleSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiScheduleSummaryCopyWith<$Res> {
  factory $EmiScheduleSummaryCopyWith(
    EmiScheduleSummary value,
    $Res Function(EmiScheduleSummary) then,
  ) = _$EmiScheduleSummaryCopyWithImpl<$Res, EmiScheduleSummary>;
  @useResult
  $Res call({
    String id,
    double totalAmount,
    double paidAmount,
    double remainingAmount,
    String status,
    EmiOpportunityRef opportunity,
    List<EmiInstallment> installments,
  });

  $EmiOpportunityRefCopyWith<$Res> get opportunity;
}

/// @nodoc
class _$EmiScheduleSummaryCopyWithImpl<$Res, $Val extends EmiScheduleSummary>
    implements $EmiScheduleSummaryCopyWith<$Res> {
  _$EmiScheduleSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiScheduleSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? status = null,
    Object? opportunity = null,
    Object? installments = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            paidAmount: null == paidAmount
                ? _value.paidAmount
                : paidAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            remainingAmount: null == remainingAmount
                ? _value.remainingAmount
                : remainingAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            opportunity: null == opportunity
                ? _value.opportunity
                : opportunity // ignore: cast_nullable_to_non_nullable
                      as EmiOpportunityRef,
            installments: null == installments
                ? _value.installments
                : installments // ignore: cast_nullable_to_non_nullable
                      as List<EmiInstallment>,
          )
          as $Val,
    );
  }

  /// Create a copy of EmiScheduleSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmiOpportunityRefCopyWith<$Res> get opportunity {
    return $EmiOpportunityRefCopyWith<$Res>(_value.opportunity, (value) {
      return _then(_value.copyWith(opportunity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmiScheduleSummaryImplCopyWith<$Res>
    implements $EmiScheduleSummaryCopyWith<$Res> {
  factory _$$EmiScheduleSummaryImplCopyWith(
    _$EmiScheduleSummaryImpl value,
    $Res Function(_$EmiScheduleSummaryImpl) then,
  ) = __$$EmiScheduleSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double totalAmount,
    double paidAmount,
    double remainingAmount,
    String status,
    EmiOpportunityRef opportunity,
    List<EmiInstallment> installments,
  });

  @override
  $EmiOpportunityRefCopyWith<$Res> get opportunity;
}

/// @nodoc
class __$$EmiScheduleSummaryImplCopyWithImpl<$Res>
    extends _$EmiScheduleSummaryCopyWithImpl<$Res, _$EmiScheduleSummaryImpl>
    implements _$$EmiScheduleSummaryImplCopyWith<$Res> {
  __$$EmiScheduleSummaryImplCopyWithImpl(
    _$EmiScheduleSummaryImpl _value,
    $Res Function(_$EmiScheduleSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiScheduleSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? status = null,
    Object? opportunity = null,
    Object? installments = null,
  }) {
    return _then(
      _$EmiScheduleSummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        paidAmount: null == paidAmount
            ? _value.paidAmount
            : paidAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        remainingAmount: null == remainingAmount
            ? _value.remainingAmount
            : remainingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        opportunity: null == opportunity
            ? _value.opportunity
            : opportunity // ignore: cast_nullable_to_non_nullable
                  as EmiOpportunityRef,
        installments: null == installments
            ? _value._installments
            : installments // ignore: cast_nullable_to_non_nullable
                  as List<EmiInstallment>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmiScheduleSummaryImpl extends _EmiScheduleSummary {
  const _$EmiScheduleSummaryImpl({
    required this.id,
    required this.totalAmount,
    this.paidAmount = 0,
    required this.remainingAmount,
    this.status = 'active',
    required this.opportunity,
    final List<EmiInstallment> installments = const <EmiInstallment>[],
  }) : _installments = installments,
       super._();

  factory _$EmiScheduleSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiScheduleSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final double totalAmount;
  @override
  @JsonKey()
  final double paidAmount;
  @override
  final double remainingAmount;
  @override
  @JsonKey()
  final String status;
  @override
  final EmiOpportunityRef opportunity;
  final List<EmiInstallment> _installments;
  @override
  @JsonKey()
  List<EmiInstallment> get installments {
    if (_installments is EqualUnmodifiableListView) return _installments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_installments);
  }

  @override
  String toString() {
    return 'EmiScheduleSummary(id: $id, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, status: $status, opportunity: $opportunity, installments: $installments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiScheduleSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.opportunity, opportunity) ||
                other.opportunity == opportunity) &&
            const DeepCollectionEquality().equals(
              other._installments,
              _installments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    totalAmount,
    paidAmount,
    remainingAmount,
    status,
    opportunity,
    const DeepCollectionEquality().hash(_installments),
  );

  /// Create a copy of EmiScheduleSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiScheduleSummaryImplCopyWith<_$EmiScheduleSummaryImpl> get copyWith =>
      __$$EmiScheduleSummaryImplCopyWithImpl<_$EmiScheduleSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiScheduleSummaryImplToJson(this);
  }
}

abstract class _EmiScheduleSummary extends EmiScheduleSummary {
  const factory _EmiScheduleSummary({
    required final String id,
    required final double totalAmount,
    final double paidAmount,
    required final double remainingAmount,
    final String status,
    required final EmiOpportunityRef opportunity,
    final List<EmiInstallment> installments,
  }) = _$EmiScheduleSummaryImpl;
  const _EmiScheduleSummary._() : super._();

  factory _EmiScheduleSummary.fromJson(Map<String, dynamic> json) =
      _$EmiScheduleSummaryImpl.fromJson;

  @override
  String get id;
  @override
  double get totalAmount;
  @override
  double get paidAmount;
  @override
  double get remainingAmount;
  @override
  String get status;
  @override
  EmiOpportunityRef get opportunity;
  @override
  List<EmiInstallment> get installments;

  /// Create a copy of EmiScheduleSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiScheduleSummaryImplCopyWith<_$EmiScheduleSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmiOpportunityRef _$EmiOpportunityRefFromJson(Map<String, dynamic> json) {
  return _EmiOpportunityRef.fromJson(json);
}

/// @nodoc
mixin _$EmiOpportunityRef {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this EmiOpportunityRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiOpportunityRefCopyWith<EmiOpportunityRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiOpportunityRefCopyWith<$Res> {
  factory $EmiOpportunityRefCopyWith(
    EmiOpportunityRef value,
    $Res Function(EmiOpportunityRef) then,
  ) = _$EmiOpportunityRefCopyWithImpl<$Res, EmiOpportunityRef>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$EmiOpportunityRefCopyWithImpl<$Res, $Val extends EmiOpportunityRef>
    implements $EmiOpportunityRefCopyWith<$Res> {
  _$EmiOpportunityRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmiOpportunityRefImplCopyWith<$Res>
    implements $EmiOpportunityRefCopyWith<$Res> {
  factory _$$EmiOpportunityRefImplCopyWith(
    _$EmiOpportunityRefImpl value,
    $Res Function(_$EmiOpportunityRefImpl) then,
  ) = __$$EmiOpportunityRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$EmiOpportunityRefImplCopyWithImpl<$Res>
    extends _$EmiOpportunityRefCopyWithImpl<$Res, _$EmiOpportunityRefImpl>
    implements _$$EmiOpportunityRefImplCopyWith<$Res> {
  __$$EmiOpportunityRefImplCopyWithImpl(
    _$EmiOpportunityRefImpl _value,
    $Res Function(_$EmiOpportunityRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$EmiOpportunityRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmiOpportunityRefImpl implements _EmiOpportunityRef {
  const _$EmiOpportunityRefImpl({required this.id, required this.name});

  factory _$EmiOpportunityRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiOpportunityRefImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'EmiOpportunityRef(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiOpportunityRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of EmiOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiOpportunityRefImplCopyWith<_$EmiOpportunityRefImpl> get copyWith =>
      __$$EmiOpportunityRefImplCopyWithImpl<_$EmiOpportunityRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiOpportunityRefImplToJson(this);
  }
}

abstract class _EmiOpportunityRef implements EmiOpportunityRef {
  const factory _EmiOpportunityRef({
    required final String id,
    required final String name,
  }) = _$EmiOpportunityRefImpl;

  factory _EmiOpportunityRef.fromJson(Map<String, dynamic> json) =
      _$EmiOpportunityRefImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of EmiOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiOpportunityRefImplCopyWith<_$EmiOpportunityRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
