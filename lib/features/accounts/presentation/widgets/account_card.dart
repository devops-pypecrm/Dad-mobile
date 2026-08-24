import 'package:flutter/material.dart';

import '../../domain/account.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key, required this.account, required this.onTap});

  final Account account;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                account.name,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              if (account.industry != null && account.industry!.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  account.industry!,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Chip(label: Text(account.type), visualDensity: VisualDensity.compact, padding: EdgeInsets.zero),
                  const Spacer(),
                  Icon(Icons.trending_up, size: 16, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text('${account.opportunities.length} open'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
