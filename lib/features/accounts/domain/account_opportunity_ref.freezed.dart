// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_opportunity_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountOpportunityRef _$AccountOpportunityRefFromJson(
  Map<String, dynamic> json,
) {
  return _AccountOpportunityRef.fromJson(json);
}

/// @nodoc
mixin _$AccountOpportunityRef {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;

  /// Serializes this AccountOpportunityRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountOpportunityRefCopyWith<AccountOpportunityRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountOpportunityRefCopyWith<$Res> {
  factory $AccountOpportunityRefCopyWith(
    AccountOpportunityRef value,
    $Res Function(AccountOpportunityRef) then,
  ) = _$AccountOpportunityRefCopyWithImpl<$Res, AccountOpportunityRef>;
  @useResult
  $Res call({String id, String name, double amount, String stage});
}

/// @nodoc
class _$AccountOpportunityRefCopyWithImpl<
  $Res,
  $Val extends AccountOpportunityRef
>
    implements $AccountOpportunityRefCopyWith<$Res> {
  _$AccountOpportunityRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? stage = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountOpportunityRefImplCopyWith<$Res>
    implements $AccountOpportunityRefCopyWith<$Res> {
  factory _$$AccountOpportunityRefImplCopyWith(
    _$AccountOpportunityRefImpl value,
    $Res Function(_$AccountOpportunityRefImpl) then,
  ) = __$$AccountOpportunityRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double amount, String stage});
}

/// @nodoc
class __$$AccountOpportunityRefImplCopyWithImpl<$Res>
    extends
        _$AccountOpportunityRefCopyWithImpl<$Res, _$AccountOpportunityRefImpl>
    implements _$$AccountOpportunityRefImplCopyWith<$Res> {
  __$$AccountOpportunityRefImplCopyWithImpl(
    _$AccountOpportunityRefImpl _value,
    $Res Function(_$AccountOpportunityRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? stage = null,
  }) {
    return _then(
      _$AccountOpportunityRefImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountOpportunityRefImpl implements _AccountOpportunityRef {
  const _$AccountOpportunityRefImpl({
    required this.id,
    required this.name,
    required this.amount,
    required this.stage,
  });

  factory _$AccountOpportunityRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountOpportunityRefImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double amount;
  @override
  final String stage;

  @override
  String toString() {
    return 'AccountOpportunityRef(id: $id, name: $name, amount: $amount, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountOpportunityRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, amount, stage);

  /// Create a copy of AccountOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountOpportunityRefImplCopyWith<_$AccountOpportunityRefImpl>
  get copyWith =>
      __$$AccountOpportunityRefImplCopyWithImpl<_$AccountOpportunityRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountOpportunityRefImplToJson(this);
  }
}

abstract class _AccountOpportunityRef implements AccountOpportunityRef {
  const factory _AccountOpportunityRef({
    required final String id,
    required final String name,
    required final double amount,
    required final String stage,
  }) = _$AccountOpportunityRefImpl;

  factory _AccountOpportunityRef.fromJson(Map<String, dynamic> json) =
      _$AccountOpportunityRefImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  String get stage;

  /// Create a copy of AccountOpportunityRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountOpportunityRefImplCopyWith<_$AccountOpportunityRefImpl>
  get copyWith => throw _privateConstructorUsedError;
}
