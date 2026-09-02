import 'package:flutter/material.dart';

import '../../../auth/domain/organisation.dart';

/// Status dropdown for the Create/Edit lead forms, sourced from the org's
/// configured pipeline (`Organisation.leadStatuses`) with a hardcoded
/// fallback — same pattern as the bottom-sheet picker on the Lead Detail
/// screen, just rendered as an inline form field instead of a sheet.
class LeadStatusField extends StatelessWidget {
  const LeadStatusField({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final List<LeadStatusOption>? options;
  final String value;
  final ValueChanged<String> onChanged;

  static const _fallback = [
    'new',
    'contacted',
    'qualified',
    'converted',
    'lost',
  ];

  @override
  Widget build(BuildContext context) {
    final ids = (options != null && options!.isNotEmpty)
        ? options!.map((o) => o.id).toList()
        : _fallback;
    final labelFor = {
      for (final o in (options ?? const [])) o.id: o.label ?? o.id,
    };

    final items = {value, ...ids}.toList();

    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: const InputDecoration(
        labelText: 'Status',
        border: OutlineInputBorder(),
      ),
      items: [
        for (final id in items)
          DropdownMenuItem(value: id, child: Text(labelFor[id] ?? id)),
      ],
      onChanged: (selected) {
        if (selected != null) onChanged(selected);
      },
    );
  }
}
