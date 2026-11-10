/// `GET /api/audit-logs` response (Dad-backend/src/controllers/
/// auditController.ts `getAuditLogs`) — admin/manager-only endpoint. Plain
/// class with a hand-written `fromJson`, not freezed/json_serializable —
/// see `lead_distribution_report.dart`'s doc comment for why new models in
/// this feature avoid codegen.
class AuditLogsReport {
  const AuditLogsReport({required this.summary, required this.logs});

  final AuditLogSummary summary;
  final List<AuditLogEntry> logs;

  factory AuditLogsReport.fromJson(Map<String, dynamic> json) => AuditLogsReport(
        summary: AuditLogSummary.fromJson((json['summary'] as Map<String, dynamic>?) ?? const {}),
        logs: ((json['logs'] as List?) ?? const [])
            .map((e) => AuditLogEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class AuditLogSummary {
  const AuditLogSummary({
    required this.total,
    required this.creates,
    required this.updates,
    required this.deletes,
    required this.logins,
  });

  final int total;
  final int creates;
  final int updates;
  final int deletes;
  final int logins;

  factory AuditLogSummary.fromJson(Map<String, dynamic> json) => AuditLogSummary(
        total: (json['total'] as num?)?.toInt() ?? 0,
        creates: (json['creates'] as num?)?.toInt() ?? 0,
        updates: (json['updates'] as num?)?.toInt() ?? 0,
        deletes: (json['deletes'] as num?)?.toInt() ?? 0,
        logins: (json['logins'] as num?)?.toInt() ?? 0,
      );
}

class AuditLogEntry {
  const AuditLogEntry({
    required this.id,
    required this.action,
    required this.entity,
    this.entityId,
    this.details,
    required this.createdAt,
    this.actorName,
    this.actorBranch,
  });

  final String id;
  final String action;
  final String entity;
  final String? entityId;
  final Map<String, dynamic>? details;
  final DateTime createdAt;
  final String? actorName;
  final String? actorBranch;

  factory AuditLogEntry.fromJson(Map<String, dynamic> json) {
    final actor = json['actor'] as Map<String, dynamic>?;
    final actorFirst = actor?['firstName'] as String?;
    final actorLast = actor?['lastName'] as String?;
    final branch = actor?['branch'] as Map<String, dynamic>?;
    return AuditLogEntry(
      id: json['id'] as String? ?? '',
      action: json['action'] as String? ?? '',
      entity: json['entity'] as String? ?? '',
      entityId: json['entityId'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
      actorName: actor == null ? null : '${actorFirst ?? ''} ${actorLast ?? ''}'.trim(),
      actorBranch: branch?['name'] as String?,
    );
  }
}
