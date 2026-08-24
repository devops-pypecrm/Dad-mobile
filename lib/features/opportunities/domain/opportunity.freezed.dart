// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Opportunity _$OpportunityFromJson(Map<String, dynamic> json) {
  return _Opportunity.fromJson(json);
}

/// @nodoc
mixin _$Opportunity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;
  DateTime? get closeDate => throw _privateConstructorUsedError;
  String? get leadSource => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  AccountRef? get account => throw _privateConstructorUsedError;
  OwnerRef? get owner => throw _privateConstructorUsedError;
  List<ContactRef> get contacts => throw _privateConstructorUsedError;
  EmiSchedule? get emiSchedule => throw _privateConstructorUsedError;
  List<PaymentRecord> get paymentRecords => throw _privateConstructorUsedError;

  /// Serializes this Opportunity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityCopyWith<Opportunity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityCopyWith<$Res> {
  factory $OpportunityCopyWith(
    Opportunity value,
    $Res Function(Opportunity) then,
  ) = _$OpportunityCopyWithImpl<$Res, Opportunity>;
  @useResult
  $Res call({
    String id,
    String name,
    double amount,
    String stage,
    double probability,
    DateTime? closeDate,
    String? leadSource,
    String? description,
    String paymentStatus,
    String type,
    String? accountId,
    AccountRef? account,
    OwnerRef? owner,
    List<ContactRef> contacts,
    EmiSchedule? emiSchedule,
    List<PaymentRecord> paymentRecords,
  });

  $AccountRefCopyWith<$Res>? get account;
  $OwnerRefCopyWith<$Res>? get owner;
  $EmiScheduleCopyWith<$Res>? get emiSchedule;
}

/// @nodoc
class _$OpportunityCopyWithImpl<$Res, $Val extends Opportunity>
    implements $OpportunityCopyWith<$Res> {
  _$OpportunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? stage = null,
    Object? probability = null,
    Object? closeDate = freezed,
    Object? leadSource = freezed,
    Object? description = freezed,
    Object? paymentStatus = null,
    Object? type = null,
    Object? accountId = freezed,
    Object? account = freezed,
    Object? owner = freezed,
    Object? contacts = null,
    Object? emiSchedule = freezed,
    Object? paymentRecords = null,
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
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as String,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
            closeDate: freezed == closeDate
                ? _value.closeDate
                : closeDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            leadSource: freezed == leadSource
                ? _value.leadSource
                : leadSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentStatus: null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            accountId: freezed == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as String?,
            account: freezed == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                      as AccountRef?,
            owner: freezed == owner
                ? _value.owner
                : owner // ignore: cast_nullable_to_non_nullable
                      as OwnerRef?,
            contacts: null == contacts
                ? _value.contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                      as List<ContactRef>,
            emiSchedule: freezed == emiSchedule
                ? _value.emiSchedule
                : emiSchedule // ignore: cast_nullable_to_non_nullable
                      as EmiSchedule?,
            paymentRecords: null == paymentRecords
                ? _value.paymentRecords
                : paymentRecords // ignore: cast_nullable_to_non_nullable
                      as List<PaymentRecord>,
          )
          as $Val,
    );
  }

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountRefCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountRefCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerRefCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerRefCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmiScheduleCopyWith<$Res>? get emiSchedule {
    if (_value.emiSchedule == null) {
      return null;
    }

    return $EmiScheduleCopyWith<$Res>(_value.emiSchedule!, (value) {
      return _then(_value.copyWith(emiSchedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpportunityImplCopyWith<$Res>
    implements $OpportunityCopyWith<$Res> {
  factory _$$OpportunityImplCopyWith(
    _$OpportunityImpl value,
    $Res Function(_$OpportunityImpl) then,
  ) = __$$OpportunityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    double amount,
    String stage,
    double probability,
    DateTime? closeDate,
    String? leadSource,
    String? description,
    String paymentStatus,
    String type,
    String? accountId,
    AccountRef? account,
    OwnerRef? owner,
    List<ContactRef> contacts,
    EmiSchedule? emiSchedule,
    List<PaymentRecord> paymentRecords,
  });

  @override
  $AccountRefCopyWith<$Res>? get account;
  @override
  $OwnerRefCopyWith<$Res>? get owner;
  @override
  $EmiScheduleCopyWith<$Res>? get emiSchedule;
}

/// @nodoc
class __$$OpportunityImplCopyWithImpl<$Res>
    extends _$OpportunityCopyWithImpl<$Res, _$OpportunityImpl>
    implements _$$OpportunityImplCopyWith<$Res> {
  __$$OpportunityImplCopyWithImpl(
    _$OpportunityImpl _value,
    $Res Function(_$OpportunityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? stage = null,
    Object? probability = null,
    Object? closeDate = freezed,
    Object? leadSource = freezed,
    Object? description = freezed,
    Object? paymentStatus = null,
    Object? type = null,
    Object? accountId = freezed,
    Object? account = freezed,
    Object? owner = freezed,
    Object? contacts = null,
    Object? emiSchedule = freezed,
    Object? paymentRecords = null,
  }) {
    return _then(
      _$OpportunityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
        closeDate: freezed == closeDate
            ? _value.closeDate
            : closeDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leadSource: freezed == leadSource
            ? _value.leadSource
            : leadSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentStatus: null == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        accountId: freezed == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String?,
        account: freezed == account
            ? _value.account
            : account // ignore: cast_nullable_to_non_nullable
                  as AccountRef?,
        owner: freezed == owner
            ? _value.owner
            : owner // ignore: cast_nullable_to_non_nullable
                  as OwnerRef?,
        contacts: null == contacts
            ? _value._contacts
            : contacts // ignore: cast_nullable_to_non_nullable
                  as List<ContactRef>,
        emiSchedule: freezed == emiSchedule
            ? _value.emiSchedule
            : emiSchedule // ignore: cast_nullable_to_non_nullable
                  as EmiSchedule?,
        paymentRecords: null == paymentRecords
            ? _value._paymentRecords
            : paymentRecords // ignore: cast_nullable_to_non_nullable
                  as List<PaymentRecord>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpportunityImpl implements _Opportunity {
  const _$OpportunityImpl({
    required this.id,
    required this.name,
    required this.amount,
    this.stage = 'prospecting',
    this.probability = 10,
    this.closeDate,
    this.leadSource,
    this.description,
    this.paymentStatus = 'pending',
    this.type = 'NEW_BUSINESS',
    this.accountId,
    this.account,
    this.owner,
    final List<ContactRef> contacts = const <ContactRef>[],
    this.emiSchedule,
    final List<PaymentRecord> paymentRecords = const <PaymentRecord>[],
  }) : _contacts = contacts,
       _paymentRecords = paymentRecords;

  factory _$OpportunityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpportunityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double amount;
  @override
  @JsonKey()
  final String stage;
  @override
  @JsonKey()
  final double probability;
  @override
  final DateTime? closeDate;
  @override
  final String? leadSource;
  @override
  final String? description;
  @override
  @JsonKey()
  final String paymentStatus;
  @override
  @JsonKey()
  final String type;
  @override
  final String? accountId;
  @override
  final AccountRef? account;
  @override
  final OwnerRef? owner;
  final List<ContactRef> _contacts;
  @override
  @JsonKey()
  List<ContactRef> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  final EmiSchedule? emiSchedule;
  final List<PaymentRecord> _paymentRecords;
  @override
  @JsonKey()
  List<PaymentRecord> get paymentRecords {
    if (_paymentRecords is EqualUnmodifiableListView) return _paymentRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentRecords);
  }

  @override
  String toString() {
    return 'Opportunity(id: $id, name: $name, amount: $amount, stage: $stage, probability: $probability, closeDate: $closeDate, leadSource: $leadSource, description: $description, paymentStatus: $paymentStatus, type: $type, accountId: $accountId, account: $account, owner: $owner, contacts: $contacts, emiSchedule: $emiSchedule, paymentRecords: $paymentRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            (identical(other.leadSource, leadSource) ||
                other.leadSource == leadSource) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.emiSchedule, emiSchedule) ||
                other.emiSchedule == emiSchedule) &&
            const DeepCollectionEquality().equals(
              other._paymentRecords,
              _paymentRecords,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    amount,
    stage,
    probability,
    closeDate,
    leadSource,
    description,
    paymentStatus,
    type,
    accountId,
    account,
    owner,
    const DeepCollectionEquality().hash(_contacts),
    emiSchedule,
    const DeepCollectionEquality().hash(_paymentRecords),
  );

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunityImplCopyWith<_$OpportunityImpl> get copyWith =>
      __$$OpportunityImplCopyWithImpl<_$OpportunityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpportunityImplToJson(this);
  }
}

abstract class _Opportunity implements Opportunity {
  const factory _Opportunity({
    required final String id,
    required final String name,
    required final double amount,
    final String stage,
    final double probability,
    final DateTime? closeDate,
    final String? leadSource,
    final String? description,
    final String paymentStatus,
    final String type,
    final String? accountId,
    final AccountRef? account,
    final OwnerRef? owner,
    final List<ContactRef> contacts,
    final EmiSchedule? emiSchedule,
    final List<PaymentRecord> paymentRecords,
  }) = _$OpportunityImpl;

  factory _Opportunity.fromJson(Map<String, dynamic> json) =
      _$OpportunityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  String get stage;
  @override
  double get probability;
  @override
  DateTime? get closeDate;
  @override
  String? get leadSource;
  @override
  String? get description;
  @override
  String get paymentStatus;
  @override
  String get type;
  @override
  String? get accountId;
  @override
  AccountRef? get account;
  @override
  OwnerRef? get owner;
  @override
  List<ContactRef> get contacts;
  @override
  EmiSchedule? get emiSchedule;
  @override
  List<PaymentRecord> get paymentRecords;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunityImplCopyWith<_$OpportunityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
