import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/opportunities_page.dart';
import '../domain/opportunity.dart';
import '../domain/opportunity_note.dart';

part 'opportunities_repository.g.dart';

@Riverpod(keepAlive: true)
OpportunitiesRepository opportunitiesRepository(ProviderRef<OpportunitiesRepository> ref) =>
    OpportunitiesRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/opportunities` routes
/// (Dad-backend/src/controllers/opportunityController.ts). Tier 1 core
/// detail actions: stage change, edit (amount/probability/close date),
/// inline linked-lead status sync, amount-sync-to-products, and notes.
/// Deliberately NOT covered: Create/Delete, Close Won/Lost with EMI/
/// payment-type flows, Kanban drag-reorder — those are a separate,
/// larger pass (EMI/payment mutations especially touch real money-tracking
/// business logic that deserves its own scoped review, not a quick add-on
/// here).
class OpportunitiesRepository {
  OpportunitiesRepository(this._dio);

  final Dio _dio;

  Future<OpportunitiesPage> getOpportunities({
    int page = 1,
    int limit = 20,
    String? stage,
    String? search,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/opportunities',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (stage != null && stage.isNotEmpty) 'stage': stage,
          if (search != null && search.isNotEmpty) 'search': search,
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
