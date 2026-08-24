// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_checkin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PendingCheckIn _$PendingCheckInFromJson(Map<String, dynamic> json) {
  return _PendingCheckIn.fromJson(json);
}

/// @nodoc
mixin _$PendingCheckIn {
  String get localId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get leadId => throw _privateConstructorUsedError;
  String? get contactId => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Local file path pending upload (offline case). Cleared once
  /// [photoUrl] is populated by a successful upload.
  String? get localPhotoPath => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  DateTime get capturedAt => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;

  /// Serializes this PendingCheckIn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingCheckInCopyWith<PendingCheckIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingCheckInCopyWith<$Res> {
  factory $PendingCheckInCopyWith(
    PendingCheckIn value,
    $Res Function(PendingCheckIn) then,
  ) = _$PendingCheckInCopyWithImpl<$Res, PendingCheckIn>;
  @useResult
  $Res call({
    String localId,
    String type,
    String? notes,
    String? leadId,
    String? contactId,
    String? accountId,
    double? latitude,
    double? longitude,
    String? address,
    String? localPhotoPath,
    String? photoUrl,
    DateTime capturedAt,
    int attempts,
  });
}

/// @nodoc
class _$PendingCheckInCopyWithImpl<$Res, $Val extends PendingCheckIn>
    implements $PendingCheckInCopyWith<$Res> {
  _$PendingCheckInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? type = null,
    Object? notes = freezed,
    Object? leadId = freezed,
    Object? contactId = freezed,
    Object? accountId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? localPhotoPath = freezed,
    Object? photoUrl = freezed,
    Object? capturedAt = null,
    Object? attempts = null,
  }) {
    return _then(
      _value.copyWith(
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            localPhotoPath: freezed == localPhotoPath
                ? _value.localPhotoPath
                : localPhotoPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            capturedAt: null == capturedAt
                ? _value.capturedAt
                : capturedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            attempts: null == attempts
                ? _value.attempts
                : attempts // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingCheckInImplCopyWith<$Res>
    implements $PendingCheckInCopyWith<$Res> {
  factory _$$PendingCheckInImplCopyWith(
    _$PendingCheckInImpl value,
    $Res Function(_$PendingCheckInImpl) then,
  ) = __$$PendingCheckInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    String type,
    String? notes,
    String? leadId,
    String? contactId,
    String? accountId,
    double? latitude,
    double? longitude,
    String? address,
    String? localPhotoPath,
    String? photoUrl,
    DateTime capturedAt,
    int attempts,
  });
}

/// @nodoc
class __$$PendingCheckInImplCopyWithImpl<$Res>
    extends _$PendingCheckInCopyWithImpl<$Res, _$PendingCheckInImpl>
    implements _$$PendingCheckInImplCopyWith<$Res> {
  __$$PendingCheckInImplCopyWithImpl(
    _$PendingCheckInImpl _value,
    $Res Function(_$PendingCheckInImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? type = null,
    Object? notes = freezed,
    Object? leadId = freezed,
    Object? contactId = freezed,
    Object? accountId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? localPhotoPath = freezed,
    Object? photoUrl = freezed,
    Object? capturedAt = null,
    Object? attempts = null,
  }) {
    return _then(
      _$PendingCheckInImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        localPhotoPath: freezed == localPhotoPath
            ? _value.localPhotoPath
            : localPhotoPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        capturedAt: null == capturedAt
            ? _value.capturedAt
            : capturedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        attempts: null == attempts
            ? _value.attempts
            : attempts // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingCheckInImpl implements _PendingCheckIn {
  const _$PendingCheckInImpl({
    required this.localId,
    required this.type,
    this.notes,
    this.leadId,
    this.contactId,
    this.accountId,
    this.latitude,
    this.longitude,
    this.address,
    this.localPhotoPath,
    this.photoUrl,
    required this.capturedAt,
    this.attempts = 0,
  });

  factory _$PendingCheckInImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingCheckInImplFromJson(json);

  @override
  final String localId;
  @override
  final String type;
  @override
  final String? notes;
  @override
  final String? leadId;
  @override
  final String? contactId;
  @override
  final String? accountId;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? address;

  /// Local file path pending upload (offline case). Cleared once
  /// [photoUrl] is populated by a successful upload.
  @override
  final String? localPhotoPath;
  @override
  final String? photoUrl;
  @override
  final DateTime capturedAt;
  @override
  @JsonKey()
  final int attempts;

  @override
  String toString() {
    return 'PendingCheckIn(localId: $localId, type: $type, notes: $notes, leadId: $leadId, contactId: $contactId, accountId: $accountId, latitude: $latitude, longitude: $longitude, address: $address, localPhotoPath: $localPhotoPath, photoUrl: $photoUrl, capturedAt: $capturedAt, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingCheckInImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.localPhotoPath, localPhotoPath) ||
                other.localPhotoPath == localPhotoPath) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    localId,
    type,
    notes,
    leadId,
    contactId,
    accountId,
    latitude,
    longitude,
    address,
    localPhotoPath,
    photoUrl,
    capturedAt,
    attempts,
  );

  /// Create a copy of PendingCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingCheckInImplCopyWith<_$PendingCheckInImpl> get copyWith =>
      __$$PendingCheckInImplCopyWithImpl<_$PendingCheckInImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingCheckInImplToJson(this);
  }
}

abstract class _PendingCheckIn implements PendingCheckIn {
  const factory _PendingCheckIn({
    required final String localId,
    required final String type,
    final String? notes,
    final String? leadId,
    final String? contactId,
    final String? accountId,
    final double? latitude,
    final double? longitude,
    final String? address,
    final String? localPhotoPath,
    final String? photoUrl,
    required final DateTime capturedAt,
    final int attempts,
  }) = _$PendingCheckInImpl;

  factory _PendingCheckIn.fromJson(Map<String, dynamic> json) =
      _$PendingCheckInImpl.fromJson;

  @override
  String get localId;
  @override
  String get type;
  @override
  String? get notes;
  @override
  String? get leadId;
  @override
  String? get contactId;
  @override
  String? get accountId;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get address;

  /// Local file path pending upload (offline case). Cleared once
  /// [photoUrl] is populated by a successful upload.
  @override
  String? get localPhotoPath;
  @override
  String? get photoUrl;
  @override
  DateTime get capturedAt;
  @override
  int get attempts;

  /// Create a copy of PendingCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingCheckInImplCopyWith<_$PendingCheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
