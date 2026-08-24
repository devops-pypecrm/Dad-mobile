import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../../dashboard/domain/sales_target.dart';
import '../domain/daily_achievement.dart';
import '../domain/team_target.dart';

part 'targets_repository.g.dart';

@Riverpod(keepAlive: true)
TargetsRepository targetsRepository(ProviderRef<TargetsRepository> ref) =>
    TargetsRepository(ref.watch(dioProvider));

/// Talks to Dad-backend's `/api/sales-targets` routes
/// (Dad-backend/src/controllers/salesTargetController.ts). All target math
/// (achievedValue, achievementPercent, auto-increment on closed_won) is
/// server-side — this repository only fetches and displays.
class TargetsRepository {
  TargetsRepository(this._dio);

  final Dio _dio;

  Future<List<SalesTarget>> getMyTargets() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/sales-targets');
      final list = (response.data!['targets'] as List).cast<Map<String, dynamic>>();
      return list.map(SalesTarget.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Only meaningful for managers/admins — the backend scopes this to the
  /// caller's subordinates regardless of who calls it.
  Future<List<TeamTarget>> getTeamTargets() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/sales-targets/team');
      final list = (response.data!['targets'] as List).cast<Map<String, dynamic>>();
      return list.map(TeamTarget.fromJson).toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<DailyAchievement> getDailyAchievement() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/sales-targets/daily');
      return DailyAchievement.fromJson(response.data!);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> acknowledgeDailyNotification() async {
    try {
      await _dio.post<void>('/sales-targets/daily/acknowledge');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
