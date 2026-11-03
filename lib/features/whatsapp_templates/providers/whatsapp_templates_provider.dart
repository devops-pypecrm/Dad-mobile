import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/whatsapp_templates_repository.dart';
import '../domain/whatsapp_template.dart';

part 'whatsapp_templates_provider.g.dart';

/// The signed-in user's own private WhatsApp templates — the backend
/// scopes this list by the caller's user id, so there is nothing else to
/// filter here.
@riverpod
class WhatsAppTemplatesList extends _$WhatsAppTemplatesList {
  @override
  Future<List<WhatsAppTemplate>> build() {
    return ref.watch(whatsAppTemplatesRepositoryProvider).getTemplates();
  }

  Future<void> refresh() async {
    // `invalidateSelf()` + `await future` can hang forever here: if nothing
    // else is actively watching this (autoDispose) provider at the moment
    // of invalidation — e.g. the templates list screen isn't mounted while
    // this is called from the create/edit bottom sheet — the provider can
    // get disposed before the rebuilt future resolves, so this await never
    // completes and the caller (the sheet's "Create template" button) spins
    // forever even though the save itself already succeeded. Fetching and
    // setting state directly avoids relying on self-invalidation timing.
    state = AsyncValue.data(
      await ref.read(whatsAppTemplatesRepositoryProvider).getTemplates(),
    );
  }
}

/// Create/edit/delete for a single template — see `WhatsAppTemplatesList`
/// for the read side.
@riverpod
class WhatsAppTemplateActionsController extends _$WhatsAppTemplateActionsController {
  @override
  FutureOr<void> build() {}

  Future<bool> create({required String title, required String body}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(whatsAppTemplatesRepositoryProvider).createTemplate(title: title, body: body);
      await ref.read(whatsAppTemplatesListProvider.notifier).refresh();
    });
    return !state.hasError;
  }

  Future<bool> editTemplate({required String id, required String title, required String body}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(whatsAppTemplatesRepositoryProvider).updateTemplate(id: id, title: title, body: body);
      await ref.read(whatsAppTemplatesListProvider.notifier).refresh();
    });
    return !state.hasError;
  }

  Future<bool> delete(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(whatsAppTemplatesRepositoryProvider).deleteTemplate(id);
      await ref.read(whatsAppTemplatesListProvider.notifier).refresh();
    });
    return !state.hasError;
  }
}
