import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/url_launch_helper.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../leads/domain/phone_number_utils.dart';
import '../../data/products_repository.dart';

/// "Share" bottom sheet for a catalog product — same WhatsApp/Email/Copy
/// Link options as Dad-frontend's `ProductShareDropdown`, generating (or
/// reusing) the product's public share link via `/api/products/:id/share`.
///
/// Pass [leadId] when sharing from a specific lead's Products section —
/// this appends `?leadId=` to the link (so the public page can attribute
/// the view) and prefills the WhatsApp/Email targets from
/// [leadPhone]/[leadEmail], exactly like the web dropdown. Omit it when
/// sharing from the general Products catalog screen.
Future<void> showProductShareSheet(
  BuildContext context, {
  required String productId,
  required String productName,
  String? leadId,
  String? leadPhone,
  String? leadEmail,
}) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (context) => _ProductShareSheet(
      productId: productId,
      productName: productName,
      leadId: leadId,
      leadPhone: leadPhone,
      leadEmail: leadEmail,
    ),
  );
}

class _ProductShareSheet extends ConsumerStatefulWidget {
  const _ProductShareSheet({
    required this.productId,
    required this.productName,
    this.leadId,
    this.leadPhone,
    this.leadEmail,
  });

  final String productId;
  final String productName;
  final String? leadId;
  final String? leadPhone;
  final String? leadEmail;

  @override
  ConsumerState<_ProductShareSheet> createState() => _ProductShareSheetState();
}

class _ProductShareSheetState extends ConsumerState<_ProductShareSheet> {
  bool _loading = false;

  Future<String?> _getLink() async {
    setState(() => _loading = true);
    try {
      final link = await ref.read(productsRepositoryProvider).generateShareLink(
            widget.productId,
            leadId: widget.leadId,
          );
      var url = link.url;
      if (url == null) return null;
      if (widget.leadId != null) url = '$url?leadId=${widget.leadId}';
      return url;
    } catch (error) {
      if (mounted) showAppSnackBar(context, "Couldn't generate share link: $error", isError: true);
      return null;
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _shareViaWhatsApp() async {
    final link = await _getLink();
    if (link == null || !mounted) return;
    final message = 'Hi, I thought you might be interested in our product: '
        '${widget.productName}. You can view the details here: $link';
    final phone = widget.leadPhone != null && widget.leadPhone!.isNotEmpty
        ? formatWhatsAppNumber(widget.leadPhone!, null)
        : null;
    if (!mounted) return;
    Navigator.of(context).pop();
    await launchUriWithFeedback(
      context,
      Uri.parse(
        'https://wa.me/${phone ?? ''}?text=${Uri.encodeComponent(message)}',
      ),
    );
  }

  Future<void> _shareViaEmail() async {
    final link = await _getLink();
    if (link == null || !mounted) return;
    final subject = 'Product Information: ${widget.productName}';
    final body = "Hi,\n\nI'm sharing the details for the product you were "
        'interested in: ${widget.productName}.\n\nYou can view it here: $link\n\nBest regards.';
    if (!mounted) return;
    Navigator.of(context).pop();
    await launchUriWithFeedback(
      context,
      Uri(
        scheme: 'mailto',
        path: widget.leadEmail ?? '',
        query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
      ),
    );
  }

  Future<void> _copyLink() async {
    final link = await _getLink();
    if (link == null || !mounted) return;
    await Clipboard.setData(ClipboardData(text: link));
    if (!mounted) return;
    Navigator.of(context).pop();
    showAppSnackBar(context, 'Link copied to clipboard');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Row(
              children: [
                const Expanded(
                  child: Text('Share Product', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                ),
                if (_loading)
                  const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
              ],
            ),
          ),
          ListTile(
            enabled: !_loading,
            leading: const Icon(Icons.chat, color: Color(0xFF25D366)),
            title: const Text('WhatsApp'),
            onTap: _shareViaWhatsApp,
          ),
          ListTile(
            enabled: !_loading,
            leading: const Icon(Icons.email_outlined, color: kBrandColor),
            title: const Text('Email'),
            onTap: _shareViaEmail,
          ),
          ListTile(
            enabled: !_loading,
            leading: const Icon(Icons.link, color: kBrandColor),
            title: const Text('Copy Link'),
            onTap: _copyLink,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
