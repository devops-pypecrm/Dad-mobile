import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../notifications/data/notifications_repository.dart';
import 'saved_accounts_provider.dart';

part 'saved_accounts_unread_provider.g.dart';

/// Unread notification count per saved (not currently active) account, so
/// the drawer and the account switcher screen can show "this saved account
/// still has unread notifications waiting" even though push only ever
/// reaches whichever account is active (see
/// `NotificationsRepository.unreadCountForAccount`'s doc comment for why).
/// Not `keepAlive` — recomputed fresh each time something watches it again
/// (i.e. each time the drawer/switcher screen opens), same "refreshed next
/// time you open it" scope as the rest of this feature; real-time push for
/// inactive accounts isn't possible without a backend change (see
/// `SessionController`'s multi-account doc comments).
@riverpod
Future<Map<String, int>> savedAccountsUnreadCounts(FutureProviderRef<Map<String, int>> ref) async {
  final accounts = await ref.watch(savedAccountsProvider.future);
  final entries = await Future.wait(accounts.map((account) async {
    final token = account.token;
    if (token == null) return MapEntry(account.id, 0);
    final count = await NotificationsRepository.unreadCountForAccount(token);
    return MapEntry(account.id, count);
  }));
  return Map.fromEntries(entries);
}
