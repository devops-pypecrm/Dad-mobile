import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/convert_lead_result.dart';
import '../domain/create_lead_result.dart';
import '../domain/interaction.dart';
import '../domain/lead.dart';
import '../domain/lead_product.dart';
import '../domain/leads_page.dart';

part 'leads_repository.g.dart';

@Riverpod(keepAlive: true)
LeadsRepository leadsRepository(ProviderRef<LeadsRepository> ref) =>
    LeadsRepository(ref.watch(dioProvider));

String _isoDate(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

/// Talks to Dad-backend's `/api/leads` routes
/// (Dad-backend/src/controllers/leadController.ts). Visibility (which leads
/// a user can see), round-robin assignment, scoring, and duplicate
/// detection are all server-side — this repository never filters or scores
/// leads itself, it only forwards query params and parses responses.
class LeadsRepository {
  LeadsRepository(this._dio);

  final Dio _dio;

  /// Filters mirror `getLeads` in leadController.ts exactly: [status] is a
  /// free-form pipeline-stage string (org-configurable, not a fixed enum),
  /// [source] must be one of the backend's `LeadSource` enum values,
  /// [assignedTo] is a user id, [branchId] a branch id, [startDate]/
  /// [endDate] filter on `createdAt` (sent as plain `YYYY-MM-DD`, same as
  /// the web app's date picker — the backend applies the IST shift itself).
  Future<LeadsPage> getLeads({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? status,
    String? source,
    String? assignedTo,
    String? branchId,
    DateTime? startDate,
    DateTime? endDate,
    String sortBy = 'updatedAt',
    String sortOrder = 'desc',
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/leads',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          'sortBy': sortBy,
          'sortOrder': sortOrder,
          if (search != null && search.isNotEmpty) 'search': search,
          if (status != null && status.isNotEmpty) 'status': status,
          if (source != null && source.isNotEmpty) 'source': source,
          if (assignedTo != null && assignedTo.isNotEmpty) 'assignedTo': assignedTo,
          if (branchId != null && branchId.isNotEmpty) 'branchId': branchId,
          if (startDate != null) 'startDate': _isoDate(startDate),
          if (endDate != null) 'endDate': _isoDate(endDate),
        },
      );
      return LeadsPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Lead> getLeadById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/leads/$id');
      return Lead.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/leads/re-enquiries` — admin/manager/org_admin only server-side
  /// (`authorize('admin', 'manager', 'org_admin')` in leadRoutes.ts); callers
  /// should gate the entry point with `isManagerRole` rather than let this
  /// 403. No pagination — the backend hard-caps at 50 rows, most-recent
  /// re-enquiry first (`orderBy: { lastEnquiryDate: 'desc' }`), and returns
  /// `{ leads, count }`, not the `{ leads, page, pages, total }` shape
  /// `getLeads` uses.
  Future<List<Lead>> getReEnquiryLeads() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/leads/re-enquiries');
      final list = (response.data!['leads'] as List).cast<Map<String, dynamic>>();
      return list.map(Lead.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Only `phone` is required server-side; everything else is optional —
  /// same fields as Dad-frontend's `QuickAddLeadDialog` (minus org custom
  /// fields, which mobile doesn't render).
  Future<CreateLeadResult> createLead({
    required String phone,
    String? firstName,
    String? lastName,
    String? email,
    String? secondaryPhone,
    String? company,
    String? jobTitle,
    String? enquiryAbout,
    String? source,
    String? status,
    String? assignedTo,
    double? potentialValue,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/leads',
        data: {
          'phone': phone,
          if (firstName != null && firstName.isNotEmpty) 'firstName': firstName,
          if (lastName != null && lastName.isNotEmpty) 'lastName': lastName,
          if (email != null && email.isNotEmpty) 'email': email,
          if (secondaryPhone != null && secondaryPhone.isNotEmpty) 'secondaryPhone': secondaryPhone,
          if (company != null && company.isNotEmpty) 'company': company,
          if (jobTitle != null && jobTitle.isNotEmpty) 'jobTitle': jobTitle,
          if (enquiryAbout != null && enquiryAbout.isNotEmpty) 'enquiryAbout': enquiryAbout,
          if (source != null && source.isNotEmpty) 'source': source,
          if (status != null && status.isNotEmpty) 'status': status,
          if (assignedTo != null && assignedTo.isNotEmpty) 'assignedTo': assignedTo,
          if (potentialValue != null) 'potentialValue': potentialValue,
        },
      );
      return CreateLeadResult.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Sends only the fields provided — matches the backend's `allowedFields`
  /// whitelist (Dad-backend/src/controllers/leadController.ts:737), a
  /// superset of what any single mobile screen needs at once (status change,
  /// edit form, assign picker, follow-up scheduling all funnel through this
  /// one method with different subsets of params). Setting `status` to
  /// `qualified`/`converted` on a lead with zero products is rejected
  /// server-side with a 400; the UI should pre-empt that (see
  /// `Lead.isStatusGatedByProducts`).
  Future<Lead> updateLead(
    String id, {
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? secondaryPhone,
    String? company,
    String? enquiryAbout,
    String? status,
    String? assignedTo,
    DateTime? nextFollowUp,
    double? potentialValue,
    List<LeadProductItem>? products,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/leads/$id',
        data: {
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
          if (email != null) 'email': email,
          if (phone != null) 'phone': phone,
          if (secondaryPhone != null) 'secondaryPhone': secondaryPhone,
          if (company != null) 'company': company,
          if (enquiryAbout != null) 'enquiryAbout': enquiryAbout,
          if (status != null) 'status': status,
          if (assignedTo != null) 'assignedTo': assignedTo,
          if (nextFollowUp != null) 'nextFollowUp': nextFollowUp.toIso8601String(),
          if (potentialValue != null) 'potentialValue': potentialValue,
          // Full-replace, same as Dad-frontend's AddProductToLeadDialog —
          // there's no incremental add/remove endpoint, the whole array is
          // sent every time.
          if (products != null)
            'products': [
              for (final p in products)
                {
                  'productId': p.productId,
                  'quantity': p.quantity,
                  'price': p.price,
                  if (p.customName != null) 'customName': p.customName,
                },
            ],
        },
      );
      return Lead.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `POST /api/leads/:id/convert` — creates/reuses an Account, creates a
  /// Contact and Opportunity, migrates this lead's products/interactions/
  /// tasks, and updates `Lead.status` to `converted` (or `won`/`lost` if
  /// [stage] is a closed one) — all server-side; this call is a black box,
  /// not logic to mirror. Backend hard-blocks with 400 if the lead has zero
  /// products (`Lead.hasProducts`/`kProductGatedStatuses` mirror this
  /// client-side as a pre-emptive UX guard, not the real enforcement).
  Future<ConvertLeadResult> convertLead(
    String id, {
    required String dealName,
    required double amount,
    String? accountName,
    String? contactName,
    String? stage,
    String? lostReason,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/leads/$id/convert',
        data: {
          'dealName': dealName,
          'amount': amount,
          if (accountName != null && accountName.isNotEmpty) 'accountName': accountName,
          if (contactName != null && contactName.isNotEmpty) 'contactName': contactName,
          if (stage != null) 'stage': stage,
          if (lostReason != null) 'lostReason': lostReason,
        },
      );
      return ConvertLeadResult.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `GET /api/interactions/leads/:leadId/interactions` — full activity
  /// feed for this lead (calls/emails/notes/etc, most-recent first); mobile
  /// only ever creates `type: 'note'` rows via [addLeadNote], but shows
  /// whatever's actually there (e.g. call logs from other integrations).
  Future<List<Interaction>> getLeadInteractions(String leadId) async {
    try {
      final response = await _dio.get<List<dynamic>>('/interactions/leads/$leadId/interactions');
      return response.data!.cast<Map<String, dynamic>>().map(Interaction.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `POST /api/interactions/leads/:leadId/interactions` — leadId is implicit
  /// in the URL for this endpoint (unlike the generic `/interactions`
  /// endpoint used for opportunity notes, see OpportunitiesRepository).
  Future<void> addLeadNote(String leadId, String description) async {
    try {
      await _dio.post<Map<String, dynamic>>(
        '/interactions/leads/$leadId/interactions',
        data: {
          'type': 'note',
          'subject': 'Note',
          'description': description,
          'date': DateTime.now().toIso8601String(),
        },
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
