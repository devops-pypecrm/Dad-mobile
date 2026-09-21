import '../../auth/domain/organisation.dart';

/// The system-only "Shuffled" status the round-robin shuffler stamps on a
/// lead (`shuffled_lead` — Dad-backend/src/services/shuffler-module/shufflerService.ts).
/// It is never part of an org's configured `leadStatuses` pipeline, so
/// without this it shows up as a raw, uncolored "shuffled_lead" id anywhere
/// the app displays or filters by status. Mirrors the web app's client-side
/// injection (Dad-frontend/src/hooks/useLeadStatuses.ts) — same id, label,
/// and color — so a shuffled lead looks identical on both platforms.
const shuffledLeadStatus = LeadStatusOption(
  id: 'shuffled_lead',
  label: 'Shuffled',
  color: '#8b5cf6',
);

/// The org's lead pipeline plus [shuffledLeadStatus], for anywhere a lead's
/// status needs to be *displayed* or *filtered on* (status badges, the
/// Leads filter sheet). Not for a *manual* status picker — like the web
/// app's `selectableStatuses`, shuffled is a system marker a user shouldn't
/// be able to hand-pick, so `_pickStatus` (lead_detail_screen.dart) and
/// [LeadStatusField] intentionally don't use this.
List<LeadStatusOption> withShuffledStatus(List<LeadStatusOption>? base) {
  final options = base ?? const [];
  if (options.any((o) => o.id == shuffledLeadStatus.id)) return options;
  return [...options, shuffledLeadStatus];
}
