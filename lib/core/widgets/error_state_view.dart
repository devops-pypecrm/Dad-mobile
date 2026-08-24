import 'package:flutter/material.dart';

/// Standard error state for any `AsyncValue.error` branch — every list/detail
/// screen was hand-rolling a slightly different version of this (some
/// missing the retry button, some missing the message). Shows the real
/// exception message (via `ApiException`'s `toString()`, which already
/// surfaces the backend's own error message where available — see
/// core/network/api_exception.dart) rather than a generic string.
class ErrorStateView extends StatelessWidget {
  const ErrorStateView({super.key, required this.error, this.onRetry});

  final Object error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 40, color: theme.colorScheme.error),
            const SizedBox(height: 12),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ],
        ),
      ),
    );
  }
}
