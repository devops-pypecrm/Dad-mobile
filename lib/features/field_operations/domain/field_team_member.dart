/// One row in the "Team Activity" panel / a marker on the "Live Team
/// Locations" map — a field-role user (`isFieldRole`) paired with their most
/// recent check-in today, if any. Mirrors the shape Dad-frontend's
/// `teamActivity`/`mapMarkers` derive client-side in `pages/field-force/index.tsx`;
/// there is no backend "live status" field, this is the same UI heuristic
/// ported 1:1 so mobile and web read the team's status identically.
class FieldTeamMember {
  const FieldTeamMember({
    required this.id,
    required this.name,
    required this.isCheckedIn,
    required this.location,
    this.latitude,
    this.longitude,
    this.lastActivityAt,
  });

  final String id;
  final String name;
  final bool isCheckedIn;
  final String location;
  final double? latitude;
  final double? longitude;
  final DateTime? lastActivityAt;

  bool get hasCoordinates => latitude != null && longitude != null;

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}

/// The whole Field Operations dashboard's derived data — stat cards, team
/// roster, and map markers — computed fresh from today's check-ins + the
/// visible field-role users. See `fieldOperationsSnapshotProvider`.
class FieldOperationsSnapshot {
  const FieldOperationsSnapshot({
    required this.checkedInCount,
    required this.inTransitCount,
    required this.visitsToday,
    required this.productivityScore,
    required this.team,
  });

  final int checkedInCount;
  final int inTransitCount;
  final int visitsToday;
  final int productivityScore;
  final List<FieldTeamMember> team;

  List<FieldTeamMember> get mappable => team.where((m) => m.hasCoordinates).toList();
}
