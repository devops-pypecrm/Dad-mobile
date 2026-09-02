import 'dart:math' as math;

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

const _brandColor = Color(0xFF578732);

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
/// behavior: a 1-char query fetches lightweight string suggestions, 2+
/// characters fetches real matching results live as the user types (see
/// `SearchController`) — no need to press Enter first. One backend-side
/// gap worth knowing: `/search/global` covers Lead/Contact/Account/
/// Opportunity/Task — it does NOT search the `FollowUp` model (a separate
/// table from `Task` on the backend, see Dad-backend/CLAUDE.md), so
/// follow-ups are not searchable here or on web today.
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
          SnackBar(
            content: Text(
              '${_capitalize(result.type)} details aren\'t available in the app yet.',
            ),
          ),
        );
    }
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(searchControllerProvider);
    final currency = ref
        .watch(sessionControllerProvider)
        .valueOrNull
        ?.organisation
        .currency;

    return Scaffold(
      appBar: const GlobalAppBar(title: 'Search'),
      body: Column(
        children: [
          // The search input itself used to sit in the AppBar's title slot;
          // now a plain section at the top of the body, since the AppBar is
          // shared across every tab and carries no screen-specific controls.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search leads, accounts, opportunities…',
                  prefixIcon: Icon(Icons.search),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (q) => ref
                    .read(searchControllerProvider.notifier)
                    .onQueryChanged(q),
                onSubmitted: (q) =>
                    ref.read(searchControllerProvider.notifier).submit(q),
              ),
            ),
          ),
          Expanded(
            child: stateAsync.when(
              data: (state) {
                if (state.isSearching)
                  return const ListSkeleton(itemHeight: 84);
                if (state.searchError != null) {
                  return ErrorStateView(
                    error: state.searchError!,
                    onRetry: () => ref
                        .read(searchControllerProvider.notifier)
                        .retryLastSearch(),
                  );
                }
                if (state.results != null) {
                  return _ResultsList(
                    results: state.results!,
                    currency: currency,
                    onTap: _openResult,
                  );
                }
                if (state.suggestions.isNotEmpty) {
                  return ListView(
                    // Clears the floating bottom nav bar (see AppShell) —
                    // same value Dashboard/Leads/Follow Ups/Reports use.
                    padding: EdgeInsets.fromLTRB(
                      16,
                      8,
                      16,
                      math.max(MediaQuery.paddingOf(context).bottom + 12, 95),
                    ),
                    children: [
                      const _SectionHeader('Suggestions'),
                      const SizedBox(height: 12),
                      for (final s in state.suggestions)
                        _SimpleResultTile(
                          icon: Icons.search,
                          label: s,
                          onTap: () => _runSearch(s),
                        ),
                    ],
                  );
                }
                if (state.recent.isEmpty) {
                  return const EmptyStateView(
                    message:
                        'Search for a lead, account, opportunity, or task.',
                    icon: Icons.search,
                  );
                }
                return ListView(
                  // Clears the floating bottom nav bar (see AppShell) — same
                  // value Dashboard/Leads/Follow Ups/Reports use.
                  padding: EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    math.max(MediaQuery.paddingOf(context).bottom + 12, 95),
                  ),
                  children: [
                    const _SectionHeader('Recent Searches'),
                    const SizedBox(height: 12),
                    for (final q in state.recent)
                      _SimpleResultTile(
                        icon: Icons.history,
                        label: q,
                        onTap: () => _runSearch(q),
                      ),
                  ],
                );
              },
              loading: () => const ListSkeleton(itemHeight: 84),
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

/// Section title + a short brand-color underline accent — same pattern as
/// Reports' `_SectionHeader`, reused here for visual consistency across
/// the app.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Container(
          width: 24,
          height: 3,
          decoration: BoxDecoration(
            color: _brandColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

/// A plain query row (suggestion or recent search) — white rounded card
/// with an icon circle, matching the app's card language rather than a
/// bare `ListTile`.
class _SimpleResultTile extends StatelessWidget {
  const _SimpleResultTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: _brandColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 17, color: _brandColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.north_west,
                  size: 15,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultsList extends StatelessWidget {
  const _ResultsList({
    required this.results,
    required this.currency,
    required this.onTap,
  });

  final List<SearchResult> results;
  final String? currency;
  final void Function(SearchResult) onTap;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const EmptyStateView(
        message: 'No results found.',
        icon: Icons.search_off,
      );
    }

    final theme = Theme.of(context);

    return ListView.builder(
      // Clears the floating bottom nav bar (see AppShell) — same value
      // Dashboard/Leads/Follow Ups/Reports use.
      padding: EdgeInsets.fromLTRB(
        16,
        8,
        16,
        math.max(MediaQuery.paddingOf(context).bottom + 12, 95),
      ),
      itemCount: results.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SectionHeader(
              '${results.length} Result${results.length == 1 ? '' : 's'}',
            ),
          );
        }
        final result = results[index - 1];
        final (icon, color) = _typeIcons[result.type] ?? _defaultTypeIcon;

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onTap(result),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: color, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  result.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              if (result.value != null)
                                Text(
                                  CurrencyFormatter.format(
                                    result.value!,
                                    currency,
                                  ),
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: const Color(0xFF16A34A),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${result.type.toUpperCase()} · ${result.subtitle ?? ''}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (result.description != null &&
                              result.description!.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              result.description!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              if (result.assignedTo != null &&
                                  result.assignedTo!.isNotEmpty) ...[
                                Icon(
                                  Icons.person_outline,
                                  size: 13,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  result.assignedTo!,
                                  style: theme.textTheme.labelSmall,
                                ),
                                const Spacer(),
                              ] else
                                const Spacer(),
                              if (result.createdAt != null)
                                Text(
                                  formatRelativeDate(result.createdAt!),
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
