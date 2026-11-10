import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/create_lead_result.dart';
import 'leads_list_provider.dart';

part 'create_lead_controller.g.dart';

@riverpod
class CreateLeadController extends _$CreateLeadController {
  @override
  FutureOr<CreateLeadResult?> build() => null;

  Future<void> submit({
    required String phone,
    String? phoneCountryCode,
    String? firstName,
    String? lastName,
    String? email,
    String? secondaryPhone,
    String? company,
    String? jobTitle,
    String? enquiryAbout,
    String? source,
    String? status,
    String? assignedTo,
    double? potentialValue,
    String? note,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      final result = await repository.createLead(
        phone: phone,
        phoneCountryCode: phoneCountryCode,
        firstName: firstName,
        lastName: lastName,
        email: email,
        secondaryPhone: secondaryPhone,
        company: company,
        jobTitle: jobTitle,
        enquiryAbout: enquiryAbout,
        source: source,
        status: status,
        assignedTo: assignedTo,
        potentialValue: potentialValue,
      );
      // Optional first note — a separate call, same as the lead-detail
      // screen's own "Add note" action (`addLeadNote`), since lead creation
      // itself has no note field. Best-effort: swallow a note failure so it
      // can't turn an otherwise-successful lead creation into a reported
      // error (the lead is already saved by this point).
      if (note != null && note.trim().isNotEmpty) {
        try {
          await repository.addLeadNote(result.lead.id, note.trim());
        } catch (_) {
          // Ignored — the lead itself was created successfully.
        }
      }
      // Refresh the list in the background so the new/updated lead shows up.
      ref.read(leadsListProvider.notifier).refresh();
      return result;
    });
  }

  void reset() => state = const AsyncValue.data(null);
}
