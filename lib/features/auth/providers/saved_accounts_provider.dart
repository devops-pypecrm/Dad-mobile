import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user_session.dart';
import 'session_provider.dart';

part 'saved_accounts_provider.g.dart';

/// Every logged-in-but-not-active account saved on this device — the list
/// the account switcher screen renders. Not `keepAlive` — callers
/// `ref.invalidate(savedAccountsProvider)` after add/switch/remove, same
/// invalidate-after-mutate pattern used everywhere else in this app, so
/// there's no need to keep this alive across screens.
@riverpod
Future<List<UserSession>> savedAccounts(FutureProviderRef<List<UserSession>> ref) =>
    ref.watch(sessionControllerProvider.notifier).loadSavedAccounts();
