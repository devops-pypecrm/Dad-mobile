import 'package:freezed_annotation/freezed_annotation.dart';

import 'account.dart';

part 'accounts_page.freezed.dart';
part 'accounts_page.g.dart';

/// `GET /api/accounts` response shape — `{ accounts, page, pages, total }`
/// (Dad-backend/src/controllers/accountController.ts).
@freezed
class AccountsPage with _$AccountsPage {
  const factory AccountsPage({
    required List<Account> accounts,
    required int page,
    required int pages,
    required int total,
  }) = _AccountsPage;

  factory AccountsPage.fromJson(Map<String, dynamic> json) => _$AccountsPageFromJson(json);
}
