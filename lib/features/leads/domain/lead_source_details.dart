import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_source_details.freezed.dart';
part 'lead_source_details.g.dart';

/// `Lead.sourceDetails` (Json on the backend) — only the 3 keys anything
/// actually reads: `campaignName`/`metaCampaignName` (shown as a chip on
/// web's list/detail, Dad-frontend/src/pages/leads/index.tsx:286-289) and
/// `originalSource` (used to relabel `source: 'api'` leads,
/// Dad-frontend/src/pages/leads/[id].tsx:508-509). The backend writes other
/// keys too (Meta lead-ad metadata etc.) that nothing in either client
/// reads — not modeled here.
@freezed
class LeadSourceDetails with _$LeadSourceDetails {
  const factory LeadSourceDetails({
    String? campaignName,
    String? metaCampaignName,
    String? originalSource,
  }) = _LeadSourceDetails;

  factory LeadSourceDetails.fromJson(Map<String, dynamic> json) => _$LeadSourceDetailsFromJson(json);
}
