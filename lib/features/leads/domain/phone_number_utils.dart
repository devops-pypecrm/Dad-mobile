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

/// Cleans a user-typed local number for storage: digits only, with a
/// leading "0" dropped (common when pasting a number copied from
/// somewhere else) — the dial code is sent separately as
/// `phoneCountryCode` rather than being embedded in `phone`.
String sanitizeLocalNumber(String rawNumber) {
  final digitsOnly = rawNumber.trim().replaceAll(RegExp(r'[^0-9]'), '');
  return digitsOnly.startsWith('0') ? digitsOnly.substring(1) : digitsOnly;
}

/// Formats a lead's phone for a `wa.me` link — digits only, always
/// prefixed with the country's calling code. Mirrors
/// Dad-frontend/src/lib/utils.ts's `formatWhatsAppNumber`: idempotent (won't
/// double-prefix a number that already includes the country code), and
/// falls back to assuming India for a bare 10-digit mobile number when no
/// `phoneCountryCode` is stored (legacy leads created before that field
/// existed).
String formatWhatsAppNumber(String phone, String? countryCode) {
  final cleanedPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');
  if (cleanedPhone.isEmpty) return '';

  final cleanedCc = (countryCode ?? '').replaceAll(RegExp(r'[^0-9]'), '');
  if (cleanedCc.isNotEmpty) {
    if (cleanedPhone.startsWith(cleanedCc) && cleanedPhone.length > 10) {
      return cleanedPhone;
    }
    return '$cleanedCc$cleanedPhone';
  }

  if (cleanedPhone.length == 10 && RegExp(r'^[6-9]').hasMatch(cleanedPhone)) {
    return '91$cleanedPhone';
  }
  return cleanedPhone;
}
