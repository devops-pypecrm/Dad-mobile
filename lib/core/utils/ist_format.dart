import 'package:intl/intl.dart';

/// Same `formatIST` as Dad-frontend/src/lib/dateUtils.ts — every lead
/// activity tab (Timeline/WhatsApp Messages/WhatsApp Calls/Call
/// History/Ownership History) on web renders dates in IST regardless of
/// the viewer's own timezone (`date-fns-tz`'s `formatInTimeZone(date,
/// "Asia/Kolkata", formatStr)`), not the browser's local zone. Matching
/// that exactly (rather than showing each mobile device's own local time)
/// avoids the two clients disagreeing about when something happened.
///
/// Backend dates arrive as ISO strings representing a real UTC instant;
/// shifting that instant by the fixed +5:30 IST offset and then reading its
/// wall-clock fields is equivalent to `formatInTimeZone(..., "Asia/Kolkata")`
/// without pulling in a full timezone-database package for one fixed,
/// non-DST offset.
String formatIST(DateTime date, String pattern) {
  final ist = date.toUtc().add(const Duration(hours: 5, minutes: 30));
  return DateFormat(pattern).format(ist);
}

/// Same `formatDuration` as Dad-frontend/src/lib/callUtils.ts: `0s` for a
/// falsy/zero value, `"${mins}m ${secs}s"` once it's a minute or more, else
/// `"${secs}s"`.
String formatCallDuration(num seconds) {
  if (seconds <= 0) return '0s';
  final mins = (seconds / 60).floor();
  final secs = (seconds % 60).round();
  return mins > 0 ? '${mins}m ${secs}s' : '${secs}s';
}

/// Same `getBestDurationSeconds` as Dad-frontend/src/lib/callUtils.ts —
/// priority: hardware-measured duration (already seconds) > recording
/// duration (already seconds) > the logged `duration` field, which is
/// stored in MINUTES everywhere on the backend (`Interaction.duration`),
/// hence `* 60` only on that last fallback.
num bestDurationSeconds({
  num? hardwareDuration,
  num? recordingDuration,
  num? durationMinutes,
}) {
  if (hardwareDuration != null && hardwareDuration > 0) return hardwareDuration;
  if (recordingDuration != null && recordingDuration > 0)
    return recordingDuration;
  if (durationMinutes != null && durationMinutes > 0)
    return durationMinutes * 60;
  return 0;
}
