import 'package:flutter/material.dart';

/// Generic "Are you sure?" confirmation dialog — shared by every mutating
/// action button on the Opportunity detail screen (stage change, sync
/// amount, mark installment paid, close won/lost) so each one gets the same
/// confirm-before-acting treatment instead of firing the request on a
/// single accidental tap.
Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'Confirm',
  bool destructive = false,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: destructive
              ? TextButton.styleFrom(foregroundColor: const Color(0xFFDC2626))
              : null,
          child: Text(confirmLabel),
        ),
      ],
    ),
  );
  return confirmed ?? false;
}
