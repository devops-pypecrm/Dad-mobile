import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_log_person.freezed.dart';
part 'call_log_person.g.dart';

/// `createdBy` on a call log — `{ id, firstName, lastName, email }`.
@freezed
class CallLogAgent with _$CallLogAgent {
  const CallLogAgent._();

  const factory CallLogAgent({
    required String id,
    required String firstName,
    String? lastName,
    String? email,
  }) = _CallLogAgent;

  factory CallLogAgent.fromJson(Map<String, dynamic> json) => _$CallLogAgentFromJson(json);

  String get fullName => [firstName, lastName].where((p) => p != null && p.trim().isNotEmpty).join(' ');
}

/// `lead` on a call log — `{ id, firstName, lastName, phone, company }`.
@freezed
class CallLogLead with _$CallLogLead {
  const CallLogLead._();

  const factory CallLogLead({
    required String id,
    String? firstName,
    String? lastName,
    String? phone,
    String? company,
  }) = _CallLogLead;

  factory CallLogLead.fromJson(Map<String, dynamic> json) => _$CallLogLeadFromJson(json);

  String get displayName {
    final name = [firstName, lastName].where((p) => p != null && p.trim().isNotEmpty).join(' ');
    if (name.isNotEmpty) return name;
    return company ?? 'Unknown';
  }
}

/// `contact` on a call log — `{ id, firstName, lastName }`.
@freezed
class CallLogContact with _$CallLogContact {
  const CallLogContact._();

  const factory CallLogContact({
    required String id,
    String? firstName,
    String? lastName,
  }) = _CallLogContact;

  factory CallLogContact.fromJson(Map<String, dynamic> json) => _$CallLogContactFromJson(json);

  String get displayName => [firstName, lastName].where((p) => p != null && p.trim().isNotEmpty).join(' ');
}
