import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
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
        ),
      ];
    });
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
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("Couldn't save products: $error")),
        );
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

    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) => Padding(
        padding: EdgeInsets.only(bottom: sheetBottomPadding(context, extra: 0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Edit Products',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  FilledButton(
                    onPressed: saving ? null : _save,
                    child: saving
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Save'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Catalog', style: theme.textTheme.labelLarge),
                  if (_searching)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (_searchResults.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('No products found.'),
                    )
                  else
                    for (final product in _searchResults)
                      ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.basePrice.toStringAsFixed(0)),
                        trailing: _items.any((p) => p.productId == product.id)
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => _addProduct(product),
                              ),
                      ),
                  const Divider(height: 32),
                  Text(
                    'Selected (${_items.length})',
                    style: theme.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  if (_items.isEmpty) const Text('No products added yet.'),
                  for (final item in _items)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.customName ??
                                        item.product?.name ??
                                        item.productId,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () =>
                                      _removeProduct(item.productId),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    initialValue: '${item.quantity}',
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Qty',
                                    ),
                                    onChanged: (v) => _updateQuantity(
                                      item.productId,
                                      int.tryParse(v) ?? 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    initialValue: item.price.toStringAsFixed(0),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    decoration: const InputDecoration(
                                      labelText: 'Price',
                                    ),
                                    onChanged: (v) => _updatePrice(
                                      item.productId,
                                      double.tryParse(v) ?? item.price,
                                    ),
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
          ],
        ),
      ),
    );
  }
}
