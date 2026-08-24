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
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      final result = await repository.createLead(
        phone: phone,
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
      // Refresh the list in the background so the new/updated lead shows up.
      ref.read(leadsListProvider.notifier).refresh();
      return result;
    });
  }

  void reset() => state = const AsyncValue.data(null);
}
