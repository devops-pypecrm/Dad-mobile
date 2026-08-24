import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/error_state_view.dart';
import '../../providers/account_detail_provider.dart';

class AccountDetailScreen extends ConsumerWidget {
  const AccountDetailScreen({super.key, required this.accountId});

  final String accountId;

  Future<void> _openDirections(String address) async {
    final uri = Uri.https('www.google.com', '/maps/search/', {'api': '1', 'query': address});
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountAsync = ref.watch(accountDetailProvider(accountId));

    Future<void> handleRefresh() => ref.refresh(accountDetailProvider(accountId).future);

    return accountAsync.when(
      data: (account) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(account.name),
            bottom: const TabBar(
              tabs: [Tab(text: 'Overview'), Tab(text: 'Related'), Tab(text: 'Assets')],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.push('/checkins/new?accountId=$accountId'),
            icon: const Icon(Icons.location_on_outlined),
            label: const Text('Check-In Here'),
          ),
          body: TabBarView(
            children: [
              RefreshIndicator(
                onRefresh: handleRefresh,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (account.industry != null) ListTile(leading: const Icon(Icons.category_outlined), title: Text(account.industry!)),
                    if (account.phone != null)
                      ListTile(leading: const Icon(Icons.phone_outlined), title: Text(account.phone!)),
                    if (account.website != null)
                      ListTile(leading: const Icon(Icons.language_outlined), title: Text(account.website!)),
                    if (account.formattedAddress != null)
                      ListTile(
                        leading: const Icon(Icons.location_on_outlined),
                        title: Text(account.formattedAddress!),
                        trailing: TextButton(
                          onPressed: () => _openDirections(account.formattedAddress!),
                          child: const Text('Directions'),
                        ),
                      ),
                    ListTile(leading: const Icon(Icons.label_outline), title: Text('Type: ${account.type}')),
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: handleRefresh,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text('Contacts', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (account.contacts.isEmpty)
                      Text('No contacts yet.', style: Theme.of(context).textTheme.bodyMedium),
                    ...account.contacts.map(
                      (c) => Card(
                        child: ListTile(
                          leading: const Icon(Icons.person_outline),
                          title: Text('${c.firstName} ${c.lastName}'),
                          subtitle: c.email != null ? Text(c.email!) : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Opportunities', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (account.opportunities.isEmpty)
                      Text('No open opportunities.', style: Theme.of(context).textTheme.bodyMedium),
                    ...account.opportunities.map(
                      (o) => Card(
                        child: ListTile(
                          title: Text(o.name),
                          subtitle: Text(o.stage),
                          trailing: Text(o.amount.toStringAsFixed(0)),
                          onTap: () => context.push('/opportunities/${o.id}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: handleRefresh,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (account.accountProducts.isEmpty)
                      Text('No assets on record.', style: Theme.of(context).textTheme.bodyMedium),
                    ...account.accountProducts.map(
                      (p) => Card(
                        child: ListTile(
                          title: Text(p.customName ?? p.product?.name ?? 'Product'),
                          subtitle: Text('Qty: ${p.quantity}'),
                          trailing: Text(p.price.toStringAsFixed(0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(
        appBar: AppBar(title: const Text('Account')),
        body: ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(accountDetailProvider(accountId)),
        ),
      ),
    );
  }
}
