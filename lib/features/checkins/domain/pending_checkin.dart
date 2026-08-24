import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_checkin.freezed.dart';
part 'pending_checkin.g.dart';

/// A check-in captured on-device, either about to be submitted immediately
/// or queued locally because there's no connectivity. `capturedAt` is the
/// original action timestamp, never overwritten at sync time — per
/// .claude/skills/field-force.md's "always attach the original timestamp of
/// the action, not the timestamp of the sync".
@freezed
class PendingCheckIn with _$PendingCheckIn {
  const factory PendingCheckIn({
    required String localId,
    required String type,
    String? notes,
    String? leadId,
    String? contactId,
    String? accountId,
    double? latitude,
    double? longitude,
    String? address,
    /// Local file path pending upload (offline case). Cleared once
    /// [photoUrl] is populated by a successful upload.
    String? localPhotoPath,
    String? photoUrl,
    required DateTime capturedAt,
    @Default(0) int attempts,
  }) = _PendingCheckIn;

  factory PendingCheckIn.fromJson(Map<String, dynamic> json) => _$PendingCheckInFromJson(json);
}
