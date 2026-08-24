// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckIn _$CheckInFromJson(Map<String, dynamic> json) {
  return _CheckIn.fromJson(json);
}

/// @nodoc
mixin _$CheckIn {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get leadId => throw _privateConstructorUsedError;
  String? get contactId => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  CheckInUserRef? get user => throw _privateConstructorUsedError;
  CheckInEntityRef? get lead => throw _privateConstructorUsedError;
  CheckInEntityRef? get contact => throw _privateConstructorUsedError;
  CheckInEntityRef? get account => throw _privateConstructorUsedError;

  /// Serializes this CheckIn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInCopyWith<CheckIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInCopyWith<$Res> {
  factory $CheckInCopyWith(CheckIn value, $Res Function(CheckIn) then) =
      _$CheckInCopyWithImpl<$Res, CheckIn>;
  @useResult
  $Res call({
    String id,
    String type,
    String? address,
    double? latitude,
    double? longitude,
    String? notes,
    String? photoUrl,
    DateTime createdAt,
    String? leadId,
    String? contactId,
    String? accountId,
    CheckInUserRef? user,
    CheckInEntityRef? lead,
    CheckInEntityRef? contact,
    CheckInEntityRef? account,
  });

  $CheckInUserRefCopyWith<$Res>? get user;
  $CheckInEntityRefCopyWith<$Res>? get lead;
  $CheckInEntityRefCopyWith<$Res>? get contact;
  $CheckInEntityRefCopyWith<$Res>? get account;
}

/// @nodoc
class _$CheckInCopyWithImpl<$Res, $Val extends CheckIn>
    implements $CheckInCopyWith<$Res> {
  _$CheckInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? notes = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? leadId = freezed,
    Object? contactId = freezed,
    Object? accountId = freezed,
    Object? user = freezed,
    Object? lead = freezed,
    Object? contact = freezed,
    Object? account = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            leadId: freezed == leadId
                ? _value.leadId
                : leadId // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactId: freezed == contactId
                ? _value.contactId
                : contactId // ignore: cast_nullable_to_non_nullable
                      as String?,
            accountId: freezed == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as String?,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as CheckInUserRef?,
            lead: freezed == lead
                ? _value.lead
                : lead // ignore: cast_nullable_to_non_nullable
                      as CheckInEntityRef?,
            contact: freezed == contact
                ? _value.contact
                : contact // ignore: cast_nullable_to_non_nullable
                      as CheckInEntityRef?,
            account: freezed == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                      as CheckInEntityRef?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInUserRefCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $CheckInUserRefCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInEntityRefCopyWith<$Res>? get lead {
    if (_value.lead == null) {
      return null;
    }

    return $CheckInEntityRefCopyWith<$Res>(_value.lead!, (value) {
      return _then(_value.copyWith(lead: value) as $Val);
    });
  }

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInEntityRefCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $CheckInEntityRefCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInEntityRefCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $CheckInEntityRefCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInImplCopyWith<$Res> implements $CheckInCopyWith<$Res> {
  factory _$$CheckInImplCopyWith(
    _$CheckInImpl value,
    $Res Function(_$CheckInImpl) then,
  ) = __$$CheckInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String? address,
    double? latitude,
    double? longitude,
    String? notes,
    String? photoUrl,
    DateTime createdAt,
    String? leadId,
    String? contactId,
    String? accountId,
    CheckInUserRef? user,
    CheckInEntityRef? lead,
    CheckInEntityRef? contact,
    CheckInEntityRef? account,
  });

  @override
  $CheckInUserRefCopyWith<$Res>? get user;
  @override
  $CheckInEntityRefCopyWith<$Res>? get lead;
  @override
  $CheckInEntityRefCopyWith<$Res>? get contact;
  @override
  $CheckInEntityRefCopyWith<$Res>? get account;
}

/// @nodoc
class __$$CheckInImplCopyWithImpl<$Res>
    extends _$CheckInCopyWithImpl<$Res, _$CheckInImpl>
    implements _$$CheckInImplCopyWith<$Res> {
  __$$CheckInImplCopyWithImpl(
    _$CheckInImpl _value,
    $Res Function(_$CheckInImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? notes = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? leadId = freezed,
    Object? contactId = freezed,
    Object? accountId = freezed,
    Object? user = freezed,
    Object? lead = freezed,
    Object? contact = freezed,
    Object? account = freezed,
  }) {
    return _then(
      _$CheckInImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        leadId: freezed == leadId
            ? _value.leadId
            : leadId // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactId: freezed == contactId
            ? _value.contactId
            : contactId // ignore: cast_nullable_to_non_nullable
                  as String?,
        accountId: freezed == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String?,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as CheckInUserRef?,
        lead: freezed == lead
            ? _value.lead
            : lead // ignore: cast_nullable_to_non_nullable
                  as CheckInEntityRef?,
        contact: freezed == contact
            ? _value.contact
            : contact // ignore: cast_nullable_to_non_nullable
                  as CheckInEntityRef?,
        account: freezed == account
            ? _value.account
            : account // ignore: cast_nullable_to_non_nullable
                  as CheckInEntityRef?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInImpl implements _CheckIn {
  const _$CheckInImpl({
    required this.id,
    required this.type,
    this.address,
    this.latitude,
    this.longitude,
    this.notes,
    this.photoUrl,
    required this.createdAt,
    this.leadId,
    this.contactId,
    this.accountId,
    this.user,
    this.lead,
    this.contact,
    this.account,
  });

  factory _$CheckInImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String? address;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? notes;
  @override
  final String? photoUrl;
  @override
  final DateTime createdAt;
  @override
  final String? leadId;
  @override
  final String? contactId;
  @override
  final String? accountId;
  @override
  final CheckInUserRef? user;
  @override
  final CheckInEntityRef? lead;
  @override
  final CheckInEntityRef? contact;
  @override
  final CheckInEntityRef? account;

  @override
  String toString() {
    return 'CheckIn(id: $id, type: $type, address: $address, latitude: $latitude, longitude: $longitude, notes: $notes, photoUrl: $photoUrl, createdAt: $createdAt, leadId: $leadId, contactId: $contactId, accountId: $accountId, user: $user, lead: $lead, contact: $contact, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.lead, lead) || other.lead == lead) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    address,
    latitude,
    longitude,
    notes,
    photoUrl,
    createdAt,
    leadId,
    contactId,
    accountId,
    user,
    lead,
    contact,
    account,
  );

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInImplCopyWith<_$CheckInImpl> get copyWith =>
      __$$CheckInImplCopyWithImpl<_$CheckInImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInImplToJson(this);
  }
}

abstract class _CheckIn implements CheckIn {
  const factory _CheckIn({
    required final String id,
    required final String type,
    final String? address,
    final double? latitude,
    final double? longitude,
    final String? notes,
    final String? photoUrl,
    required final DateTime createdAt,
    final String? leadId,
    final String? contactId,
    final String? accountId,
    final CheckInUserRef? user,
    final CheckInEntityRef? lead,
    final CheckInEntityRef? contact,
    final CheckInEntityRef? account,
  }) = _$CheckInImpl;

  factory _CheckIn.fromJson(Map<String, dynamic> json) = _$CheckInImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String? get address;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get notes;
  @override
  String? get photoUrl;
  @override
  DateTime get createdAt;
  @override
  String? get leadId;
  @override
  String? get contactId;
  @override
  String? get accountId;
  @override
  CheckInUserRef? get user;
  @override
  CheckInEntityRef? get lead;
  @override
  CheckInEntityRef? get contact;
  @override
  CheckInEntityRef? get account;

  /// Create a copy of CheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInImplCopyWith<_$CheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
