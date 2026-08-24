import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/relative_date.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../../auth/providers/session_provider.dart';
import '../../domain/search_result.dart';
import '../../providers/search_controller.dart';

/// Same type -> icon/color mapping as `getIcon` in
/// Dad-frontend/src/components/shared/GlobalSearch.tsx:122-131.
const _typeIcons = {
  'lead': (Icons.person_outline, Color(0xFF2563EB)),
  'contact': (Icons.person_outline, Color(0xFF16A34A)),
  'account': (Icons.apartment_outlined, Color(0xFF9333EA)),
  'opportunity': (Icons.trending_up, Color(0xFFEA580C)),
  'task': (Icons.check_box_outlined, Color(0xFFDC2626)),
};
const _defaultTypeIcon = (Icons.description_outlined, Colors.grey);

/// The global-search tab. Mirrors Dad-frontend's `GlobalSearch.tsx`
/// behavior exactly: 1-char queries hit `/search/suggestions` (200ms
/// debounce), 2+ char queries hit `/search/global` (300ms debounce,
/// backed by `SearchController`). One backend-side gap worth knowing:
/// `/search/global` covers Lead/Contact/Account/Opportunity/Task — it does
/// NOT search the `FollowUp` model (a separate table from `Task` on the
/// backend, see Dad-backend/CLAUDE.md), so follow-ups are not searchable
/// here or on web today.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _runSearch(String query) {
    _controller.text = query;
    _controller.selection = TextSelection.collapsed(offset: query.length);
    ref.read(searchControllerProvider.notifier).submit(query);
  }

  void _openResult(SearchResult result) {
    switch (result.type) {
      case 'lead':
        context.push('/leads/${result.id}');
      case 'account':
        context.push('/accounts/${result.id}');
      case 'opportunity':
        context.push('/opportunities/${result.id}');
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${_capitalize(result.type)} details aren\'t available in the app yet.')),
        );
    }
  }

  String _capitalize(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(searchControllerProvider);
    final currency = ref.watch(sessionControllerProvider).valueOrNull?.organisation.currency;

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Search'),
      body: Column(
        children: [
          // The search input itself used to sit in the AppBar's title slot;
          // now a plain section at the top of the body, since the AppBar is
          // shared across every tab and carries no screen-specific controls.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search leads, accounts, opportunities…',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
              ),
              onChanged: (q) => ref.read(searchControllerProvider.notifier).onQueryChanged(q),
              onSubmitted: (q) => ref.read(searchControllerProvider.notifier).submit(q),
            ),
          ),
          Expanded(
            child: stateAsync.when(
              data: (state) {
                if (state.isSearching) return const ListSkeleton(itemHeight: 72);
                if (state.searchError != null) {
                  return ErrorStateView(
                    error: state.searchError!,
                    onRetry: () => ref.read(searchControllerProvider.notifier).retryLastSearch(),
                  );
                }
                if (state.results != null) {
                  return _ResultsList(results: state.results!, currency: currency, onTap: _openResult);
                }
                if (state.suggestions.isNotEmpty) {
                  return ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          'SUGGESTIONS',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, letterSpacing: 0.6),
                        ),
                      ),
                      ...state.suggestions.map(
                        (s) =>
                            ListTile(leading: const Icon(Icons.search), title: Text(s), onTap: () => _runSearch(s)),
                      ),
                    ],
                  );
                }
                if (state.recent.isEmpty) {
                  return const EmptyStateView(
                    message: 'Search for a lead, account, opportunity, or task.',
                    icon: Icons.search,
                  );
                }
                return ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text('Recent Searches', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    ...state.recent.map(
                      (q) => ListTile(leading: const Icon(Icons.history), title: Text(q), onTap: () => _runSearch(q)),
                    ),
                  ],
                );
              },
              loading: () => const ListSkeleton(itemHeight: 72),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.invalidate(searchControllerProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultsList extends StatelessWidget {
  const _ResultsList({required this.results, required this.currency, required this.onTap});

  final List<SearchResult> results;
  final String? currency;
  final void Function(SearchResult) onTap;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const EmptyStateView(message: 'No results found.', icon: Icons.search_off);
    }

    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: results.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              '${results.length} RESULTS',
              style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.6),
            ),
          );
        }
        final result = results[index - 1];
        final (icon, color) = _typeIcons[result.type] ?? _defaultTypeIcon;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(icon, color: color, size: 20),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(result.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              if (result.value != null)
                Text(
                  CurrencyFormatter.format(result.value!, currency),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF10B981),
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${result.type.toUpperCase()} · ${result.subtitle ?? ''}',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              if (result.description != null && result.description!.isNotEmpty)
                Text(result.description!, maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  if (result.assignedTo != null && result.assignedTo!.isNotEmpty) ...[
                    Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(color: theme.colorScheme.primary, shape: BoxShape.circle),
                    ),
                    Text(result.assignedTo!, style: theme.textTheme.labelSmall),
                    const Spacer(),
                  ] else
                    const Spacer(),
                  if (result.createdAt != null)
                    Text(formatRelativeDate(result.createdAt!), style: theme.textTheme.labelSmall),
                ],
              ),
            ],
          ),
          isThreeLine: true,
          onTap: () => onTap(result),
        );
      },
    );
  }
}
