import 'package:intl/intl.dart';

/// Same relative-date logic as `formatDate` in
/// Dad-frontend/src/components/shared/GlobalSearch.tsx:138-149: "Today",
/// "Yesterday", "N days ago" (< 7 days), "N weeks ago" (< 30 days), else
/// an absolute `MMM d, yyyy` date.
String formatRelativeDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);

  if (target == today) return 'Today';

  final diffDays = today.difference(target).inDays;
  if (diffDays == 1) return 'Yesterday';
  if (diffDays > 0 && diffDays < 7) return '$diffDays days ago';
  if (diffDays >= 7 && diffDays < 30) return '${(diffDays / 7).ceil()} weeks ago';
  return DateFormat('MMM d, yyyy').format(date);
}
