import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/accounts_repository.dart';
import '../domain/account.dart';

part 'accounts_list_provider.g.dart';
part 'accounts_list_provider.freezed.dart';

@freezed
class AccountsListState with _$AccountsListState {
  const factory AccountsListState({
    @Default(<Account>[]) List<Account> accounts,
    @Default(1) int page,
    @Default(1) int pages,
    @Default(false) bool isLoadingMore,
    String? search,
  }) = _AccountsListState;

  const AccountsListState._();

  bool get hasMore => page < pages;
}

@riverpod
class AccountsList extends _$AccountsList {
  @override
  Future<AccountsListState> build() async {
    final repository = ref.watch(accountsRepositoryProvider);
    final result = await repository.getAccounts(page: 1);
    return AccountsListState(accounts: result.accounts, page: result.page, pages: result.pages);
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));
    try {
      final repository = ref.read(accountsRepositoryProvider);
      final result = await repository.getAccounts(page: current.page + 1, search: current.search);
      state = AsyncValue.data(
        current.copyWith(
          accounts: [...current.accounts, ...result.accounts],
          page: result.page,
          pages: result.pages,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> search(String? query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountsRepositoryProvider);
      final result = await repository.getAccounts(page: 1, search: query);
      return AccountsListState(
        accounts: result.accounts,
        page: result.page,
        pages: result.pages,
        search: query,
      );
    });
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountsRepositoryProvider);
      final result = await repository.getAccounts(page: 1, search: current?.search);
      return AccountsListState(
        accounts: result.accounts,
        page: result.page,
        pages: result.pages,
        search: current?.search,
      );
    });
  }
}
