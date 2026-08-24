import 'package:freezed_annotation/freezed_annotation.dart';

import 'checkin_refs.dart';

part 'checkin.freezed.dart';
part 'checkin.g.dart';

/// Mirrors `Dad-backend/prisma/schema.prisma`'s `CheckIn` model as returned
/// by `GET /api/checkins` (Dad-backend/src/controllers/checkInController.ts).
/// Note the real mount path has no hyphen — `/api/checkins`, not
/// `/api/check-ins` (a stale doc used the hyphenated form).
@freezed
class CheckIn with _$CheckIn {
  const factory CheckIn({
    required String id,
    required String type,
    String? address,
    double? latitude,
    double? longitude,
    String? notes,
    String? photoUrl,
    required DateTime createdAt,
    String? leadId,
    String? contactId,
    String? accountId,
    CheckInUserRef? user,
    CheckInEntityRef? lead,
    CheckInEntityRef? contact,
    CheckInEntityRef? account,
  }) = _CheckIn;

  factory CheckIn.fromJson(Map<String, dynamic> json) => _$CheckInFromJson(json);
}
