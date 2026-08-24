import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_refs.freezed.dart';
part 'checkin_refs.g.dart';

/// The `user` relation on a CheckIn — `{ firstName, lastName, branch: { name } }`
/// (Dad-backend/src/controllers/checkInController.ts `getCheckIns` include).
@freezed
class CheckInUserRef with _$CheckInUserRef {
  const factory CheckInUserRef({
    String? firstName,
    String? lastName,
    CheckInBranchRef? branch,
  }) = _CheckInUserRef;

  factory CheckInUserRef.fromJson(Map<String, dynamic> json) => _$CheckInUserRefFromJson(json);
}

@freezed
class CheckInBranchRef with _$CheckInBranchRef {
  const factory CheckInBranchRef({String? name}) = _CheckInBranchRef;

  factory CheckInBranchRef.fromJson(Map<String, dynamic> json) => _$CheckInBranchRefFromJson(json);
}

/// The `lead`/`contact`/`account` relations — shapes differ slightly
/// (lead: firstName/lastName/company, contact: firstName/lastName,
/// account: name) so every field here is optional.
@freezed
class CheckInEntityRef with _$CheckInEntityRef {
  const CheckInEntityRef._();

  const factory CheckInEntityRef({
    String? firstName,
    String? lastName,
    String? name,
    String? company,
  }) = _CheckInEntityRef;

  factory CheckInEntityRef.fromJson(Map<String, dynamic> json) => _$CheckInEntityRefFromJson(json);

  String get displayName {
    final personName = [firstName, lastName].where((p) => p != null && p.trim().isNotEmpty).join(' ');
    if (personName.isNotEmpty) return personName;
    return name ?? 'Unknown';
  }
}
