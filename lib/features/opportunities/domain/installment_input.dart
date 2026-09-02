/// One manually-entered installment row in the Close Won sheet (Partial or
/// Full EMI payment type) — outgoing-only, no `fromJson` needed. Matches
/// `InstallmentInput` on the backend (Dad-backend/src/services/emiService.ts):
/// `{ dueDate, amount }`, no `installmentNumber` — the server assigns that
/// itself (`index + 1`).
class InstallmentInput {
  const InstallmentInput({required this.dueDate, required this.amount});

  final DateTime dueDate;
  final double amount;

  Map<String, dynamic> toJson() => {
        'dueDate': dueDate.toIso8601String(),
        'amount': amount,
      };
}
