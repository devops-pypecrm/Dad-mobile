import 'package:intl/intl.dart';

/// Port of Dad-frontend's `src/lib/utils.ts` `formatCurrency`/
/// `formatCurrencyCompact` — same symbol table, same locale table, same
/// `Intl.NumberFormat` compact-notation behavior (Dart's `intl` package
/// uses the same ICU data, verified to produce identical output e.g.
/// ₹1.24Cr / ₹86.3L for `en_IN`). Driven by `Organisation.currency`
/// (`UserSession.organisation.currency`), exactly like the web app's
/// `CurrencyContext` reads `userInfo.organisation.currency`.
class CurrencyFormatter {
  CurrencyFormatter._();

  static const _symbols = <String, String>{
    'USD': '\$', 'INR': '₹', 'EUR': '€', 'GBP': '£', 'AED': 'د.إ',
    'AUD': 'A\$', 'CAD': 'C\$', 'SGD': 'S\$', 'JPY': '¥', 'CNY': '¥',
    'KRW': '₩', 'BRL': 'R\$', 'MXN': '\$', 'ZAR': 'R', 'CHF': 'CHF',
    'SEK': 'kr', 'NOK': 'kr', 'DKK': 'kr', 'PLN': 'zł', 'THB': '฿',
    'IDR': 'Rp', 'MYR': 'RM', 'PHP': '₱', 'VND': '₫', 'TRY': '₺',
    'RUB': '₽', 'SAR': 'ر.س', 'QAR': 'ر.ق', 'KWD': 'د.ك', 'BHD': 'د.ب',
    'OMR': 'ر.ع', 'NZD': 'NZ\$', 'HKD': 'HK\$', 'TWD': 'NT\$',
  };

  static const _locales = <String, String>{
    'USD': 'en_US', 'INR': 'en_IN', 'EUR': 'de_DE', 'GBP': 'en_GB',
    'AED': 'ar_AE', 'AUD': 'en_AU', 'CAD': 'en_CA', 'SGD': 'en_SG',
    'JPY': 'ja_JP', 'CNY': 'zh_CN', 'KRW': 'ko_KR', 'BRL': 'pt_BR',
    'MXN': 'es_MX', 'ZAR': 'en_ZA', 'CHF': 'de_CH', 'SEK': 'sv_SE',
    'NOK': 'nb_NO', 'DKK': 'da_DK', 'PLN': 'pl_PL', 'THB': 'th_TH',
    'IDR': 'id_ID', 'MYR': 'ms_MY', 'PHP': 'en_PH', 'VND': 'vi_VN',
    'TRY': 'tr_TR', 'RUB': 'ru_RU', 'SAR': 'ar_SA', 'QAR': 'ar_QA',
    'KWD': 'ar_KW', 'BHD': 'ar_BH', 'OMR': 'ar_OM', 'NZD': 'en_NZ',
    'HKD': 'zh_HK', 'TWD': 'zh_TW',
  };

  /// Compact form, e.g. `₹1.24Cr`, `₹86.3L`, `$1.2M`. Defaults to INR when
  /// [currency] is null (matches the web app's `currentCurrency = 'INR'`
  /// module default in lib/utils.ts); an unrecognized code falls back to
  /// itself as the symbol and `en_US` locale, same as the web helper.
  static String compact(num amount, String? currency) {
    final code = (currency ?? 'INR').toUpperCase();
    final symbol = _symbols[code] ?? code;
    final locale = _locales[code] ?? 'en_US';
    return NumberFormat.compactCurrency(locale: locale, symbol: symbol, decimalDigits: 1).format(amount);
  }

  /// Non-compact form, e.g. `₹45,000`. Matches the web app's
  /// `formatCurrency(value, { minimumFractionDigits: 0, maximumFractionDigits: 0 })`
  /// call in GlobalSearch.tsx for a search result's `value` field.
  static String format(num amount, String? currency, {int decimalDigits = 0}) {
    final code = (currency ?? 'INR').toUpperCase();
    final symbol = _symbols[code] ?? code;
    final locale = _locales[code] ?? 'en_US';
    return NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: decimalDigits).format(amount);
  }
}
