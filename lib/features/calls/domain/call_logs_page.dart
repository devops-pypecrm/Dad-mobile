import 'package:freezed_annotation/freezed_annotation.dart';

import 'call_log.dart';

part 'call_logs_page.freezed.dart';
part 'call_logs_page.g.dart';

/// `GET /api/calls` response — `{ calls, pagination: { page, limit, total, totalPages } }`
/// (Dad-backend/src/controllers/callController.ts:240-390).
@freezed
class CallLogsPage with _$CallLogsPage {
  const factory CallLogsPage({
    @Default(<CallLog>[]) List<CallLog> calls,
    required CallLogsPagination pagination,
  }) = _CallLogsPage;

  factory CallLogsPage.fromJson(Map<String, dynamic> json) => _$CallLogsPageFromJson(json);
}

@freezed
class CallLogsPagination with _$CallLogsPagination {
  const factory CallLogsPagination({
    @Default(1) int page,
    @Default(20) int limit,
    @Default(0) int total,
    @Default(1) int totalPages,
  }) = _CallLogsPagination;

  factory CallLogsPagination.fromJson(Map<String, dynamic> json) => _$CallLogsPaginationFromJson(json);
}
