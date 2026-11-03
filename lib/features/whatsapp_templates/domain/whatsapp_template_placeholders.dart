/// Dynamic placeholder tokens a WhatsApp template's message body can
/// contain — filled in with the specific lead's own data right before the
/// text is prefilled into WhatsApp, so one saved template personalizes
/// itself per lead instead of sending the exact same static text to
/// everyone every time.
class WhatsAppTemplatePlaceholder {
  const WhatsAppTemplatePlaceholder(this.token, this.label);

  /// The literal text the user types into the template body, e.g.
  /// `{{leadName}}` — matched verbatim (case-sensitive) when filling.
  final String token;

  /// Shown on the "insert" chip in the template editor.
  final String label;
}

const whatsAppTemplatePlaceholders = <WhatsAppTemplatePlaceholder>[
  WhatsAppTemplatePlaceholder('{{leadName}}', "Lead's name"),
  WhatsAppTemplatePlaceholder('{{phone}}', "Lead's phone number"),
];

/// Replaces every known placeholder token in [body] with the given lead's
/// actual data. Unknown/mistyped tokens (e.g. a typo'd `{{leadnme}}`) are
/// left as-is rather than silently dropped, so the sender notices the typo
/// instead of sending a message with a gap in it.
String fillWhatsAppTemplate(
  String body, {
  required String leadName,
  String? leadPhone,
}) {
  var result = body.replaceAll('{{leadName}}', leadName);
  if (leadPhone != null && leadPhone.isNotEmpty) {
    result = result.replaceAll('{{phone}}', leadPhone);
  }
  return result;
}
