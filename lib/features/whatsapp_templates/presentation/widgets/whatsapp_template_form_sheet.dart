import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../domain/whatsapp_template.dart';
import '../../providers/whatsapp_templates_provider.dart';


/// Bottom sheet for creating or editing a single WhatsApp template. Pass
/// [existing] to edit; omit it to create a new one.
Future<void> showWhatsAppTemplateFormSheet(BuildContext context, {WhatsAppTemplate? existing}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _WhatsAppTemplateFormSheet(existing: existing),
  );
}

class _WhatsAppTemplateFormSheet extends ConsumerStatefulWidget {
  const _WhatsAppTemplateFormSheet({this.existing});

  final WhatsAppTemplate? existing;

  @override
  ConsumerState<_WhatsAppTemplateFormSheet> createState() => _WhatsAppTemplateFormSheetState();
}

class _WhatsAppTemplateFormSheetState extends ConsumerState<_WhatsAppTemplateFormSheet> {
  late final _titleController = TextEditingController(text: widget.existing?.title);
  late final _bodyController = TextEditingController(text: widget.existing?.body);
  bool _saving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();
    if (title.isEmpty || body.isEmpty) {
      showAppSnackBar(context, 'Both a title and a message are required.', isError: true);
      return;
    }

    setState(() => _saving = true);
    final controller = ref.read(whatsAppTemplateActionsControllerProvider.notifier);
    final existing = widget.existing;
    final success = existing == null
        ? await controller.create(title: title, body: body)
        : await controller.editTemplate(id: existing.id, title: title, body: body);

    if (!mounted) return;
    setState(() => _saving = false);
    if (success) {
      Navigator.of(context).pop();
    } else {
      final error = ref.read(whatsAppTemplateActionsControllerProvider).error;
      showAppSnackBar(context, "Couldn't save template: $error", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existing != null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        sheetBottomPadding(context) + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isEditing ? 'Edit template' : 'New template',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'e.g. Pricing follow-up',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _bodyController,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 6,
            minLines: 4,
            decoration: const InputDecoration(
              labelText: 'Message',
              hintText: 'The message that gets filled into WhatsApp…',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: _saving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Text(isEditing ? 'Save changes' : 'Create template'),
            ),
          ),
        ],
      ),
    );
  }
}
