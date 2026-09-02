import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/interaction.dart';

part 'lead_notes_controller.g.dart';

@riverpod
Future<List<Interaction>> leadInteractions(
  AutoDisposeFutureProviderRef<List<Interaction>> ref,
  String leadId,
) {
  final repository = ref.watch(leadsRepositoryProvider);
  return repository.getLeadInteractions(leadId);
}

/// Adding a note only ever needs a loading/error flag — the note list
/// itself lives in [leadInteractionsProvider], invalidated on success.
@riverpod
class LeadNotesController extends _$LeadNotesController {
  @override
  FutureOr<void> build(String leadId) {}

  Future<void> addNote(String description) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(leadsRepositoryProvider);
      await repository.addLeadNote(leadId, description);
      ref.invalidate(leadInteractionsProvider(leadId));
    });
  }
}
