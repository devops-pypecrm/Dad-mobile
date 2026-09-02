import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/role_utils.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/product.dart';
import '../../providers/product_actions_controller.dart';
import '../../providers/products_list_provider.dart';
import '../../providers/products_stats_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/product_form_sheet.dart';

class ProductsListScreen extends ConsumerStatefulWidget {
  const ProductsListScreen({super.key});

  @override
  ConsumerState<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends ConsumerState<ProductsListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(productsListProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _confirmDelete(BuildContext context, Product product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text(
          'Delete "${product.name}"? This can\'t be undone from here.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final success = await ref
        .read(productActionsControllerProvider.notifier)
        .delete(product.id);
    if (!context.mounted) return;
    if (!success) {
      final error = ref.read(productActionsControllerProvider).error;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("Couldn't delete product: $error")),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsListProvider);
    final statsAsync = ref.watch(productsStatsProvider);
    // Create/update/delete are org-admin-only server-side (403 otherwise) —
    // hide the Add button and per-card Edit/Delete menu for anyone else
    // rather than let every tap fail.
    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final isOrgAdmin = isOrgAdminRole(session?.role);
    final currency = session?.organisation.currency;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search products…',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
              onSubmitted: (query) => ref
                  .read(productsListProvider.notifier)
                  .search(query.trim().isEmpty ? null : query.trim()),
            ),
          ),
        ),
      ),
      // No extra bottom padding here — Scaffold already keeps a plain FAB
      // (no bottomNavigationBar competing for the slot, unlike AppShell's
      // custom floating bar) clear of the system nav bar on its own; adding
      // `safeBottomInset` on top of that stacked with Scaffold's own
      // clearance and pushed the button too far up.
      floatingActionButton: isOrgAdmin
          ? FloatingActionButton.extended(
              onPressed: () => showProductFormSheet(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Product'),
            )
          : null,
      body: state.when(
        data: (data) {
          if (data.products.isEmpty) {
            return const EmptyStateView(
              message: 'No products found.',
              icon: Icons.inventory_2_outlined,
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(productsListProvider.notifier).refresh();
              ref.invalidate(productsStatsProvider);
            },
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: 1 + data.products.length + (data.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _StatsRow(statsAsync: statsAsync, currency: currency);
                }
                final productIndex = index - 1;
                if (productIndex >= data.products.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final product = data.products[productIndex];
                return ProductCard(
                  product: product,
                  onEdit: isOrgAdmin
                      ? () => showProductFormSheet(context, editing: product)
                      : null,
                  onDelete: isOrgAdmin
                      ? () => _confirmDelete(context, product)
                      : null,
                );
              },
            ),
          );
        },
        loading: () => const ListSkeleton(),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.read(productsListProvider.notifier).refresh(),
        ),
      ),
    );
  }
}

/// The 3 stat cards from Dad-frontend's Products page (Total Products,
/// Total Catalog Value, Active Products) — see `ProductsStats`'s doc
/// comment for which of the 3 is a true server count vs a best-effort
/// sample-based sum, and why.
class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.statsAsync, required this.currency});

  final AsyncValue<ProductsStats> statsAsync;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: statsAsync.when(
        data: (stats) => Row(
          children: [
            Expanded(
              child: _StatCard(
                label: 'Total Products',
                value: '${stats.totalProducts}',
                icon: Icons.inventory_2_outlined,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                label: 'Catalog Value',
                value: CurrencyFormatter.compact(stats.totalValue, currency),
                icon: Icons.payments_outlined,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                label: 'Active',
                value: '${stats.activeCount}',
                icon: Icons.check_circle_outline,
              ),
            ),
          ],
        ),
        loading: () => const SizedBox(
          height: 84,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (error, stack) => const SizedBox.shrink(),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.primary.withValues(alpha: 0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: theme.colorScheme.primary.withValues(alpha: 0.15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
