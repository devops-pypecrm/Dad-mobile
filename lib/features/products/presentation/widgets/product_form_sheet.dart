import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/product.dart';
import '../../providers/product_actions_controller.dart';

/// Create/Edit form — same fields as Dad-frontend's Create/Edit Product
/// dialogs (`src/pages/products/index.tsx`): name, SKU, base price,
/// category, description, and the "Custom Price" toggle (price entered at
/// time of sale rather than this catalog value). Brochure upload isn't
/// wired up here — see `ProductsRepository.createProduct`'s doc comment,
/// that's a real gap in this pass, not a silent omission.
Future<void> showProductFormSheet(BuildContext context, {Product? editing}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _ProductForm(editing: editing),
  );
}

class _ProductForm extends ConsumerStatefulWidget {
  const _ProductForm({this.editing});

  final Product? editing;

  @override
  ConsumerState<_ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<_ProductForm> {
  late final _name = TextEditingController(text: widget.editing?.name);
  late final _sku = TextEditingController(text: widget.editing?.sku);
  late final _basePrice = TextEditingController(
    text: widget.editing != null ? widget.editing!.basePrice.toStringAsFixed(0) : '',
  );
  late final _category = TextEditingController(text: widget.editing?.category);
  late final _description = TextEditingController(text: widget.editing?.description);
  late bool _isCustom = widget.editing?.isCustom ?? false;

  @override
  void dispose() {
    _name.dispose();
    _sku.dispose();
    _basePrice.dispose();
    _category.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _name.text.trim();
    final basePrice = double.tryParse(_basePrice.text.trim());
    if (name.isEmpty || basePrice == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('Name and a valid base price are required.')));
      return;
    }

    final controller = ref.read(productActionsControllerProvider.notifier);
    final editing = widget.editing;
    final success = editing == null
        ? await controller.create(
            name: name,
            sku: _sku.text.trim(),
            basePrice: basePrice,
            category: _category.text.trim(),
            description: _description.text.trim(),
            isCustom: _isCustom,
          )
        : await controller.editProduct(
            editing.id,
            name: name,
            sku: _sku.text.trim(),
            basePrice: basePrice,
            category: _category.text.trim(),
            description: _description.text.trim(),
            isCustom: _isCustom,
          );

    if (!mounted) return;
    if (!success) {
      final error = ref.read(productActionsControllerProvider).error;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("Couldn't save product: $error")));
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final saving = ref.watch(productActionsControllerProvider).isLoading;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.editing == null ? 'Add Product' : 'Edit Product', style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(controller: _name, decoration: const InputDecoration(labelText: 'Name *')),
            const SizedBox(height: 12),
            TextField(controller: _sku, decoration: const InputDecoration(labelText: 'SKU')),
            const SizedBox(height: 12),
            TextField(
              controller: _basePrice,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Base Price *'),
            ),
            const SizedBox(height: 12),
            TextField(controller: _category, decoration: const InputDecoration(labelText: 'Category')),
            const SizedBox(height: 12),
            TextField(
              controller: _description,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 4),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: _isCustom,
              onChanged: (value) => setState(() => _isCustom = value ?? false),
              title: const Text('Custom Price'),
              subtitle: const Text('Price is entered at the time of sale, not fixed here.'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: saving ? null : _submit,
                child: saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
