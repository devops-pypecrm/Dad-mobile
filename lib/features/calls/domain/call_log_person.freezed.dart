// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallLogAgent _$CallLogAgentFromJson(Map<String, dynamic> json) {
  return _CallLogAgent.fromJson(json);
}

/// @nodoc
mixin _$CallLogAgent {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this CallLogAgent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallLogAgent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogAgentCopyWith<CallLogAgent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogAgentCopyWith<$Res> {
  factory $CallLogAgentCopyWith(
    CallLogAgent value,
    $Res Function(CallLogAgent) then,
  ) = _$CallLogAgentCopyWithImpl<$Res, CallLogAgent>;
  @useResult
  $Res call({String id, String firstName, String? lastName, String? email});
}

/// @nodoc
class _$CallLogAgentCopyWithImpl<$Res, $Val extends CallLogAgent>
    implements $CallLogAgentCopyWith<$Res> {
  _$CallLogAgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogAgent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallLogAgentImplCopyWith<$Res>
    implements $CallLogAgentCopyWith<$Res> {
  factory _$$CallLogAgentImplCopyWith(
    _$CallLogAgentImpl value,
    $Res Function(_$CallLogAgentImpl) then,
  ) = __$$CallLogAgentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String firstName, String? lastName, String? email});
}

/// @nodoc
class __$$CallLogAgentImplCopyWithImpl<$Res>
    extends _$CallLogAgentCopyWithImpl<$Res, _$CallLogAgentImpl>
    implements _$$CallLogAgentImplCopyWith<$Res> {
  __$$CallLogAgentImplCopyWithImpl(
    _$CallLogAgentImpl _value,
    $Res Function(_$CallLogAgentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogAgent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _$CallLogAgentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogAgentImpl extends _CallLogAgent {
  const _$CallLogAgentImpl({
    required this.id,
    required this.firstName,
    this.lastName,
    this.email,
  }) : super._();

  factory _$CallLogAgentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogAgentImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String? lastName;
  @override
  final String? email;

  @override
  String toString() {
    return 'CallLogAgent(id: $id, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogAgentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email);

  /// Create a copy of CallLogAgent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogAgentImplCopyWith<_$CallLogAgentImpl> get copyWith =>
      __$$CallLogAgentImplCopyWithImpl<_$CallLogAgentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogAgentImplToJson(this);
  }
}

abstract class _CallLogAgent extends CallLogAgent {
  const factory _CallLogAgent({
    required final String id,
    required final String firstName,
    final String? lastName,
    final String? email,
  }) = _$CallLogAgentImpl;
  const _CallLogAgent._() : super._();

  factory _CallLogAgent.fromJson(Map<String, dynamic> json) =
      _$CallLogAgentImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String? get lastName;
  @override
  String? get email;

  /// Create a copy of CallLogAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogAgentImplCopyWith<_$CallLogAgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallLogLead _$CallLogLeadFromJson(Map<String, dynamic> json) {
  return _CallLogLead.fromJson(json);
}

/// @nodoc
mixin _$CallLogLead {
  String get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;

  /// Serializes this CallLogLead to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallLogLead
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogLeadCopyWith<CallLogLead> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogLeadCopyWith<$Res> {
  factory $CallLogLeadCopyWith(
    CallLogLead value,
    $Res Function(CallLogLead) then,
  ) = _$CallLogLeadCopyWithImpl<$Res, CallLogLead>;
  @useResult
  $Res call({
    String id,
    String? firstName,
    String? lastName,
    String? phone,
    String? company,
  });
}

/// @nodoc
class _$CallLogLeadCopyWithImpl<$Res, $Val extends CallLogLead>
    implements $CallLogLeadCopyWith<$Res> {
  _$CallLogLeadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogLead
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallLogLeadImplCopyWith<$Res>
    implements $CallLogLeadCopyWith<$Res> {
  factory _$$CallLogLeadImplCopyWith(
    _$CallLogLeadImpl value,
    $Res Function(_$CallLogLeadImpl) then,
  ) = __$$CallLogLeadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? firstName,
    String? lastName,
    String? phone,
    String? company,
  });
}

/// @nodoc
class __$$CallLogLeadImplCopyWithImpl<$Res>
    extends _$CallLogLeadCopyWithImpl<$Res, _$CallLogLeadImpl>
    implements _$$CallLogLeadImplCopyWith<$Res> {
  __$$CallLogLeadImplCopyWithImpl(
    _$CallLogLeadImpl _value,
    $Res Function(_$CallLogLeadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogLead
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _$CallLogLeadImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogLeadImpl extends _CallLogLead {
  const _$CallLogLeadImpl({
    required this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.company,
  }) : super._();

  factory _$CallLogLeadImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogLeadImplFromJson(json);

  @override
  final String id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phone;
  @override
  final String? company;

  @override
  String toString() {
    return 'CallLogLead(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogLeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, phone, company);

  /// Create a copy of CallLogLead
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogLeadImplCopyWith<_$CallLogLeadImpl> get copyWith =>
      __$$CallLogLeadImplCopyWithImpl<_$CallLogLeadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogLeadImplToJson(this);
  }
}

abstract class _CallLogLead extends CallLogLead {
  const factory _CallLogLead({
    required final String id,
    final String? firstName,
    final String? lastName,
    final String? phone,
    final String? company,
  }) = _$CallLogLeadImpl;
  const _CallLogLead._() : super._();

  factory _CallLogLead.fromJson(Map<String, dynamic> json) =
      _$CallLogLeadImpl.fromJson;

  @override
  String get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get phone;
  @override
  String? get company;

  /// Create a copy of CallLogLead
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogLeadImplCopyWith<_$CallLogLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallLogContact _$CallLogContactFromJson(Map<String, dynamic> json) {
  return _CallLogContact.fromJson(json);
}

/// @nodoc
mixin _$CallLogContact {
  String get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this CallLogContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallLogContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogContactCopyWith<CallLogContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogContactCopyWith<$Res> {
  factory $CallLogContactCopyWith(
    CallLogContact value,
    $Res Function(CallLogContact) then,
  ) = _$CallLogContactCopyWithImpl<$Res, CallLogContact>;
  @useResult
  $Res call({String id, String? firstName, String? lastName});
}

/// @nodoc
class _$CallLogContactCopyWithImpl<$Res, $Val extends CallLogContact>
    implements $CallLogContactCopyWith<$Res> {
  _$CallLogContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallLogContactImplCopyWith<$Res>
    implements $CallLogContactCopyWith<$Res> {
  factory _$$CallLogContactImplCopyWith(
    _$CallLogContactImpl value,
    $Res Function(_$CallLogContactImpl) then,
  ) = __$$CallLogContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? firstName, String? lastName});
}

/// @nodoc
class __$$CallLogContactImplCopyWithImpl<$Res>
    extends _$CallLogContactCopyWithImpl<$Res, _$CallLogContactImpl>
    implements _$$CallLogContactImplCopyWith<$Res> {
  __$$CallLogContactImplCopyWithImpl(
    _$CallLogContactImpl _value,
    $Res Function(_$CallLogContactImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(
      _$CallLogContactImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogContactImpl extends _CallLogContact {
  const _$CallLogContactImpl({required this.id, this.firstName, this.lastName})
    : super._();

  factory _$CallLogContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogContactImplFromJson(json);

  @override
  final String id;
  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'CallLogContact(id: $id, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  /// Create a copy of CallLogContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogContactImplCopyWith<_$CallLogContactImpl> get copyWith =>
      __$$CallLogContactImplCopyWithImpl<_$CallLogContactImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogContactImplToJson(this);
  }
}

abstract class _CallLogContact extends CallLogContact {
  const factory _CallLogContact({
    required final String id,
    final String? firstName,
    final String? lastName,
  }) = _$CallLogContactImpl;
  const _CallLogContact._() : super._();

  factory _CallLogContact.fromJson(Map<String, dynamic> json) =
      _$CallLogContactImpl.fromJson;

  @override
  String get id;
  @override
  String? get firstName;
  @override
  String? get lastName;

  /// Create a copy of CallLogContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogContactImplCopyWith<_$CallLogContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
