import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/opportunities_repository.dart';
import '../domain/opportunity_note.dart';

part 'opportunity_notes_controller.g.dart';

@riverpod
Future<List<OpportunityNote>> opportunityNotes(
  AutoDisposeFutureProviderRef<List<OpportunityNote>> ref,
  String opportunityId,
) {
  final repository = ref.watch(opportunitiesRepositoryProvider);
  return repository.getOpportunityNotes(opportunityId);
}

@riverpod
class OpportunityNotesController extends _$OpportunityNotesController {
  @override
  FutureOr<void> build(String opportunityId) {}

  Future<void> addNote(String description) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(opportunitiesRepositoryProvider);
      await repository.addOpportunityNote(opportunityId, description);
      ref.invalidate(opportunityNotesProvider(opportunityId));
    });
  }
}
