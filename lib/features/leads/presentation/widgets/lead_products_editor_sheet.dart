import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/role_utils.dart';
import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../products/data/products_repository.dart';
import '../../../products/domain/product.dart' as catalog;
import '../../domain/lead_product.dart';
import '../../providers/lead_products_controller.dart';

/// Full-screen editor for a lead's product line items — matches Dad-frontend's
/// `AddProductToLeadDialog` (full-screen on its own mobile breakpoint too):
/// a searchable catalog to add from, and the current selection with
/// editable qty/price/custom-name. Saving always sends the complete
/// resulting list (`LeadProductsController.save` — full-replace, no
/// incremental add/remove endpoint exists).
Future<void> showLeadProductsEditorSheet(
  BuildContext context,
  WidgetRef ref, {
  required String leadId,
  required List<LeadProductItem> current,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _LeadProductsEditor(leadId: leadId, initial: current),
  );
}

class _LeadProductsEditor extends ConsumerStatefulWidget {
  const _LeadProductsEditor({required this.leadId, required this.initial});

  final String leadId;
  final List<LeadProductItem> initial;

  @override
  ConsumerState<_LeadProductsEditor> createState() =>
      _LeadProductsEditorState();
}

class _LeadProductsEditorState extends ConsumerState<_LeadProductsEditor> {
  late List<LeadProductItem> _items;
  final _searchController = TextEditingController();
  List<catalog.Product> _searchResults = const [];
  bool _searching = false;

  @override
  void initState() {
    super.initState();
    _items = List.of(widget.initial);
    // Load the default catalog immediately — without this, the catalog
    // section stayed empty (and hidden, see the build method's old
    // `_searchController.text.isNotEmpty` gate) until the user typed a
    // search query, so opening the sheet looked like there was nothing to
    // add at all.
    _search('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _search(String query) async {
    setState(() => _searching = true);
    try {
      final repository = ref.read(productsRepositoryProvider);
      final result = await repository.getProducts(
        search: query.trim().isEmpty ? null : query.trim(),
      );
      if (mounted) setState(() => _searchResults = result.products);
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  void _addProduct(catalog.Product product) {
    if (_items.any((p) => p.productId == product.id)) return;
    setState(() {
      _items = [
        ..._items,
        LeadProductItem(
          id: '', // new line — backend assigns a real id on save.
          productId: product.id,
          quantity: 1,
          price: product.basePrice,
          // Without this, a freshly-added item has no `product` ref yet
          // (only `productId`) — the Selected list's name fallback
          // (`item.product?.name ?? item.productId`) then showed the raw
          // catalog id instead of a readable name until the sheet was
          // reopened from a saved lead where the backend had filled it in.
          product: Product(
            id: product.id,
            name: product.name,
            sku: product.sku,
            basePrice: product.basePrice,
            currency: product.currency,
            isCustom: product.isCustom,
          ),
        ),
      ];
    });
  }

  /// Lets an org admin create a brand-new catalog product right from this
  /// sheet, for the "it's not in the catalog yet" case, instead of having
  /// to cancel out, go create it from the Products page, then come back
  /// and search again. Server-side gated to org admins (`createProduct`
  /// in productController.ts returns 403 otherwise) — this dialog is only
  /// ever reachable when [canQuickAddProduct] is true, so a non-admin
  /// never sees it offered and then hits that 403.
  Future<void> _quickAddProduct(String initialName) async {
    final nameController = TextEditingController(text: initialName);
    final priceController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add new product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Product name *'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Base price *'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Add')),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    final name = nameController.text.trim();
    final price = double.tryParse(priceController.text.trim());
    if (name.isEmpty || price == null) {
      showAppSnackBar(context, 'A name and a valid price are required.', isError: true);
      return;
    }

    try {
      final created = await ref.read(productsRepositoryProvider).createProduct(name: name, basePrice: price);
      if (!mounted) return;
      _addProduct(created);
      await _search(_searchController.text);
      showAppSnackBar(context, '"$name" added to the catalog and to this lead.');
    } catch (error) {
      if (!mounted) return;
      showAppSnackBar(context, "Couldn't create product: $error", isError: true);
    }
  }

  void _removeProduct(String productId) {
    setState(
      () => _items = _items.where((p) => p.productId != productId).toList(),
    );
  }

  void _updateQuantity(String productId, int quantity) {
    setState(() {
      _items = [
        for (final p in _items)
          if (p.productId == productId)
            p.copyWith(quantity: quantity.clamp(1, 999))
          else
            p,
      ];
    });
  }

  void _updatePrice(String productId, double price) {
    setState(() {
      _items = [
        for (final p in _items)
          if (p.productId == productId) p.copyWith(price: price) else p,
      ];
    });
  }

  void _updateCustomName(String productId, String name) {
    setState(() {
      _items = [
        for (final p in _items)
          if (p.productId == productId)
            p.copyWith(customName: name.trim().isEmpty ? null : name)
          else
            p,
      ];
    });
  }

  Future<void> _save() async {
    await ref
        .read(leadProductsControllerProvider(widget.leadId).notifier)
        .save(_items);
    if (!mounted) return;
    // Only close on actual success — previously this popped unconditionally,
    // so a rejected save (e.g. a network error) silently closed the sheet
    // with nothing saved and no indication anything went wrong.
    final error = ref.read(leadProductsControllerProvider(widget.leadId)).error;
    if (error != null) {
      showAppSnackBar(context, "Couldn't save products: $error", isError: true);
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final saving = ref
        .watch(leadProductsControllerProvider(widget.leadId))
        .isLoading;
    final canQuickAddProduct = isOrgAdminRole(ref.watch(sessionControllerProvider).valueOrNull?.role);

    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          // Header carries ONLY the title + a close action now — it
          // previously also hosted the "Save" button inline, which on
          // devices with a larger accessibility text scale left too little
          // width for the title and forced it to wrap one word per line
          // (looked like a vertical column of letters). `maxLines`/
          // `overflow`/`softWrap` below are a hard safety net against that
          // regardless of width; moving Save to its own full-width footer
          // (further down) removes the squeeze that caused it in the first
          // place and doubles as the explicit confirm/OK action.
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 12, 16, 8),
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Close',
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Text(
                    'Edit Products',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                // Balances the leading IconButton's ~48px footprint so the
                // title above stays visually centered instead of skewed
                // toward the close icon.
                const SizedBox(width: 48),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search catalog to add a product…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          _search('');
                        },
                      ),
              ),
              onSubmitted: _search,
              onChanged: (value) {
                setState(() {}); // refresh the clear button's visibility
                _search(value);
              },
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              children: [
                Text('Catalog', style: theme.textTheme.labelLarge),
                const SizedBox(height: 8),
                if (_searching)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (_searchResults.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('No products found.'),
                        if (canQuickAddProduct) ...[
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () => _quickAddProduct(_searchController.text.trim()),
                            icon: const Icon(Icons.add, size: 18),
                            label: Text(
                              _searchController.text.trim().isEmpty
                                  ? 'Add new product'
                                  : 'Add "${_searchController.text.trim()}" as a new product',
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                else
                  for (final product in _searchResults)
                    _CatalogTile(
                      product: product,
                      added: _items.any((p) => p.productId == product.id),
                      onAdd: () => _addProduct(product),
                    ),
                const SizedBox(height: 24),
                Text(
                  'Selected (${_items.length})',
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                if (_items.isEmpty)
                  Text(
                    'No products added yet.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                for (final item in _items)
                  _SelectedProductCard(
                    item: item,
                    // Same semantics as web's `AddProductToLeadDialog`: a line
                    // item is editable only when its catalog product is
                    // flagged `isCustom`, not based on which org is logged in.
                    canEditNameAndPrice: item.product?.isCustom ?? false,
                    onRemove: () => _removeProduct(item.productId),
                    onQuantityChanged: (q) => _updateQuantity(item.productId, q),
                    onPriceChanged: (p) => _updatePrice(item.productId, p),
                    onNameChanged: (n) => _updateCustomName(item.productId, n),
                  ),
              ],
            ),
          ),
          // Sticky footer confirm action — the one, unambiguous "OK" button
          // for the whole sheet (adding/removing/editing lines above is all
          // staged locally; nothing hits the backend until this is tapped).
          Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, sheetBottomPadding(context, extra: 12)),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: saving ? null : _save,
                child: saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text('Save Products (${_items.length})'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogTile extends StatelessWidget {
  const _CatalogTile({required this.product, required this.added, required this.onAdd});

  final catalog.Product product;
  final bool added;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: kBrandColor.withValues(alpha: 0.12),
              child: const Icon(Icons.inventory_2_outlined, color: kBrandColor, size: 18),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (product.sku != null && product.sku!.isNotEmpty || (product.category != null && product.category!.isNotEmpty))
                  Text(
                    [
                      if (product.sku != null && product.sku!.isNotEmpty) 'SKU: ${product.sku}',
                      if (product.category != null && product.category!.isNotEmpty) product.category!,
                    ].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                if (product.description != null && product.description!.isNotEmpty)
                  Text(
                    product.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                Text(
                  '${product.currency} ${product.basePrice.toStringAsFixed(0)} / ${product.unit}'
                  '${product.taxRate > 0 ? ' + ${product.taxRate.toStringAsFixed(0)}% tax' : ''}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (added)
            const Icon(Icons.check_circle, color: kBrandColor)
          else
            InkWell(
              onTap: onAdd,
              borderRadius: BorderRadius.circular(20),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: kBrandColor,
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ),
        ],
      ),
    );
  }
}

class _SelectedProductCard extends StatelessWidget {
  const _SelectedProductCard({
    required this.item,
    required this.canEditNameAndPrice,
    required this.onRemove,
    required this.onQuantityChanged,
    required this.onPriceChanged,
    required this.onNameChanged,
  });

  final LeadProductItem item;
  final bool canEditNameAndPrice;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<double> onPriceChanged;
  final ValueChanged<String> onNameChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayName = item.customName ?? item.product?.name ?? item.productId;
    final sku = item.product?.sku;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: kBrandColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: canEditNameAndPrice
                              ? TextFormField(
                                  key: ValueKey('name-${item.productId}'),
                                  initialValue: displayName,
                                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                                  decoration: const InputDecoration(labelText: 'Product Name', isDense: true),
                                  onChanged: onNameChanged,
                                )
                              : Text(
                                  displayName,
                                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                        IconButton(
                          tooltip: 'Remove',
                          icon: const Icon(Icons.delete_outline),
                          onPressed: onRemove,
                        ),
                      ],
                    ),
                    if (sku != null && sku.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'SKU: $sku',
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            key: ValueKey('qty-${item.productId}'),
                            initialValue: '${item.quantity}',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Qty', isDense: true),
                            onChanged: (v) => onQuantityChanged(int.tryParse(v) ?? 1),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: canEditNameAndPrice
                              ? TextFormField(
                                  key: ValueKey('price-${item.productId}'),
                                  initialValue: item.price.toStringAsFixed(0),
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  decoration: const InputDecoration(labelText: 'Price', isDense: true),
                                  onChanged: (v) => onPriceChanged(double.tryParse(v) ?? item.price),
                                )
                              : InputDecorator(
                                  decoration: const InputDecoration(labelText: 'Price', isDense: true),
                                  child: Text(item.price.toStringAsFixed(0)),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
