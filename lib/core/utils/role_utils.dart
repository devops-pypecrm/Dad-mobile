/// Same role check as `isAdmin()` in Dad-frontend/src/lib/utils.ts: the
/// normalized role string (spaces/hyphens → underscores, lowercased) must
/// be exactly `admin` or `super_admin` — not a substring match.
bool isAdminRole(String? role) {
  if (role == null) return false;
  final normalized = role.toLowerCase().replaceAll(RegExp(r'[\s-]'), '_');
  return normalized == 'admin' || normalized == 'super_admin';
}

/// Roles allowed to call manager-gated endpoints — matches the set already
/// used ad hoc in `reports_screen.dart` (`_managerRoles`) and the backend's
/// `authorize('admin', 'manager', 'org_admin')` gate on
/// `GET /api/leads/re-enquiries`. `super_admin`/`branch_manager` included
/// for the same reason `reports_screen.dart`'s set does — they're strict
/// supersets of "manager" in practice.
const _managerRoles = {'manager', 'admin', 'super_admin', 'branch_manager', 'org_admin'};

bool isManagerRole(String? role) {
  if (role == null) return false;
  return _managerRoles.contains(role.toLowerCase().replaceAll(RegExp(r'[\s-]'), '_'));
}
