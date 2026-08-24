import 'package:freezed_annotation/freezed_annotation.dart';

import 'opportunity.dart';

part 'opportunities_page.freezed.dart';
part 'opportunities_page.g.dart';

/// `GET /api/opportunities` response shape:
/// `{ opportunities, page, totalPages, totalOpportunities }`
/// (Dad-backend/src/controllers/opportunityController.ts) — note this uses
/// different pagination field names than both Leads (`pages`/`total`) and
/// Accounts (`pages`/`total`); Opportunities alone uses `totalPages`/`totalOpportunities`.
@freezed
class OpportunitiesPage with _$OpportunitiesPage {
  const factory OpportunitiesPage({
    required List<Opportunity> opportunities,
    required int page,
    required int totalPages,
    required int totalOpportunities,
  }) = _OpportunitiesPage;

  factory OpportunitiesPage.fromJson(Map<String, dynamic> json) => _$OpportunitiesPageFromJson(json);
}
