import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../auth/domain/user_session.dart';
import '../../../auth/providers/saved_accounts_provider.dart';
import '../../../auth/providers/saved_accounts_unread_provider.dart';
import '../../../auth/providers/session_provider.dart';
import '../widgets/add_account_sheet.dart';

/// Reachable from the drawer's green profile banner ("Switch Account") and
/// from Settings ("Manage Accounts") — same screen either way. Lets the
/// user add another account without signing out of the current one, switch
/// the active account to a previously-saved one, or forget a saved login
/// on this device. See `SessionController`'s `addAccount`/`switchToAccount`/
/// `removeSavedAccount` for the actual mechanics.
class AccountSwitcherScreen extends ConsumerWidget {
  const AccountSwitcherScreen({super.key});

  Future<void> _switchTo(BuildContext context, WidgetRef ref, UserSession account) async {
    try {
      await ref.read(sessionControllerProvider.notifier).switchToAccount(account.id);
      ref.invalidate(savedAccountsProvider);
      if (context.mounted) {
        showAppSnackBar(context, 'Switched to ${account.firstName} ${account.lastName}.');
      }
    } catch (e) {
      if (context.mounted) {
        final message = e is ApiException ? e.message : 'Something went wrong.';
        showAppSnackBar(context, "Couldn't switch account: $message", isError: true);
      }
    }
  }

  Future<void> _confirmRemove(BuildContext context, WidgetRef ref, UserSession account) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove saved login?'),
        content: Text(
          "This removes ${account.email} from this device. You'll need to sign in again to use it here.",
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(sessionControllerProvider.notifier).removeSavedAccount(account.id);
    ref.invalidate(savedAccountsProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final active = ref.watch(sessionControllerProvider).valueOrNull;
    final savedAsync = ref.watch(savedAccountsProvider);
    final unreadCounts = ref.watch(savedAccountsUnreadCountsProvider).valueOrNull ?? const {};

    return Scaffold(
      appBar: AppBar(title: const Text('Switch Account')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Active', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          if (active != null) _AccountTile(account: active, isActive: true),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => showAddAccountSheet(context, ref),
            icon: const Icon(Icons.add),
            label: const Text('Add Account'),
          ),
          const SizedBox(height: 24),
          Text('Saved Accounts', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          savedAsync.when(
            data: (accounts) {
              if (accounts.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'No other accounts saved on this device yet.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                );
              }
              return Column(
                children: [
                  for (final account in accounts)
                    _AccountTile(
                      account: account,
                      isActive: false,
                      unreadCount: unreadCounts[account.id] ?? 0,
                      onTap: () => _switchTo(context, ref, account),
                      onRemove: () => _confirmRemove(context, ref, account),
                    ),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => ErrorStateView(
              error: error,
              onRetry: () => ref.invalidate(savedAccountsProvider),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.account,
    required this.isActive,
    this.unreadCount = 0,
    this.onTap,
    this.onRemove,
  });

  final UserSession account;
  final bool isActive;
  final int unreadCount;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: kBrandColor.withValues(alpha: 0.15),
          child: Text(account.initial, style: const TextStyle(color: kBrandColor, fontWeight: FontWeight.bold)),
        ),
        title: Text('${account.firstName} ${account.lastName}', maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${account.email} · ${account.organisation.name}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: isActive
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kBrandColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'ACTIVE',
                  style: TextStyle(color: kBrandColor, fontWeight: FontWeight.bold, fontSize: 11),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (unreadCount > 0)
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        unreadCount > 9 ? '9+' : '$unreadCount',
                        style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                  IconButton(
                    tooltip: 'Remove',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: onRemove,
                  ),
                ],
              ),
      ),
    );
  }
}
