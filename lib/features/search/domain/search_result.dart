import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

/// One item of `GET /api/search/global`'s `data.results[]`
/// (Dad-backend/src/controllers/searchController.ts). `type` is a free
/// string discriminator: lead | contact | account | opportunity | task.
@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String id,
    required String type,
    required String title,
    String? subtitle,
    String? description,
    String? status,
    double? value,
    String? assignedTo,
    DateTime? createdAt,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);
}
