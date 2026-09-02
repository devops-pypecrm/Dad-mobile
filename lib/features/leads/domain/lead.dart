import 'package:freezed_annotation/freezed_annotation.dart';

import 'lead_assignee.dart';
import 'lead_product.dart';
import 'lead_source_details.dart';

part 'lead.freezed.dart';
part 'lead.g.dart';

/// Statuses that unlock backend-side special behavior — see
/// Dad-backend/src/controllers/leadController.ts:649: a lead cannot move to
/// either of these without at least one associated product.
const kProductGatedStatuses = {'qualified', 'converted'};

/// User-selectable subset of the backend's `LeadSource` enum
/// (Dad-backend/prisma/schema.prisma:1301-1318) — mirrors the dropdown in
/// Dad-frontend/src/components/shared/QuickAddLeadDialog.tsx. The full enum
/// also has `api`/`whatsapp`/`meta_leadgen`/`facebook_payload`/
/// `lead_squared`/`zapier`, but those are system-assigned on both web and
/// mobile, never user-chosen.
const kSelectableLeadSources = [
  'manual',
  'website',
  'referral',
  'cold_call',
  'social_media',
  'email_campaign',
  'meta_ads',
  'google_ads',
  'import',
  'other',
];

/// Mirrors `Dad-backend/prisma/schema.prisma`'s `Lead` model (the subset the
/// mobile client displays/edits). `status`/`source` are free strings on the
/// backend, not bound enums — see Dad-backend/CLAUDE.md gotchas. `products`
/// is only populated by `GET /api/leads/:id`, never by the list endpoint.
@freezed
class Lead with _$Lead {
  const Lead._();

  const factory Lead({
    required String id,
    @Default('') String firstName,
    String? lastName,
    String? email,
    required String phone,
    String? secondaryPhone,
    String? company,
    String? jobTitle,
    String? enquiryAbout,
    @Default('new') String status,
    @Default('manual') String source,
    LeadSourceDetails? sourceDetails,
    @Default(0) double potentialValue,
    @Default(0) int leadScore,
    @Default(false) bool isHotLead,
    @Default(<String>[]) List<String> tags,
    @Default(false) bool isReEnquiry,
    @Default(0) int reEnquiryCount,
    DateTime? lastEnquiryDate,
    DateTime? nextFollowUp,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? branchId,
    LeadAssignee? assignedTo,
    List<LeadProductItem>? products,
  }) = _Lead;

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);

  String get fullName {
    final name = [
      firstName,
      lastName,
    ].where((p) => p != null && p.trim().isNotEmpty).join(' ');
    return name.isEmpty ? phone : name;
  }

  bool get hasProducts => (products ?? const []).isNotEmpty;

  bool get isStatusGatedByProducts => kProductGatedStatuses.contains(status);

  /// `api`-sourced leads carry their real origin in `sourceDetails.originalSource`
  /// (e.g. a specific integration) — same relabeling as
  /// Dad-frontend/src/pages/leads/[id].tsx:508-509.
  String get displaySource {
    if (source == 'api' && (sourceDetails?.originalSource ?? '').isNotEmpty) {
      return sourceDetails!.originalSource!;
    }
    return source;
  }

  String? get campaignName =>
      sourceDetails?.campaignName ?? sourceDetails?.metaCampaignName;
}
