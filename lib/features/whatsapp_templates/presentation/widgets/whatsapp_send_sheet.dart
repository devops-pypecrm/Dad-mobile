import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/url_launch_helper.dart';
import '../../../leads/domain/phone_number_utils.dart';
import '../../providers/whatsapp_templates_provider.dart';

const _brandColor = Color(0xFF9654B5);
const _whatsAppGreen = Color(0xFF25D366);

/// Shown when the WhatsApp quick action is tapped anywhere in the app
/// (lead card, lead detail) — lets the user either send with one of their
/// own private templates prefilled, or skip straight to a blank chat.
/// Either way this just opens a `wa.me` deep link into the user's own
/// WhatsApp app; nothing is sent through Meta's API, so there's no
/// approval/verification step for a template to be usable here.
Future<void> showWhatsAppSendSheet(
  BuildContext context, {
  required String phone,
  String? phoneCountryCode,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _WhatsAppSendSheet(phone: phone, phoneCountryCode: phoneCountryCode),
  );
}

void _openWhatsApp(BuildContext context, String phone, String? phoneCountryCode, String? text) {
  final number = formatWhatsAppNumber(phone, phoneCountryCode);
  final uri = Uri.parse(
    text == null || text.isEmpty
        ? 'https://wa.me/$number'
        : 'https://wa.me/$number?text=${Uri.encodeComponent(text)}',
  );
  launchUriWithFeedback(context, uri);
}

class _WhatsAppSendSheet extends ConsumerWidget {
  const _WhatsAppSendSheet({required this.phone, this.phoneCountryCode});

  final String phone;
  final String? phoneCountryCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(whatsAppTemplatesListProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send via WhatsApp',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundColor: _whatsAppGreen,
                child: Icon(Icons.chat, color: Colors.white, size: 18),
              ),
              title: const Text('Send without a template'),
              subtitle: const Text('Opens an empty WhatsApp chat'),
              onTap: () {
                Navigator.of(context).pop();
                _openWhatsApp(context, phone, phoneCountryCode, null);
              },
            ),
            const Divider(height: 8),
            templatesAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text("Couldn't load your templates — you can still send without one."),
              ),
              data: (templates) {
                if (templates.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'No templates yet. Add one from the WhatsApp section in the menu.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  );
                }
                return Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: templates.length,
                    itemBuilder: (context, index) {
                      final template = templates[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.description_outlined, color: _brandColor),
                        title: Text(template.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text(template.body, maxLines: 1, overflow: TextOverflow.ellipsis),
                        onTap: () {
                          Navigator.of(context).pop();
                          _openWhatsApp(context, phone, phoneCountryCode, template.body);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
