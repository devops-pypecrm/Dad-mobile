import 'package:country_code_picker/country_code_picker.dart';

/// Splits an existing phone number (as stored on a lead, e.g. from editing)
/// into its dial code and local number, so the Edit Lead screen can
/// pre-select the right country in the picker instead of always defaulting
/// to India. Falls back to India/the raw string unchanged if the number
/// doesn't start with "+" or doesn't match any known dial code — existing
/// leads created before this picker existed have no dial code stored at all.
({String dialCode, String localNumber}) splitDialCode(String phone) {
  final trimmed = phone.trim();
  if (!trimmed.startsWith('+')) {
    return (dialCode: '+91', localNumber: trimmed);
  }

  // Longest dial-code match first (e.g. "+1684" before "+1") so a number
  // like +1684... doesn't get mis-split against the more common "+1".
  final sortedCodes = [...codes]
    ..sort((a, b) => (b['dial_code']!.length).compareTo(a['dial_code']!.length));
  for (final country in sortedCodes) {
    final dialCode = country['dial_code']!;
    if (trimmed.startsWith(dialCode)) {
      return (dialCode: dialCode, localNumber: trimmed.substring(dialCode.length));
    }
  }
  return (dialCode: '+91', localNumber: trimmed);
}

/// Combines a country dial code (e.g. "+91") with the digits the user typed
/// in the phone field, guarding against the user having already typed a
/// leading "+" or a leading "0" (common when pasting a number copied from
/// somewhere else) so the result doesn't end up double-prefixed.
String combineDialCode(String dialCode, String rawNumber) {
  final trimmed = rawNumber.trim();
  if (trimmed.isEmpty) return trimmed;
  if (trimmed.startsWith('+')) return trimmed;

  final digitsOnly = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
  final withoutLeadingZero = digitsOnly.startsWith('0')
      ? digitsOnly.substring(1)
      : digitsOnly;
  return '$dialCode$withoutLeadingZero';
}
