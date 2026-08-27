import 'package:freezed_annotation/freezed_annotation.dart';

part 'organisation.freezed.dart';
part 'organisation.g.dart';

/// Mirrors the subset of Prisma's `Organisation` model (Dad-backend/prisma/schema.prisma)
/// the mobile client needs. Extra backend fields are ignored on parse.
@freezed
class Organisation with _$Organisation {
  const factory Organisation({
    required String id,
    required String name,
    String? slug,
    String? logo,
    String? currency,
    /// Custom per-org lead pipeline config (`{ id, label, color?, isDefault? }[]`).
    /// `Lead.status` on the backend is a free string keyed off this, not a
    /// fixed enum — see Dad-backend/CLAUDE.md. May be null/empty for orgs
    /// that never configured a custom pipeline.
    List<LeadStatusOption>? leadStatuses,
    /// Same idea as [leadStatuses] but for `Opportunity.stage` — backend
    /// field is `opportunityLeadStatuses` (Dad-backend/CLAUDE.md flags this
    /// as the same free-string-keyed-off-org-config pattern as leads). May
    /// be null/empty for orgs that never configured a custom pipeline.
    @JsonKey(name: 'opportunityLeadStatuses') List<LeadStatusOption>? opportunityStages,
  }) = _Organisation;

  factory Organisation.fromJson(Map<String, dynamic> json) => _$OrganisationFromJson(json);
}

@freezed
class LeadStatusOption with _$LeadStatusOption {
  const factory LeadStatusOption({
    required String id,
    String? label,
    String? color,
    @Default(false) bool isDefault,
  }) = _LeadStatusOption;

  factory LeadStatusOption.fromJson(Map<String, dynamic> json) => _$LeadStatusOptionFromJson(json);
}
