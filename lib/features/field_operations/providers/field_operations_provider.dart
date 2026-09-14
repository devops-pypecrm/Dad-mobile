import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/role_utils.dart';
import '../../checkins/domain/checkin.dart';
import '../../checkins/providers/checkins_feed_provider.dart';
import '../../users/providers/users_provider.dart';
import '../domain/field_team_member.dart';

part 'field_operations_provider.g.dart';

/// Combines today's check-ins (`checkInsFeedProvider`) with the visible
/// field-role roster (`scopedUsersProvider`) into the stat cards / team
/// roster / map markers the Field Operations dashboard shows — a direct
/// port of the `productivityMetrics`/`teamActivity`/`mapMarkers` `useMemo`
/// blocks in Dad-frontend's `pages/field-force/index.tsx`, including their
/// quirk of counting "Currently Checked In" from `type === 'CHECK_IN'` rows
/// only while a member's live status considers a check-in of ANY type —
/// kept as-is so the two clients report the same numbers for the same data.
@riverpod
Future<FieldOperationsSnapshot> fieldOperationsSnapshot(AutoDisposeFutureProviderRef<FieldOperationsSnapshot> ref) async {
  final checkIns = await ref.watch(checkInsFeedProvider.future);
  final users = await ref.watch(scopedUsersProvider.future);

  final fieldUsers = users.where((u) => isFieldRole(u.role)).toList();

  final checkInsByUser = <String, CheckIn>{};
  for (final c in checkIns) {
    final userId = c.userId;
    if (userId != null) checkInsByUser.putIfAbsent(userId, () => c);
  }

  final activeCount = checkIns.where((c) => c.type.toUpperCase() == 'CHECK_IN').length;
  final inTransitCount = (activeCount * 0.3).floor();
  final productivityScore = fieldUsers.isEmpty ? 0 : ((activeCount / fieldUsers.length) * 100).round();

  final team = fieldUsers.take(10).map((user) {
    final checkIn = checkInsByUser[user.id];
    return FieldTeamMember(
      id: user.id,
      name: user.fullName,
      isCheckedIn: checkIn != null,
      location: checkIn?.address ?? 'Unknown',
      latitude: checkIn?.latitude,
      longitude: checkIn?.longitude,
      lastActivityAt: checkIn?.createdAt,
    );
  }).toList();

  return FieldOperationsSnapshot(
    checkedInCount: activeCount,
    inTransitCount: inTransitCount,
    visitsToday: checkIns.length,
    productivityScore: productivityScore,
    team: team,
  );
}
