import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/url_launch_helper.dart';

const _brandColor = Color(0xFF578732);

/// Call / Email / WhatsApp buttons on the Lead Detail screen — launches the
/// native dialer/mail client/WhatsApp rather than doing anything in-app.
class LeadQuickActions extends StatelessWidget {
  const LeadQuickActions({super.key, required this.phone, this.email});

  final String phone;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: const Icon(Icons.call, size: 18, color: _brandColor),
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
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp,
              size: 17,
              color: _brandColor,
            ),
            label: 'WhatsApp',
            onTap: () => launchUriWithFeedback(
              context,
              Uri.parse(
                'https://wa.me/${phone.replaceAll(RegExp(r'[^0-9]'), '')}',
              ),
            ),
          ),
        ),
        if (email != null && email!.isNotEmpty) ...[
          const SizedBox(width: 10),
          Expanded(
            child: _ActionButton(
              icon: const Icon(Icons.email, size: 18, color: _brandColor),
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
                color: _brandColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
