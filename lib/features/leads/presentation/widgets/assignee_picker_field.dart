import 'package:flutter/material.dart';

import '../../../users/domain/hierarchy_user.dart';

/// "Assign To" dropdown for the Create Lead screen — same field as
/// Dad-frontend's `QuickAddLeadDialog`, defaulting to "Unassigned" (the
/// backend then defaults `assignedTo` to the creating user itself, see
/// `leadController.ts`'s `createLead`).
class AssigneePickerField extends StatelessWidget {
  const AssigneePickerField({
    super.key,
    required this.users,
    required this.value,
    required this.onChanged,
  });

  final List<HierarchyUser> users;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      initialValue: value,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Assign To', border: OutlineInputBorder()),
      items: [
        const DropdownMenuItem(value: null, child: Text('Unassigned')),
        for (final user in users)
          DropdownMenuItem(value: user.id, child: Text(user.fullName, overflow: TextOverflow.ellipsis)),
      ],
      onChanged: onChanged,
    );
  }
}
