// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallSettings _$CallSettingsFromJson(Map<String, dynamic> json) {
  return _CallSettings.fromJson(json);
}

/// @nodoc
mixin _$CallSettings {
  bool get autoRecordOutbound => throw _privateConstructorUsedError;
  bool get autoRecordInbound => throw _privateConstructorUsedError;
  String get recordingQuality => throw _privateConstructorUsedError;
  String get storageType => throw _privateConstructorUsedError;
  int get retentionDays => throw _privateConstructorUsedError;
  bool get autoDeleteEnabled => throw _privateConstructorUsedError;
  bool get popupOnIncoming => throw _privateConstructorUsedError;
  bool get autoFollowupReminder => throw _privateConstructorUsedError;
  int get followupDelayMinutes => throw _privateConstructorUsedError;
  bool get syncNonCrmContacts => throw _privateConstructorUsedError;

  /// Serializes this CallSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallSettingsCopyWith<CallSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallSettingsCopyWith<$Res> {
  factory $CallSettingsCopyWith(
    CallSettings value,
    $Res Function(CallSettings) then,
  ) = _$CallSettingsCopyWithImpl<$Res, CallSettings>;
  @useResult
  $Res call({
    bool autoRecordOutbound,
    bool autoRecordInbound,
    String recordingQuality,
    String storageType,
    int retentionDays,
    bool autoDeleteEnabled,
    bool popupOnIncoming,
    bool autoFollowupReminder,
    int followupDelayMinutes,
    bool syncNonCrmContacts,
  });
}

/// @nodoc
class _$CallSettingsCopyWithImpl<$Res, $Val extends CallSettings>
    implements $CallSettingsCopyWith<$Res> {
  _$CallSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoRecordOutbound = null,
    Object? autoRecordInbound = null,
    Object? recordingQuality = null,
    Object? storageType = null,
    Object? retentionDays = null,
    Object? autoDeleteEnabled = null,
    Object? popupOnIncoming = null,
    Object? autoFollowupReminder = null,
    Object? followupDelayMinutes = null,
    Object? syncNonCrmContacts = null,
  }) {
    return _then(
      _value.copyWith(
            autoRecordOutbound: null == autoRecordOutbound
                ? _value.autoRecordOutbound
                : autoRecordOutbound // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoRecordInbound: null == autoRecordInbound
                ? _value.autoRecordInbound
                : autoRecordInbound // ignore: cast_nullable_to_non_nullable
                      as bool,
            recordingQuality: null == recordingQuality
                ? _value.recordingQuality
                : recordingQuality // ignore: cast_nullable_to_non_nullable
                      as String,
            storageType: null == storageType
                ? _value.storageType
                : storageType // ignore: cast_nullable_to_non_nullable
                      as String,
            retentionDays: null == retentionDays
                ? _value.retentionDays
                : retentionDays // ignore: cast_nullable_to_non_nullable
                      as int,
            autoDeleteEnabled: null == autoDeleteEnabled
                ? _value.autoDeleteEnabled
                : autoDeleteEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            popupOnIncoming: null == popupOnIncoming
                ? _value.popupOnIncoming
                : popupOnIncoming // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoFollowupReminder: null == autoFollowupReminder
                ? _value.autoFollowupReminder
                : autoFollowupReminder // ignore: cast_nullable_to_non_nullable
                      as bool,
            followupDelayMinutes: null == followupDelayMinutes
                ? _value.followupDelayMinutes
                : followupDelayMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            syncNonCrmContacts: null == syncNonCrmContacts
                ? _value.syncNonCrmContacts
                : syncNonCrmContacts // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallSettingsImplCopyWith<$Res>
    implements $CallSettingsCopyWith<$Res> {
  factory _$$CallSettingsImplCopyWith(
    _$CallSettingsImpl value,
    $Res Function(_$CallSettingsImpl) then,
  ) = __$$CallSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool autoRecordOutbound,
    bool autoRecordInbound,
    String recordingQuality,
    String storageType,
    int retentionDays,
    bool autoDeleteEnabled,
    bool popupOnIncoming,
    bool autoFollowupReminder,
    int followupDelayMinutes,
    bool syncNonCrmContacts,
  });
}

/// @nodoc
class __$$CallSettingsImplCopyWithImpl<$Res>
    extends _$CallSettingsCopyWithImpl<$Res, _$CallSettingsImpl>
    implements _$$CallSettingsImplCopyWith<$Res> {
  __$$CallSettingsImplCopyWithImpl(
    _$CallSettingsImpl _value,
    $Res Function(_$CallSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoRecordOutbound = null,
    Object? autoRecordInbound = null,
    Object? recordingQuality = null,
    Object? storageType = null,
    Object? retentionDays = null,
    Object? autoDeleteEnabled = null,
    Object? popupOnIncoming = null,
    Object? autoFollowupReminder = null,
    Object? followupDelayMinutes = null,
    Object? syncNonCrmContacts = null,
  }) {
    return _then(
      _$CallSettingsImpl(
        autoRecordOutbound: null == autoRecordOutbound
            ? _value.autoRecordOutbound
            : autoRecordOutbound // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoRecordInbound: null == autoRecordInbound
            ? _value.autoRecordInbound
            : autoRecordInbound // ignore: cast_nullable_to_non_nullable
                  as bool,
        recordingQuality: null == recordingQuality
            ? _value.recordingQuality
            : recordingQuality // ignore: cast_nullable_to_non_nullable
                  as String,
        storageType: null == storageType
            ? _value.storageType
            : storageType // ignore: cast_nullable_to_non_nullable
                  as String,
        retentionDays: null == retentionDays
            ? _value.retentionDays
            : retentionDays // ignore: cast_nullable_to_non_nullable
                  as int,
        autoDeleteEnabled: null == autoDeleteEnabled
            ? _value.autoDeleteEnabled
            : autoDeleteEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        popupOnIncoming: null == popupOnIncoming
            ? _value.popupOnIncoming
            : popupOnIncoming // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoFollowupReminder: null == autoFollowupReminder
            ? _value.autoFollowupReminder
            : autoFollowupReminder // ignore: cast_nullable_to_non_nullable
                  as bool,
        followupDelayMinutes: null == followupDelayMinutes
            ? _value.followupDelayMinutes
            : followupDelayMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        syncNonCrmContacts: null == syncNonCrmContacts
            ? _value.syncNonCrmContacts
            : syncNonCrmContacts // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallSettingsImpl implements _CallSettings {
  const _$CallSettingsImpl({
    this.autoRecordOutbound = false,
    this.autoRecordInbound = false,
    this.recordingQuality = 'high',
    this.storageType = 'local',
    this.retentionDays = 90,
    this.autoDeleteEnabled = false,
    this.popupOnIncoming = true,
    this.autoFollowupReminder = true,
    this.followupDelayMinutes = 30,
    this.syncNonCrmContacts = true,
  });

  factory _$CallSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool autoRecordOutbound;
  @override
  @JsonKey()
  final bool autoRecordInbound;
  @override
  @JsonKey()
  final String recordingQuality;
  @override
  @JsonKey()
  final String storageType;
  @override
  @JsonKey()
  final int retentionDays;
  @override
  @JsonKey()
  final bool autoDeleteEnabled;
  @override
  @JsonKey()
  final bool popupOnIncoming;
  @override
  @JsonKey()
  final bool autoFollowupReminder;
  @override
  @JsonKey()
  final int followupDelayMinutes;
  @override
  @JsonKey()
  final bool syncNonCrmContacts;

  @override
  String toString() {
    return 'CallSettings(autoRecordOutbound: $autoRecordOutbound, autoRecordInbound: $autoRecordInbound, recordingQuality: $recordingQuality, storageType: $storageType, retentionDays: $retentionDays, autoDeleteEnabled: $autoDeleteEnabled, popupOnIncoming: $popupOnIncoming, autoFollowupReminder: $autoFollowupReminder, followupDelayMinutes: $followupDelayMinutes, syncNonCrmContacts: $syncNonCrmContacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallSettingsImpl &&
            (identical(other.autoRecordOutbound, autoRecordOutbound) ||
                other.autoRecordOutbound == autoRecordOutbound) &&
            (identical(other.autoRecordInbound, autoRecordInbound) ||
                other.autoRecordInbound == autoRecordInbound) &&
            (identical(other.recordingQuality, recordingQuality) ||
                other.recordingQuality == recordingQuality) &&
            (identical(other.storageType, storageType) ||
                other.storageType == storageType) &&
            (identical(other.retentionDays, retentionDays) ||
                other.retentionDays == retentionDays) &&
            (identical(other.autoDeleteEnabled, autoDeleteEnabled) ||
                other.autoDeleteEnabled == autoDeleteEnabled) &&
            (identical(other.popupOnIncoming, popupOnIncoming) ||
                other.popupOnIncoming == popupOnIncoming) &&
            (identical(other.autoFollowupReminder, autoFollowupReminder) ||
                other.autoFollowupReminder == autoFollowupReminder) &&
            (identical(other.followupDelayMinutes, followupDelayMinutes) ||
                other.followupDelayMinutes == followupDelayMinutes) &&
            (identical(other.syncNonCrmContacts, syncNonCrmContacts) ||
                other.syncNonCrmContacts == syncNonCrmContacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    autoRecordOutbound,
    autoRecordInbound,
    recordingQuality,
    storageType,
    retentionDays,
    autoDeleteEnabled,
    popupOnIncoming,
    autoFollowupReminder,
    followupDelayMinutes,
    syncNonCrmContacts,
  );

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallSettingsImplCopyWith<_$CallSettingsImpl> get copyWith =>
      __$$CallSettingsImplCopyWithImpl<_$CallSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallSettingsImplToJson(this);
  }
}

abstract class _CallSettings implements CallSettings {
  const factory _CallSettings({
    final bool autoRecordOutbound,
    final bool autoRecordInbound,
    final String recordingQuality,
    final String storageType,
    final int retentionDays,
    final bool autoDeleteEnabled,
    final bool popupOnIncoming,
    final bool autoFollowupReminder,
    final int followupDelayMinutes,
    final bool syncNonCrmContacts,
  }) = _$CallSettingsImpl;

  factory _CallSettings.fromJson(Map<String, dynamic> json) =
      _$CallSettingsImpl.fromJson;

  @override
  bool get autoRecordOutbound;
  @override
  bool get autoRecordInbound;
  @override
  String get recordingQuality;
  @override
  String get storageType;
  @override
  int get retentionDays;
  @override
  bool get autoDeleteEnabled;
  @override
  bool get popupOnIncoming;
  @override
  bool get autoFollowupReminder;
  @override
  int get followupDelayMinutes;
  @override
  bool get syncNonCrmContacts;

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallSettingsImplCopyWith<_$CallSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
