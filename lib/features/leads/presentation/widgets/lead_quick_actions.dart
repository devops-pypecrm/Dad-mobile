import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Call / Email / WhatsApp buttons on the Lead Detail screen — launches the
/// native dialer/mail client/WhatsApp rather than doing anything in-app.
class LeadQuickActions extends StatelessWidget {
  const LeadQuickActions({super.key, required this.phone, this.email});

  final String phone;
  final String? email;

  Future<void> _launch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.call,
            label: 'Call',
            onTap: () => _launch(Uri(scheme: 'tel', path: phone)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.chat,
            label: 'WhatsApp',
            onTap: () => _launch(Uri.parse('https://wa.me/${phone.replaceAll(RegExp(r'[^0-9]'), '')}')),
          ),
        ),
        if (email != null && email!.isNotEmpty) ...[
          const SizedBox(width: 12),
          Expanded(
            child: _ActionButton(
              icon: Icons.email,
              label: 'Email',
              onTap: () => _launch(Uri(scheme: 'mailto', path: email)),
            ),
          ),
        ],
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
