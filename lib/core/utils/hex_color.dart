import 'package:flutter/material.dart';

/// Parses a `#RRGGBB` (or `RRGGBB`) hex string into a [Color] — same format
/// `Organisation.leadStatuses[].color` uses on the backend (confirmed
/// against Dad-frontend/src/pages/leads/StatusCell.tsx, which does raw
/// CSS `${color}15` string concatenation on exactly this shape). Falls
/// back to a neutral gray on a null/malformed value, matching the web
/// hook's own `#6b7280` fallback for an unresolvable status
/// (Dad-frontend/src/hooks/useLeadStatuses.ts).
Color hexToColor(String? hex, {double opacity = 1}) {
  const fallback = Color(0xFF6B7280);
  if (hex == null || hex.isEmpty) return fallback.withValues(alpha: opacity);

  final cleaned = hex.replaceFirst('#', '');
  if (cleaned.length != 6 && cleaned.length != 8) return fallback.withValues(alpha: opacity);

  final value = int.tryParse(cleaned.length == 6 ? 'FF$cleaned' : cleaned, radix: 16);
  if (value == null) return fallback.withValues(alpha: opacity);

  return Color(value).withValues(alpha: opacity);
}
