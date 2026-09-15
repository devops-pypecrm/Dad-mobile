// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserDeviceSession _$UserDeviceSessionFromJson(Map<String, dynamic> json) {
  return _UserDeviceSession.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceSession {
  String get id => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get ipAddress => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastActiveAt => throw _privateConstructorUsedError;
  bool get isCurrentDevice => throw _privateConstructorUsedError;

  /// Serializes this UserDeviceSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDeviceSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDeviceSessionCopyWith<UserDeviceSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceSessionCopyWith<$Res> {
  factory $UserDeviceSessionCopyWith(
    UserDeviceSession value,
    $Res Function(UserDeviceSession) then,
  ) = _$UserDeviceSessionCopyWithImpl<$Res, UserDeviceSession>;
  @useResult
  $Res call({
    String id,
    String? platform,
    String? deviceName,
    String? appVersion,
    String? ipAddress,
    DateTime createdAt,
    DateTime lastActiveAt,
    bool isCurrentDevice,
  });
}

/// @nodoc
class _$UserDeviceSessionCopyWithImpl<$Res, $Val extends UserDeviceSession>
    implements $UserDeviceSessionCopyWith<$Res> {
  _$UserDeviceSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDeviceSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = freezed,
    Object? deviceName = freezed,
    Object? appVersion = freezed,
    Object? ipAddress = freezed,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? isCurrentDevice = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            platform: freezed == platform
                ? _value.platform
                : platform // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceName: freezed == deviceName
                ? _value.deviceName
                : deviceName // ignore: cast_nullable_to_non_nullable
                      as String?,
            appVersion: freezed == appVersion
                ? _value.appVersion
                : appVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            ipAddress: freezed == ipAddress
                ? _value.ipAddress
                : ipAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastActiveAt: null == lastActiveAt
                ? _value.lastActiveAt
                : lastActiveAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isCurrentDevice: null == isCurrentDevice
                ? _value.isCurrentDevice
                : isCurrentDevice // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDeviceSessionImplCopyWith<$Res>
    implements $UserDeviceSessionCopyWith<$Res> {
  factory _$$UserDeviceSessionImplCopyWith(
    _$UserDeviceSessionImpl value,
    $Res Function(_$UserDeviceSessionImpl) then,
  ) = __$$UserDeviceSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? platform,
    String? deviceName,
    String? appVersion,
    String? ipAddress,
    DateTime createdAt,
    DateTime lastActiveAt,
    bool isCurrentDevice,
  });
}

/// @nodoc
class __$$UserDeviceSessionImplCopyWithImpl<$Res>
    extends _$UserDeviceSessionCopyWithImpl<$Res, _$UserDeviceSessionImpl>
    implements _$$UserDeviceSessionImplCopyWith<$Res> {
  __$$UserDeviceSessionImplCopyWithImpl(
    _$UserDeviceSessionImpl _value,
    $Res Function(_$UserDeviceSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDeviceSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = freezed,
    Object? deviceName = freezed,
    Object? appVersion = freezed,
    Object? ipAddress = freezed,
    Object? createdAt = null,
    Object? lastActiveAt = null,
    Object? isCurrentDevice = null,
  }) {
    return _then(
      _$UserDeviceSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: freezed == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceName: freezed == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String?,
        appVersion: freezed == appVersion
            ? _value.appVersion
            : appVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        ipAddress: freezed == ipAddress
            ? _value.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastActiveAt: null == lastActiveAt
            ? _value.lastActiveAt
            : lastActiveAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isCurrentDevice: null == isCurrentDevice
            ? _value.isCurrentDevice
            : isCurrentDevice // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceSessionImpl extends _UserDeviceSession {
  const _$UserDeviceSessionImpl({
    required this.id,
    this.platform,
    this.deviceName,
    this.appVersion,
    this.ipAddress,
    required this.createdAt,
    required this.lastActiveAt,
    this.isCurrentDevice = false,
  }) : super._();

  factory _$UserDeviceSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String? platform;
  @override
  final String? deviceName;
  @override
  final String? appVersion;
  @override
  final String? ipAddress;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastActiveAt;
  @override
  @JsonKey()
  final bool isCurrentDevice;

  @override
  String toString() {
    return 'UserDeviceSession(id: $id, platform: $platform, deviceName: $deviceName, appVersion: $appVersion, ipAddress: $ipAddress, createdAt: $createdAt, lastActiveAt: $lastActiveAt, isCurrentDevice: $isCurrentDevice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.isCurrentDevice, isCurrentDevice) ||
                other.isCurrentDevice == isCurrentDevice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    platform,
    deviceName,
    appVersion,
    ipAddress,
    createdAt,
    lastActiveAt,
    isCurrentDevice,
  );

  /// Create a copy of UserDeviceSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceSessionImplCopyWith<_$UserDeviceSessionImpl> get copyWith =>
      __$$UserDeviceSessionImplCopyWithImpl<_$UserDeviceSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceSessionImplToJson(this);
  }
}

abstract class _UserDeviceSession extends UserDeviceSession {
  const factory _UserDeviceSession({
    required final String id,
    final String? platform,
    final String? deviceName,
    final String? appVersion,
    final String? ipAddress,
    required final DateTime createdAt,
    required final DateTime lastActiveAt,
    final bool isCurrentDevice,
  }) = _$UserDeviceSessionImpl;
  const _UserDeviceSession._() : super._();

  factory _UserDeviceSession.fromJson(Map<String, dynamic> json) =
      _$UserDeviceSessionImpl.fromJson;

  @override
  String get id;
  @override
  String? get platform;
  @override
  String? get deviceName;
  @override
  String? get appVersion;
  @override
  String? get ipAddress;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastActiveAt;
  @override
  bool get isCurrentDevice;

  /// Create a copy of UserDeviceSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDeviceSessionImplCopyWith<_$UserDeviceSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
