// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_day_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myDayHash() => r'36966a27073b22ed2316441fd9fb1c0ea833eaf9';

/// "My Day" — today's follow-ups. Loads the backend's default view (omitting
/// `status` forwards to the server default of `not_started`/`in_progress`,
/// see Dad-backend/src/controllers/followUpController.ts). The
/// overdue/today/upcoming `counts` block is server-computed truth; this
/// notifier does not recompute those numbers itself.
///
/// Copied from [MyDay].
@ProviderFor(MyDay)
final myDayProvider = AsyncNotifierProvider<MyDay, FollowUpsPage>.internal(
  MyDay.new,
  name: r'myDayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyDay = AsyncNotifier<FollowUpsPage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
