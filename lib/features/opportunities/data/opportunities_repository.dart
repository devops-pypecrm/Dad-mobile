import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/installment_input.dart';
import '../domain/opportunities_page.dart';
import '../domain/opportunity.dart';
import '../domain/opportunity_note.dart';

part 'opportunities_repository.g.dart';

@Riverpod(keepAlive: true)
OpportunitiesRepository opportunitiesRepository(ProviderRef<OpportunitiesRepository> ref) =>
    OpportunitiesRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/opportunities` routes
/// (Dad-backend/src/controllers/opportunityController.ts). Covers: stage
/// change, edit (amount/probability/close date), inline linked-lead status
/// sync, amount-sync-to-products, notes, and Close Won/Lost (including the
/// payment-type/EMI side effects). Deliberately NOT covered: Create/Delete,
/// Kanban drag-reorder, and EMI installment management AFTER closing
/// (marking an installment paid/editing/deleting — those touch the
/// separate `/emi/installments/:id` endpoints, a further pass once the
/// close-deal flow itself is proven).
class OpportunitiesRepository {
  OpportunitiesRepository(this._dio);

  final Dio _dio;

  Future<OpportunitiesPage> getOpportunities({
    int page = 1,
    int limit = 20,
    String? stage,
    String? search,
    String? ownerId,
    String? type,
    String? leadSource,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/opportunities',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (stage != null && stage.isNotEmpty) 'stage': stage,
          if (search != null && search.isNotEmpty) 'search': search,
          if (ownerId != null && ownerId.isNotEmpty) 'ownerId': ownerId,
          if (type != null && type.isNotEmpty) 'type': type,
          if (leadSource != null && leadSource.isNotEmpty) 'leadSource': leadSource,
          if (startDate != null) 'startDate': startDate.toIso8601String(),
          if (endDate != null) 'endDate': endDate.toIso8601String(),
        },
      );
      return OpportunitiesPage.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Opportunity> getOpportunityById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/opportunities/$id');
      return Opportunity.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/opportunities/:id`. Backend refuses (400) any change once
  /// `stage` is already `closed_won`/`closed_lost` — this call surfaces
  /// that as a normal `ApiException`, no client-side guard duplicates it
  /// beyond what `kTerminalOpportunityStages` already flags for hiding the
  /// stage-change affordance in the UI.
  ///
  /// [leadStatus] is a distinct field from [stage] — passing it forwards
  /// onto the linked `Lead.status`, it does not change this Opportunity's
  /// own stage.
  Future<Opportunity> updateOpportunity(
    String id, {
    String? stage,
    double? amount,
    double? probability,
    DateTime? closeDate,
    String? leadStatus,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/opportunities/$id',
        data: {
          if (stage != null) 'stage': stage,
          if (amount != null) 'amount': amount,
          if (probability != null) 'probability': probability,
          if (closeDate != null) 'closeDate': closeDate.toIso8601String(),
          if (leadStatus != null) 'leadStatus': leadStatus,
        },
      );
      return Opportunity.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/opportunities/:id` with `stage: 'closed_won'` — the payment
  /// side effects (Dad-backend/src/controllers/opportunityController.ts:
  /// 370-527) only fire when `paymentType` is present alongside that exact
  /// stage value, so this is deliberately a SEPARATE method from
  /// [updateOpportunity] rather than optional params on it — there's no
  /// valid way to call this with `paymentType` omitted, unlike every other
  /// field there.
  ///
  /// [paymentType] must be exactly `'paid'`, `'partial'`, or `'emi'`
  /// (server-checked strings, not free text):
  /// - `'paid'`: backend pays the entire remaining balance itself — do not
  ///   send [paidAmount]/[installments], they're ignored for this type.
  /// - `'partial'`: [paidAmount] required (the down payment received now).
  ///   [installments] optional — if given, their amounts must sum to
  ///   exactly `opportunity.amount - paidAmount` (0.01 tolerance) or the
  ///   backend 400s; backend requires `paidAmount < amount` for this path
  ///   (EMI conversion needs the opportunity to land in `partial` status).
  /// - `'emi'`: no [paidAmount] (nothing paid yet) — [installments]
  ///   required, amounts must sum to the full `opportunity.amount`.
  Future<Opportunity> closeWon(
    String id, {
    required String paymentType,
    double? paidAmount,
    List<InstallmentInput>? installments,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/opportunities/$id',
        data: {
          'stage': 'closed_won',
          'paymentType': paymentType,
          if (paidAmount != null) 'paidAmount': paidAmount,
          if (installments != null && installments.isNotEmpty)
            'installments': installments.map((i) => i.toJson()).toList(),
        },
      );
      return Opportunity.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `PUT /api/opportunities/:id` with `stage: 'closed_lost'`. Web enforces
  /// a 5-character minimum on [lostReason] client-side before allowing
  /// submit at all (the backend itself doesn't validate it) — mobile
  /// mirrors that same minimum in the sheet's UI, not here, so this method
  /// itself doesn't re-guard it.
  Future<Opportunity> closeLost(String id, {required String lostReason}) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/opportunities/$id',
        data: {'stage': 'closed_lost', 'lostReason': lostReason},
      );
      return Opportunity.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// `POST /api/interactions` (the generic endpoint, unlike leads' path-
  /// scoped one) — `opportunity` is a sibling field alongside `type`, not
  /// nested, per `interactionController.ts`'s `createInteractionGeneric`.
  Future<void> addOpportunityNote(String opportunityId, String description) async {
    try {
      await _dio.post<Map<String, dynamic>>(
        '/interactions',
        data: {
          'opportunity': opportunityId,
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

  /// See [OpportunityNote]'s doc comment: there's no dedicated per-
  /// opportunity listing endpoint, so this reads the generic (org/
  /// hierarchy-scoped, `limit`-capped) notes feed and filters to this
  /// opportunity's id client-side.
  Future<List<OpportunityNote>> getOpportunityNotes(String opportunityId) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/interactions',
        queryParameters: {'type': 'note', 'limit': 50},
      );
      return response.data!
          .cast<Map<String, dynamic>>()
          .map(OpportunityNote.fromJson)
          .where((note) => note.opportunityId == opportunityId)
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
