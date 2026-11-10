/// One won deal counted toward a target — `GET /api/sales-targets/:id/won-deals`.
class TargetWonDeal {
  const TargetWonDeal({
    required this.id,
    required this.name,
    required this.amount,
    this.accountName,
    this.ownerName,
    this.closedAt,
  });

  final String id;
  final String name;
  final double amount;
  final String? accountName;
  final String? ownerName;
  final DateTime? closedAt;

  factory TargetWonDeal.fromJson(Map<String, dynamic> json) => TargetWonDeal(
        id: json['id'] as String,
        name: (json['name'] as String?) ?? '',
        amount: (json['amount'] as num?)?.toDouble() ?? 0,
        accountName: json['accountName'] as String?,
        ownerName: json['ownerName'] as String?,
        closedAt: json['closedAt'] == null ? null : DateTime.tryParse(json['closedAt'] as String)?.toLocal(),
      );
}
