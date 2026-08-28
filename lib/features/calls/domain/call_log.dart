import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/config/app_config.dart';
import 'call_log_person.dart';

part 'call_log.freezed.dart';
part 'call_log.g.dart';

/// One row of `GET /api/calls`'s `calls[]`
/// (Dad-backend/src/controllers/callController.ts `getAllCalls`, backed by
/// the `Interaction` model filtered to `type: 'call'` — NOT the separate
/// `CallRecording` model used by the native Android upload pipeline, see
/// Dad-backend/CLAUDE.md). Only the fields the web `/calls` page actually
/// displays are modeled — `hardwareDuration`/`callerId` exist on the
/// response but aren't shown anywhere on that page either.
@freezed
class CallLog with _$CallLog {
  const CallLog._();

  const factory CallLog({
    required String id,
    @Default('outbound') String direction,
    String? subject,
    required DateTime date,
    double? duration,
    int? recordingDuration,
    String? recordingUrl,
    String? callStatus,
    String? phoneNumber,
    CallLogAgent? createdBy,
    CallLogLead? lead,
    CallLogContact? contact,
  }) = _CallLog;

  factory CallLog.fromJson(Map<String, dynamic> json) => _$CallLogFromJson(json);

  bool get hasRecording => recordingUrl != null && recordingUrl!.isNotEmpty;

  /// `recordingUrl` from the backend is always origin-relative (e.g.
  /// `/uploads/recordings/xyz.mp3` — see
  /// Dad-backend/src/controllers/callController.ts and androidController.ts,
  /// both of which build it as `/uploads/recordings/${filename}`), so it
  /// needs [AppConfig.apiOrigin] (NOT [AppConfig.apiBaseUrl], which has the
  /// `/api` suffix `/uploads` isn't under) prefixed to become playable.
  /// `/uploads` is served by Express with no auth middleware (just CORS
  /// headers — see Dad-backend/src/index.ts), so no bearer token is needed
  /// to fetch it.
  String? get playableRecordingUrl {
    if (!hasRecording) return null;
    return '${AppConfig.instance.apiOrigin}$recordingUrl';
  }

  /// Prefers `recordingDuration` (seconds, the more accurate figure) over
  /// the legacy `duration` field, which `Dad-frontend/src/pages/calls/index.tsx`
  /// treats as **minutes** when falling back to it (despite the Prisma
  /// schema comment nearby calling it "seconds-ish" — the frontend's actual
  /// display logic is the tie-breaker here since it's what's really live).
  int get durationSeconds => recordingDuration ?? (duration != null ? (duration! * 60).round() : 0);

  String get counterpartName {
    if (lead != null) return lead!.displayName;
    if (contact != null) return contact!.displayName;
    return phoneNumber ?? 'Unknown';
  }
}
