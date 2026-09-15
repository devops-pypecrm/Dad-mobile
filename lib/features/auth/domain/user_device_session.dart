import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_session.freezed.dart';
part 'user_device_session.g.dart';

/// One row from `GET /api/auth/sessions` — a device this account is
/// currently logged into. Backs the Settings > Devices screen.
@freezed
class UserDeviceSession with _$UserDeviceSession {
  const UserDeviceSession._();

  const factory UserDeviceSession({
    required String id,
    String? platform,
    String? deviceName,
    String? appVersion,
    String? ipAddress,
    required DateTime createdAt,
    required DateTime lastActiveAt,
    @Default(false) bool isCurrentDevice,
  }) = _UserDeviceSession;

  factory UserDeviceSession.fromJson(Map<String, dynamic> json) => _$UserDeviceSessionFromJson(json);

  String get displayName {
    final name = deviceName?.trim();
    if (name != null && name.isNotEmpty) return name;
    switch (platform) {
      case 'android':
        return 'Android device';
      case 'ios':
        return 'iPhone / iPad';
      case 'web':
        return 'Web browser';
      default:
        return 'Unknown device';
    }
  }
}
