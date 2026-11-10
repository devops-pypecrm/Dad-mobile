/// One row of `GET /api/campaigns` (`response.data.campaigns`, same
/// endpoint Dad-frontend's `getEmailCampaigns` in `marketingService.ts`
/// hits) — email campaign summary used by the Campaigns report. Plain
/// class with a hand-written `fromJson`; see
/// `lead_distribution_report.dart`'s doc comment for why.
class CampaignReportRow {
  const CampaignReportRow({
    required this.id,
    required this.name,
    this.subject,
    required this.status,
    this.sent,
    this.opened,
    this.clicked,
    this.createdAt,
  });

  final String id;
  final String name;
  final String? subject;
  final String status;
  final int? sent;
  final int? opened;
  final int? clicked;
  final DateTime? createdAt;

  factory CampaignReportRow.fromJson(Map<String, dynamic> json) {
    final stats = json['stats'] as Map<String, dynamic>?;
    final createdAtStr = json['createdAt'] as String?;
    return CampaignReportRow(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Untitled campaign',
      subject: json['subject'] as String?,
      status: json['status'] as String? ?? 'draft',
      sent: (stats?['sent'] as num?)?.toInt(),
      opened: (stats?['opened'] as num?)?.toInt(),
      clicked: (stats?['clicked'] as num?)?.toInt(),
      createdAt: createdAtStr == null ? null : DateTime.tryParse(createdAtStr),
    );
  }
}
