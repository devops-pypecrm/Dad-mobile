/// `cold_call` -> `Cold Call`. Used wherever a backend free-form snake_case
/// value (lead source, etc.) needs a human-readable label.
String humanizeSnakeCase(String value) {
  final words = value.replaceAll('_', ' ').split(' ');
  return words.map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}').join(' ');
}
