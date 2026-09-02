import 'lead.dart';

/// `POST /api/leads` either creates a new lead (plain `Lead` JSON, HTTP 201)
/// or — if `DuplicateLeadService` matches an existing phone/email — responds
/// 200 with `{ message, lead, isReEnquiry: true, matchedBy, reEnquiryCount }`
/// (Dad-backend/src/controllers/leadController.ts). `isReEnquiry` is absent
/// (not just false) on the normal-create path.
class CreateLeadResult {
  const CreateLeadResult({
    required this.lead,
    required this.isReEnquiry,
    this.reEnquiryCount,
  });

  factory CreateLeadResult.fromJson(Map<String, dynamic> json) {
    final isReEnquiry = json['isReEnquiry'] == true;
    final leadJson = isReEnquiry ? json['lead'] as Map<String, dynamic> : json;
    return CreateLeadResult(
      lead: Lead.fromJson(leadJson),
      isReEnquiry: isReEnquiry,
      reEnquiryCount: json['reEnquiryCount'] as int?,
    );
  }

  final Lead lead;
  final bool isReEnquiry;
  final int? reEnquiryCount;
}
