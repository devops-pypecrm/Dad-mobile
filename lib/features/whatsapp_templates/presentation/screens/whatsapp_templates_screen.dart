import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../domain/whatsapp_template.dart';
import '../../providers/whatsapp_templates_provider.dart';
import '../widgets/whatsapp_template_form_sheet.dart';

const _whatsAppGreen = Color(0xFF25D366);

/// Private, per-user WhatsApp templates. Nobody else — including org
/// admins — can see these; the backend scopes everything by the caller's
/// own user id (see `WhatsAppTemplatesRepository`'s doc comment).
class WhatsAppTemplatesScreen extends ConsumerWidget {
  const WhatsAppTemplatesScreen({super.key});

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, WhatsAppTemplate template) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete template?'),
        content: Text('Delete "${template.title}"? This can\'t be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete', style: TextStyle(color: Color(0xFFFF6B4A))),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final success = await ref.read(whatsAppTemplateActionsControllerProvider.notifier).delete(template.id);
    if (!context.mounted) return;
    if (!success) {
      final error = ref.read(whatsAppTemplateActionsControllerProvider).error;
      showAppSnackBar(context, "Couldn't delete template: $error", isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(whatsAppTemplatesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('WhatsApp Templates')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => showWhatsAppTemplateFormSheet(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: templatesAsync.when(
        loading: () => const ListSkeleton(),
        error: (error, _) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(whatsAppTemplatesListProvider),
        ),
        data: (templates) {
          if (templates.isEmpty) {
            return const EmptyStateView(
              icon: Icons.chat_bubble_outline,
              message: 'No templates yet — create one so it shows up when you tap WhatsApp on a lead.',
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(whatsAppTemplatesListProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              itemCount: templates.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final template = templates[index];
                return Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: const CircleAvatar(
                      backgroundColor: _whatsAppGreen,
                      child: Icon(Icons.chat, color: Colors.white, size: 18),
                    ),
                    title: Text(template.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    subtitle: Text(template.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          showWhatsAppTemplateFormSheet(context, existing: template);
                        } else if (value == 'delete') {
                          _confirmDelete(context, ref, template);
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 'edit', child: Text('Edit')),
                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                      ],
                    ),
                    onTap: () => showWhatsAppTemplateFormSheet(context, existing: template),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
