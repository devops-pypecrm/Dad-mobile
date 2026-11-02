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
    ref.invalidateSelf();
    await future;
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
