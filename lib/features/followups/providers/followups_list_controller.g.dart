// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followups_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followUpsListControllerHash() =>
    r'66c824d7a673cb426cd95e1ee8b05475bb07c4c6';

/// Backs the Follow Ups tab.
///
/// The backend sorts every `/api/follow-ups` response `dueDate asc` and
/// gives no way to filter or jump directly to a date — the only levers are
/// `page`/`limit` (raw offset pagination) and the always-accurate
/// `counts: { active, overdue, today, upcoming }` on every response
/// (computed independently of pagination — any page, any status filter,
/// same scope, returns the same counts). Combined, that's enough to fetch
/// the *correct* slice for a given "when" bucket without downloading
/// everything:
///
/// - Overdue is items `[0, counts.overdue)` — always first, since it's the
///   earliest due dates.
/// - Today is `[counts.overdue, counts.overdue + counts.today)`.
/// - Upcoming is `[counts.overdue + counts.today, ...)`.
///
/// A flat `fetch the first N, filter client-side` approach (what this used
/// to do) breaks the instant `counts.overdue` alone exceeds N — every
/// fetched row is overdue, so Today/Upcoming silently render as empty even
/// though their server-reported counts are correct and non-zero. This is
/// exactly the bug reported against a real org with a large overdue
/// backlog. [_fetchWindow] fixes it by computing which page(s) actually
/// contain the requested bucket and fetching only those.
///
/// Copied from [FollowUpsListController].
@ProviderFor(FollowUpsListController)
final followUpsListControllerProvider =
    AsyncNotifierProvider<FollowUpsListController, FollowUpsListState>.internal(
      FollowUpsListController.new,
      name: r'followUpsListControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$followUpsListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FollowUpsListController = AsyncNotifier<FollowUpsListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
