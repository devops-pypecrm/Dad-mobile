/// Result of `POST /api/leads/:id/convert`
/// (Dad-backend/src/controllers/leadController.ts `convertLead`) — that
/// endpoint's real work (creating/reusing an Account, creating a Contact
/// and Opportunity, migrating LeadProducts/Interactions/Tasks, updating
/// Lead.status) is a black-box server transaction; the mobile client only
/// needs the new Opportunity's id to navigate there afterward.
class ConvertLeadResult {
  const ConvertLeadResult({required this.opportunityId});

  final String opportunityId;

  factory ConvertLeadResult.fromJson(Map<String, dynamic> json) {
    final opportunity = json['opportunity'] as Map<String, dynamic>;
    return ConvertLeadResult(opportunityId: opportunity['id'] as String);
  }
}
