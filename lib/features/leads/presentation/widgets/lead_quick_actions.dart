import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/url_launch_helper.dart';
import '../../../whatsapp_templates/presentation/widgets/whatsapp_send_sheet.dart';


/// Call / Email / WhatsApp buttons on the Lead Detail screen — launches the
/// native dialer/mail client/WhatsApp rather than doing anything in-app.
class LeadQuickActions extends StatelessWidget {
  const LeadQuickActions({
    super.key,
    required this.phone,
    required this.leadName,
    this.phoneCountryCode,
    this.email,
  });

  final String phone;
  final String leadName;
  final String? phoneCountryCode;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icon(Icons.call, size: 18, color: Theme.of(context).colorScheme.primary),
            label: 'Call',
            onTap: () =>
                launchUriWithFeedback(context, Uri(scheme: 'tel', path: phone)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _ActionButton(
            // `FontAwesomeIcons.whatsapp` is an `FaIconData`, not a plain
            // `IconData` (font_awesome_flutter 11+), so it needs the
            // dedicated `FaIcon` widget rather than a plain `Icon`.
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              size: 17,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'WhatsApp',
            onTap: () => showWhatsAppSendSheet(
              context,
              phone: phone,
              leadName: leadName,
              phoneCountryCode: phoneCountryCode,
            ),
          ),
        ),
        if (email != null && email!.isNotEmpty) ...[
          const SizedBox(width: 10),
          Expanded(
            child: _ActionButton(
              icon: Icon(Icons.email, size: 18, color: Theme.of(context).colorScheme.primary),
              label: 'Email',
              onTap: () => launchUriWithFeedback(
                context,
                Uri(scheme: 'mailto', path: email),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: theme.colorScheme.outlineVariant),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
