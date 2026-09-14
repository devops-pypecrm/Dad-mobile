import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_health.freezed.dart';
part 'lead_health.g.dart';

/// `GET /api/analytics/lead-health` response
/// (Dad-backend/src/controllers/analyticsController.ts:1638-1693). Backs
/// the Dashboard's "Unattended Leads"/"No Activity Leads" tiles — same
/// figures Dad-frontend's `LeadHealthAlerts.tsx` shows.
///
/// `unattendedLeads`: `status: 'new'` AND assigned to someone AND zero
/// interactions ever logged. `noActivityLeads`: still open (not
/// converted/lost) AND no update AND no interaction in the last 30 days.
/// Both counts are already scoped server-side by the caller's visibility
/// (admin/super_admin see the whole org, everyone else only their own/
/// subordinates' leads) — nothing here recomputes that.
@freezed
class LeadHealth with _$LeadHealth {
  const factory LeadHealth({
    @Default(0) int unattendedLeads,
    @Default(0) int noActivityLeads,
  }) = _LeadHealth;

  factory LeadHealth.fromJson(Map<String, dynamic> json) => _$LeadHealthFromJson(json);
}
