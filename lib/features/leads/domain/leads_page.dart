import 'package:freezed_annotation/freezed_annotation.dart';

import 'lead.dart';

part 'leads_page.freezed.dart';
part 'leads_page.g.dart';

/// `GET /api/leads` response shape — `{ leads, page, pages, total }`
/// (Dad-backend/src/controllers/leadController.ts:173). Note the key is
/// `pages`, not `totalPages`.
@freezed
class LeadsPage with _$LeadsPage {
  const factory LeadsPage({
    required List<Lead> leads,
    required int page,
    required int pages,
    required int total,
  }) = _LeadsPage;

  factory LeadsPage.fromJson(Map<String, dynamic> json) => _$LeadsPageFromJson(json);
}
