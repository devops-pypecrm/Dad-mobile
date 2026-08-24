// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity_payments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmiSchedule _$EmiScheduleFromJson(Map<String, dynamic> json) {
  return _EmiSchedule.fromJson(json);
}

/// @nodoc
mixin _$EmiSchedule {
  String get id => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get paidAmount => throw _privateConstructorUsedError;
  double get remainingAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<EmiInstallment> get installments => throw _privateConstructorUsedError;

  /// Serializes this EmiSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiScheduleCopyWith<EmiSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiScheduleCopyWith<$Res> {
  factory $EmiScheduleCopyWith(
    EmiSchedule value,
    $Res Function(EmiSchedule) then,
  ) = _$EmiScheduleCopyWithImpl<$Res, EmiSchedule>;
  @useResult
  $Res call({
    String id,
    double totalAmount,
    double paidAmount,
    double remainingAmount,
    String status,
    List<EmiInstallment> installments,
  });
}

/// @nodoc
class _$EmiScheduleCopyWithImpl<$Res, $Val extends EmiSchedule>
    implements $EmiScheduleCopyWith<$Res> {
  _$EmiScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? status = null,
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
            installments: null == installments
                ? _value.installments
                : installments // ignore: cast_nullable_to_non_nullable
                      as List<EmiInstallment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmiScheduleImplCopyWith<$Res>
    implements $EmiScheduleCopyWith<$Res> {
  factory _$$EmiScheduleImplCopyWith(
    _$EmiScheduleImpl value,
    $Res Function(_$EmiScheduleImpl) then,
  ) = __$$EmiScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double totalAmount,
    double paidAmount,
    double remainingAmount,
    String status,
    List<EmiInstallment> installments,
  });
}

/// @nodoc
class __$$EmiScheduleImplCopyWithImpl<$Res>
    extends _$EmiScheduleCopyWithImpl<$Res, _$EmiScheduleImpl>
    implements _$$EmiScheduleImplCopyWith<$Res> {
  __$$EmiScheduleImplCopyWithImpl(
    _$EmiScheduleImpl _value,
    $Res Function(_$EmiScheduleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? status = null,
    Object? installments = null,
  }) {
    return _then(
      _$EmiScheduleImpl(
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
class _$EmiScheduleImpl implements _EmiSchedule {
  const _$EmiScheduleImpl({
    required this.id,
    this.totalAmount = 0,
    this.paidAmount = 0,
    this.remainingAmount = 0,
    this.status = 'active',
    final List<EmiInstallment> installments = const <EmiInstallment>[],
  }) : _installments = installments;

  factory _$EmiScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiScheduleImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  @JsonKey()
  final double paidAmount;
  @override
  @JsonKey()
  final double remainingAmount;
  @override
  @JsonKey()
  final String status;
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
    return 'EmiSchedule(id: $id, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, status: $status, installments: $installments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.status, status) || other.status == status) &&
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
    const DeepCollectionEquality().hash(_installments),
  );

  /// Create a copy of EmiSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiScheduleImplCopyWith<_$EmiScheduleImpl> get copyWith =>
      __$$EmiScheduleImplCopyWithImpl<_$EmiScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiScheduleImplToJson(this);
  }
}

abstract class _EmiSchedule implements EmiSchedule {
  const factory _EmiSchedule({
    required final String id,
    final double totalAmount,
    final double paidAmount,
    final double remainingAmount,
    final String status,
    final List<EmiInstallment> installments,
  }) = _$EmiScheduleImpl;

  factory _EmiSchedule.fromJson(Map<String, dynamic> json) =
      _$EmiScheduleImpl.fromJson;

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
  List<EmiInstallment> get installments;

  /// Create a copy of EmiSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiScheduleImplCopyWith<_$EmiScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmiInstallment _$EmiInstallmentFromJson(Map<String, dynamic> json) {
  return _EmiInstallment.fromJson(json);
}

/// @nodoc
mixin _$EmiInstallment {
  String get id => throw _privateConstructorUsedError;
  int get installmentNumber => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get paidAmount => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get paidDate => throw _privateConstructorUsedError;

  /// Serializes this EmiInstallment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiInstallment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiInstallmentCopyWith<EmiInstallment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiInstallmentCopyWith<$Res> {
  factory $EmiInstallmentCopyWith(
    EmiInstallment value,
    $Res Function(EmiInstallment) then,
  ) = _$EmiInstallmentCopyWithImpl<$Res, EmiInstallment>;
  @useResult
  $Res call({
    String id,
    int installmentNumber,
    double amount,
    double paidAmount,
    DateTime dueDate,
    String status,
    DateTime? paidDate,
  });
}

/// @nodoc
class _$EmiInstallmentCopyWithImpl<$Res, $Val extends EmiInstallment>
    implements $EmiInstallmentCopyWith<$Res> {
  _$EmiInstallmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiInstallment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? installmentNumber = null,
    Object? amount = null,
    Object? paidAmount = null,
    Object? dueDate = null,
    Object? status = null,
    Object? paidDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            installmentNumber: null == installmentNumber
                ? _value.installmentNumber
                : installmentNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            paidAmount: null == paidAmount
                ? _value.paidAmount
                : paidAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            dueDate: null == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            paidDate: freezed == paidDate
                ? _value.paidDate
                : paidDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmiInstallmentImplCopyWith<$Res>
    implements $EmiInstallmentCopyWith<$Res> {
  factory _$$EmiInstallmentImplCopyWith(
    _$EmiInstallmentImpl value,
    $Res Function(_$EmiInstallmentImpl) then,
  ) = __$$EmiInstallmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int installmentNumber,
    double amount,
    double paidAmount,
    DateTime dueDate,
    String status,
    DateTime? paidDate,
  });
}

/// @nodoc
class __$$EmiInstallmentImplCopyWithImpl<$Res>
    extends _$EmiInstallmentCopyWithImpl<$Res, _$EmiInstallmentImpl>
    implements _$$EmiInstallmentImplCopyWith<$Res> {
  __$$EmiInstallmentImplCopyWithImpl(
    _$EmiInstallmentImpl _value,
    $Res Function(_$EmiInstallmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiInstallment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? installmentNumber = null,
    Object? amount = null,
    Object? paidAmount = null,
    Object? dueDate = null,
    Object? status = null,
    Object? paidDate = freezed,
  }) {
    return _then(
      _$EmiInstallmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        installmentNumber: null == installmentNumber
            ? _value.installmentNumber
            : installmentNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        paidAmount: null == paidAmount
            ? _value.paidAmount
            : paidAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        dueDate: null == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        paidDate: freezed == paidDate
            ? _value.paidDate
            : paidDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmiInstallmentImpl implements _EmiInstallment {
  const _$EmiInstallmentImpl({
    required this.id,
    required this.installmentNumber,
    required this.amount,
    this.paidAmount = 0,
    required this.dueDate,
    this.status = 'pending',
    this.paidDate,
  });

  factory _$EmiInstallmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiInstallmentImplFromJson(json);

  @override
  final String id;
  @override
  final int installmentNumber;
  @override
  final double amount;
  @override
  @JsonKey()
  final double paidAmount;
  @override
  final DateTime dueDate;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? paidDate;

  @override
  String toString() {
    return 'EmiInstallment(id: $id, installmentNumber: $installmentNumber, amount: $amount, paidAmount: $paidAmount, dueDate: $dueDate, status: $status, paidDate: $paidDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiInstallmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.installmentNumber, installmentNumber) ||
                other.installmentNumber == installmentNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidDate, paidDate) ||
                other.paidDate == paidDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    installmentNumber,
    amount,
    paidAmount,
    dueDate,
    status,
    paidDate,
  );

  /// Create a copy of EmiInstallment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiInstallmentImplCopyWith<_$EmiInstallmentImpl> get copyWith =>
      __$$EmiInstallmentImplCopyWithImpl<_$EmiInstallmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiInstallmentImplToJson(this);
  }
}

abstract class _EmiInstallment implements EmiInstallment {
  const factory _EmiInstallment({
    required final String id,
    required final int installmentNumber,
    required final double amount,
    final double paidAmount,
    required final DateTime dueDate,
    final String status,
    final DateTime? paidDate,
  }) = _$EmiInstallmentImpl;

  factory _EmiInstallment.fromJson(Map<String, dynamic> json) =
      _$EmiInstallmentImpl.fromJson;

  @override
  String get id;
  @override
  int get installmentNumber;
  @override
  double get amount;
  @override
  double get paidAmount;
  @override
  DateTime get dueDate;
  @override
  String get status;
  @override
  DateTime? get paidDate;

  /// Create a copy of EmiInstallment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiInstallmentImplCopyWith<_$EmiInstallmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentRecord _$PaymentRecordFromJson(Map<String, dynamic> json) {
  return _PaymentRecord.fromJson(json);
}

/// @nodoc
mixin _$PaymentRecord {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get paymentDate => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this PaymentRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRecordCopyWith<PaymentRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRecordCopyWith<$Res> {
  factory $PaymentRecordCopyWith(
    PaymentRecord value,
    $Res Function(PaymentRecord) then,
  ) = _$PaymentRecordCopyWithImpl<$Res, PaymentRecord>;
  @useResult
  $Res call({
    String id,
    double amount,
    DateTime paymentDate,
    String? paymentMethod,
    String paymentType,
    String? notes,
  });
}

/// @nodoc
class _$PaymentRecordCopyWithImpl<$Res, $Val extends PaymentRecord>
    implements $PaymentRecordCopyWith<$Res> {
  _$PaymentRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? paymentDate = null,
    Object? paymentMethod = freezed,
    Object? paymentType = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            paymentDate: null == paymentDate
                ? _value.paymentDate
                : paymentDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentType: null == paymentType
                ? _value.paymentType
                : paymentType // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentRecordImplCopyWith<$Res>
    implements $PaymentRecordCopyWith<$Res> {
  factory _$$PaymentRecordImplCopyWith(
    _$PaymentRecordImpl value,
    $Res Function(_$PaymentRecordImpl) then,
  ) = __$$PaymentRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    double amount,
    DateTime paymentDate,
    String? paymentMethod,
    String paymentType,
    String? notes,
  });
}

/// @nodoc
class __$$PaymentRecordImplCopyWithImpl<$Res>
    extends _$PaymentRecordCopyWithImpl<$Res, _$PaymentRecordImpl>
    implements _$$PaymentRecordImplCopyWith<$Res> {
  __$$PaymentRecordImplCopyWithImpl(
    _$PaymentRecordImpl _value,
    $Res Function(_$PaymentRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? paymentDate = null,
    Object? paymentMethod = freezed,
    Object? paymentType = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$PaymentRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        paymentDate: null == paymentDate
            ? _value.paymentDate
            : paymentDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentType: null == paymentType
            ? _value.paymentType
            : paymentType // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentRecordImpl implements _PaymentRecord {
  const _$PaymentRecordImpl({
    required this.id,
    required this.amount,
    required this.paymentDate,
    this.paymentMethod,
    this.paymentType = 'full',
    this.notes,
  });

  factory _$PaymentRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRecordImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final DateTime paymentDate;
  @override
  final String? paymentMethod;
  @override
  @JsonKey()
  final String paymentType;
  @override
  final String? notes;

  @override
  String toString() {
    return 'PaymentRecord(id: $id, amount: $amount, paymentDate: $paymentDate, paymentMethod: $paymentMethod, paymentType: $paymentType, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    amount,
    paymentDate,
    paymentMethod,
    paymentType,
    notes,
  );

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRecordImplCopyWith<_$PaymentRecordImpl> get copyWith =>
      __$$PaymentRecordImplCopyWithImpl<_$PaymentRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRecordImplToJson(this);
  }
}

abstract class _PaymentRecord implements PaymentRecord {
  const factory _PaymentRecord({
    required final String id,
    required final double amount,
    required final DateTime paymentDate,
    final String? paymentMethod,
    final String paymentType,
    final String? notes,
  }) = _$PaymentRecordImpl;

  factory _PaymentRecord.fromJson(Map<String, dynamic> json) =
      _$PaymentRecordImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  DateTime get paymentDate;
  @override
  String? get paymentMethod;
  @override
  String get paymentType;
  @override
  String? get notes;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRecordImplCopyWith<_$PaymentRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
