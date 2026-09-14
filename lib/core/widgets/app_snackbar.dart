import 'package:flutter/material.dart';

const _brandColor = Color(0xFF578732);

/// Themed in-app notice — a rounded, floating, icon-led banner that matches
/// the app's own design language (white card, brand green/red accents),
/// instead of Flutter's default flat black `SnackBar`. Drop-in replacement
/// for the ad hoc
/// `ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(x)))`
/// pattern repeated across the app's error/success listeners.
void showAppSnackBar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  final theme = Theme.of(context);
  final accent = isError ? const Color(0xFFDC2626) : _brandColor;

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: theme.colorScheme.surface,
        elevation: 6,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: accent.withValues(alpha: 0.3)),
        ),
        duration: Duration(seconds: isError ? 5 : 3),
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: accent,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                // Wraps in full — no maxLines/ellipsis — so a long error
                // message (e.g. a server validation string) always reads
                // completely instead of being cut off.
                softWrap: true,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
