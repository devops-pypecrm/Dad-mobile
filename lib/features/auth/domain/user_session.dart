import 'package:freezed_annotation/freezed_annotation.dart';

import 'organisation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

/// The exact response shape of `POST /api/auth/login` and `GET /api/auth/me`
/// (Dad-backend/src/controllers/authController.ts). The JWT itself only
/// encodes `{ id }` — `organisation`/`role` are never decoded client-side,
/// they come straight from this payload and are persisted alongside the
/// token, mirroring Dad-frontend/src/services/api.ts.
@freezed
class UserSession with _$UserSession {
  const UserSession._();

  const factory UserSession({
    required String id,
    required String firstName, 
    required String lastName,
    required String email,
    required String role,
    /// Job Title / Position (`User.position` on the backend) — distinct from
    /// `role`, which drives permissions. Nullable: most seeded/older users
    /// never had it set. See `UserSession.displayTitle` for the fallback.
    String? position,
    @Default(false) bool isBranchManager,
    required Organisation organisation,
    String? branchId,
    /// Present on the login response; absent on `/auth/me` refreshes, in
    /// which case the previously stored token is kept.
    String? token,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) => _$UserSessionFromJson(json);

  /// Every tenant-scoped request relies on this — the backend derives it
  /// server-side from the JWT, but the mobile UI needs it too (e.g. to
  /// label the active organisation, or as a defensive check before caching).
  String get organisationId => organisation.id;

  /// Job Title / Position if the user has one set, else the `role` string
  /// formatted the same way Dad-frontend displays it (title-cased,
  /// underscores replaced with spaces — see Sidebar.tsx/team settings'
  /// `capitalize` + `.replace('_',' ')` on the raw role string; there's no
  /// role->label lookup table on either client, web included).
  /// Single-letter fallback avatar content — there's no profile-photo
  /// upload feature on mobile (or web, see Dad-frontend/src/components/
  /// shared/Header.tsx's AvatarFallback), so this is what stands in for a
  /// real picture wherever one would normally show.
  String get initial {
    final name = firstName.trim();
    if (name.isNotEmpty) return name[0].toUpperCase();
    final mail = email.trim();
    return mail.isNotEmpty ? mail[0].toUpperCase() : '?';
  }

  String get displayTitle {
    final title = position?.trim();
    if (title != null && title.isNotEmpty) return title;
    return role
        .split('_')
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join(' ');
  }
}
