import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/opportunity_notes_controller.dart';

/// Notes card on the Opportunity detail screen — same shape as
/// `LeadNotesSection`, backed by the generic (not lead-scoped) interactions
/// endpoint. See `OpportunityNote`'s doc comment for the "recent, not
/// guaranteed-complete" caveat on the note list itself.
class OpportunityNotesSection extends ConsumerWidget {
  const OpportunityNotesSection({super.key, required this.opportunityId});

  final String opportunityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(opportunityNotesProvider(opportunityId));
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text('Notes', style: theme.textTheme.titleMedium)),
                TextButton.icon(
                  onPressed: () => _showAddNoteDialog(context, ref),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add Note'),
                ),
              ],
            ),
            notesAsync.when(
              data: (notes) {
                if (notes.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('No notes yet.'),
                  );
                }
                return Column(
                  children: [
                    for (final note in notes)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (note.description != null && note.description!.isNotEmpty)
                              Text(note.description!),
                            const SizedBox(height: 4),
                            Text(
                              [
                                if (note.createdBy != null)
                                  [note.createdBy!.firstName, note.createdBy!.lastName]
                                      .where((p) => p != null && p.isNotEmpty)
                                      .join(' '),
                                '${note.date.toLocal()}'.split('.').first,
                              ].where((p) => p.isNotEmpty).join(' · '),
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text("Couldn't load notes.", style: TextStyle(color: theme.colorScheme.error)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddNoteDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final description = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Note'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Type a note…'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (description == null || description.isEmpty) return;
    await ref.read(opportunityNotesControllerProvider(opportunityId).notifier).addNote(description);
  }
}
