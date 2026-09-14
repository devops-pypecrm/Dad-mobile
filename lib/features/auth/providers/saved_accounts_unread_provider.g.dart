// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_accounts_unread_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedAccountsUnreadCountsHash() =>
    r'56ad6f2aacb28ab466c5c04806a52b94171343a8';

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
///
/// Copied from [savedAccountsUnreadCounts].
@ProviderFor(savedAccountsUnreadCounts)
final savedAccountsUnreadCountsProvider =
    AutoDisposeFutureProvider<Map<String, int>>.internal(
      savedAccountsUnreadCounts,
      name: r'savedAccountsUnreadCountsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$savedAccountsUnreadCountsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedAccountsUnreadCountsRef =
    AutoDisposeFutureProviderRef<Map<String, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
