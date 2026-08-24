import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/accounts_repository.dart';
import '../domain/account.dart';

part 'account_detail_provider.g.dart';

@riverpod
Future<Account> accountDetail(AutoDisposeFutureProviderRef<Account> ref, String id) {
  final repository = ref.watch(accountsRepositoryProvider);
  return repository.getAccountById(id);
}
