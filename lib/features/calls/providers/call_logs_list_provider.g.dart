// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_logs_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$callLogsListHash() => r'4290bb50f6c2d1e5a2e8064602195230f2c57a50';

/// Infinite-scroll Call Logs list — same shape as `AccountsList`/`ProductsList`,
/// extended with the same filter set (direction/status/branch/agent) the
/// web `/calls` page offers (Phase 5 follow-up — this list started as
/// search-only).
///
/// Copied from [CallLogsList].
@ProviderFor(CallLogsList)
final callLogsListProvider =
    AutoDisposeAsyncNotifierProvider<CallLogsList, CallLogsListState>.internal(
      CallLogsList.new,
      name: r'callLogsListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$callLogsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CallLogsList = AutoDisposeAsyncNotifier<CallLogsListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
