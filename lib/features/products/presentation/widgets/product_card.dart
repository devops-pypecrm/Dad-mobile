import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../domain/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onEdit, this.onDelete});

  final Product product;

  /// Null hides the edit/delete menu entirely — callers gate this to
  /// `isOrgAdminRole` (see `role_utils.dart`), matching the backend's own
  /// org-admin-only enforcement on those endpoints.
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  product.isCustom ? 'Custom Price' : CurrencyFormatter.compact(product.basePrice, product.currency),
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (onEdit != null || onDelete != null)
                  PopupMenuButton<VoidCallback>(
                    icon: const Icon(Icons.more_vert, size: 20),
                    onSelected: (action) => action(),
                    itemBuilder: (context) => [
                      if (onEdit != null)
                        PopupMenuItem(value: onEdit, child: const Text('Edit')),
                      if (onDelete != null)
                        PopupMenuItem(
                          value: onDelete,
                          child: const Text('Delete', style: TextStyle(color: Colors.red)),
                        ),
                    ],
                  ),
              ],
            ),
            if (product.sku != null && product.sku!.isNotEmpty)
              Text(
                'SKU: ${product.sku}',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (product.category != null && product.category!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Chip(
                      label: Text(product.category!),
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                Chip(
                  label: Text(product.isActive ? 'Active' : 'Inactive'),
                  backgroundColor:
                      (product.isActive ? const Color(0xFF16A34A) : Colors.grey).withValues(alpha: 0.12),
                  labelStyle: TextStyle(
                    color: product.isActive ? const Color(0xFF16A34A) : Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  side: BorderSide.none,
                ),
                const Spacer(),
                if (product.brochureUrl != null && product.brochureUrl!.isNotEmpty)
                  IconButton(
                    tooltip: 'View brochure',
                    icon: const Icon(Icons.description_outlined, size: 20),
                    onPressed: () async {
                      final uri = Uri.tryParse(product.brochureUrl!);
                      if (uri != null && await canLaunchUrl(uri)) await launchUrl(uri);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
