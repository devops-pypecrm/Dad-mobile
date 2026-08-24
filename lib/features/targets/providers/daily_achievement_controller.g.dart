// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_achievement_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailyAchievementControllerHash() =>
    r'01ebfee6192bd851204af4a438daf1f8e6abb0ed';

/// Fetched once per app session (keepAlive) — the backend itself tracks
/// `lastNotifiedDate` server-side, so this doesn't need to re-poll; the UI
/// just needs to know once, on launch, whether to show the daily prompt.
///
/// Copied from [DailyAchievementController].
@ProviderFor(DailyAchievementController)
final dailyAchievementControllerProvider =
    AsyncNotifierProvider<
      DailyAchievementController,
      DailyAchievement
    >.internal(
      DailyAchievementController.new,
      name: r'dailyAchievementControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dailyAchievementControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DailyAchievementController = AsyncNotifier<DailyAchievement>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
