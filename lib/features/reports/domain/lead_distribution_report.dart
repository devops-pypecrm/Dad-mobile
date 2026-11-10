/// `GET /api/reports/lead-distribution` response
/// (Dad-backend/src/controllers/reportController.ts `getLeadDistributionReport`).
/// Deliberately a plain class with a hand-written `fromJson`, not
/// freezed/json_serializable — this project's build_runner has a known
/// issue (deletes all generated `.g.dart`/`.freezed.dart` files before
/// crashing on an unrelated analyzer/SDK version mismatch), so new models
/// avoid codegen entirely rather than risk hand-patching generated output
/// incorrectly.
class LeadDistributionReport {
  const LeadDistributionReport({required this.total, required this.byUser, required this.byDate});

  final int total;
  final List<LeadDistributionUserRow> byUser;
  final List<LeadDistributionDateRow> byDate;

  factory LeadDistributionReport.fromJson(Map<String, dynamic> json) {
    final summary = (json['summary'] as Map<String, dynamic>?) ?? const {};
    return LeadDistributionReport(
      total: (summary['total'] as num?)?.toInt() ?? 0,
      byUser: ((summary['byUser'] as List?) ?? const [])
          .map((e) => LeadDistributionUserRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      byDate: ((summary['byDate'] as List?) ?? const [])
          .map((e) => LeadDistributionDateRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class LeadDistributionUserRow {
  const LeadDistributionUserRow({
    required this.userId,
    required this.userName,
    required this.branch,
    required this.count,
  });

  final String userId;
  final String userName;
  final String branch;
  final int count;

  factory LeadDistributionUserRow.fromJson(Map<String, dynamic> json) => LeadDistributionUserRow(
        userId: json['userId'] as String? ?? '',
        userName: json['userName'] as String? ?? 'Unknown',
        branch: json['branch'] as String? ?? 'N/A',
        count: (json['count'] as num?)?.toInt() ?? 0,
      );
}

class LeadDistributionDateRow {
  const LeadDistributionDateRow({required this.date, required this.count});

  /// `yyyy-MM-dd`, as returned by the backend.
  final String date;
  final int count;

  factory LeadDistributionDateRow.fromJson(Map<String, dynamic> json) => LeadDistributionDateRow(
        date: json['date'] as String? ?? '',
        count: (json['count'] as num?)?.toInt() ?? 0,
      );
}
