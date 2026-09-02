import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/role_utils.dart';
import '../../../../core/utils/text_format.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../../auth/providers/session_provider.dart';
import '../../../users/domain/hierarchy_user.dart';
import '../../../users/providers/users_provider.dart';
import '../../providers/opportunities_list_provider.dart';
import '../widgets/opportunities_filter_sheet.dart';
import '../widgets/opportunity_card.dart';

// Matches the green accent used across the rest of the app's tab-root
// screens (see Leads' `_brandColor` in leads_list_screen.dart) — the
// reference design uses this same green for the Team/Mine toggle, the
// filter button, and status accents.
const _brandColor = Color(0xFF578732);

class OpportunitiesListScreen extends ConsumerStatefulWidget {
  const OpportunitiesListScreen({super.key});

  @override
  ConsumerState<OpportunitiesListScreen> createState() => _OpportunitiesListScreenState();
}

class _OpportunitiesListScreenState extends ConsumerState<OpportunitiesListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _search(String query) {
    final current = ref.read(opportunitiesListProvider).valueOrNull;
    ref.read(opportunitiesListProvider.notifier).applyFilters(
          search: query.trim().isEmpty ? null : query.trim(),
          stage: current?.stage,
          type: current?.type,
          leadSource: current?.leadSource,
          ownerId: current?.ownerId,
          startDate: current?.startDate,
          endDate: current?.endDate,
          scope: current?.scope,
        );
  }

  void _setScope(OpportunitiesScope scope) {
    final current = ref.read(opportunitiesListProvider).valueOrNull;
    ref.read(opportunitiesListProvider.notifier).applyFilters(
          search: current?.search,
          stage: current?.stage,
          type: current?.type,
          leadSource: current?.leadSource,
          // Switching to "Mine" doesn't need to touch `ownerId` itself — the
          // provider forces it to the caller's own id whenever `scope` is
          // `mine`, regardless of whatever the Owner filter last held.
          ownerId: current?.ownerId,
          startDate: current?.startDate,
          endDate: current?.endDate,
          scope: scope,
        );
  }

  void _clearFilter({bool stage = false, bool type = false, bool source = false, bool owner = false, bool dateRange = false}) {
    final current = ref.read(opportunitiesListProvider).valueOrNull;
    ref.read(opportunitiesListProvider.notifier).applyFilters(
          search: current?.search,
          stage: stage ? null : current?.stage,
          type: type ? null : current?.type,
          leadSource: source ? null : current?.leadSource,
          ownerId: owner ? null : current?.ownerId,
          startDate: dateRange ? null : current?.startDate,
          endDate: dateRange ? null : current?.endDate,
          scope: current?.scope,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(opportunitiesListProvider);
    final data = state.valueOrNull;

    final session = ref.watch(sessionControllerProvider).valueOrNull;
    final hierarchyUsers = ref.watch(hierarchyUsersProvider).valueOrNull ?? const [];
    final hasDirectReports = session != null && hierarchyUsers.any((u) => u.reportsToId == session.id);
    // Same two-part gate as web's `showTeamTab = isManager(currentUser) ||
    // hasDirectReports` (Dad-frontend/src/pages/opportunities/index.tsx) —
    // a plain rep with no reports never sees the toggle at all, since the
    // backend already scopes them to just their own opportunities.
    final showTeamTab = isManagerRole(session?.role) || hasDirectReports;

    return Scaffold(
      // A plain `AppBar`, not `GlobalAppBar` — Opportunities is a pushed
      // route (`/opportunities`), not one of the 5 tab-root screens inside
      // `AppShell`'s `ShellRoute`, so it needs the default back button
      // `GlobalAppBar` deliberately suppresses for its tab-root use case.
      appBar: AppBar(title: const Text('Opportunities')),
      body: Column(
        children: [
          if (showTeamTab)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: _ScopeToggle(
                scope: data?.scope ?? OpportunitiesScope.team,
                onChanged: _setScope,
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search opportunities…',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onSubmitted: _search,
                  ),
                ),
                const SizedBox(width: 8),
                _SquareIconButton(
                  tooltip: 'Filters',
                  icon: Icons.tune,
                  badgeCount: data?.hasActiveFilters ?? false ? 1 : null,
                  onTap: () => showOpportunitiesFilterSheet(
                    context,
                    ref,
                    showOwnerFilter: showTeamTab && (data?.scope ?? OpportunitiesScope.team) == OpportunitiesScope.team,
                  ),
                ),
              ],
            ),
          ),
          if (data?.hasActiveFilters ?? false)
            _ActiveFilterChips(data: data!, users: hierarchyUsers, onClear: _clearFilter),
          if (data == null)
            Expanded(
              child: state.when(
                data: (_) => const SizedBox.shrink(),
                loading: () => const ListSkeleton(),
                error: (error, stack) => ErrorStateView(
                  error: error,
                  onRetry: () => ref.read(opportunitiesListProvider.notifier).refresh(),
                ),
              ),
            )
          else ...[
            SizedBox(
              height: 2,
              child: state.isLoading ? const LinearProgressIndicator(minHeight: 2) : null,
            ),
            Expanded(child: _OpportunitiesListSection(data: data, scrollController: _scrollController)),
          ],
        ],
      ),
    );
  }
}

class _ScopeToggle extends StatelessWidget {
  const _ScopeToggle({required this.scope, required this.onChanged});

  final OpportunitiesScope scope;
  final ValueChanged<OpportunitiesScope> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ScopeSegment(
            label: 'Team',
            icon: Icons.groups_outlined,
            selected: scope == OpportunitiesScope.team,
            onTap: () => onChanged(OpportunitiesScope.team),
          ),
          _ScopeSegment(
            label: 'Mine',
            icon: Icons.person_outline,
            selected: scope == OpportunitiesScope.mine,
            onTap: () => onChanged(OpportunitiesScope.mine),
          ),
        ],
      ),
    );
  }
}

class _ScopeSegment extends StatelessWidget {
  const _ScopeSegment({required this.label, required this.icon, required this.selected, required this.onTap});

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? _brandColor.withValues(alpha: 0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: selected ? _brandColor : Colors.black54),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: selected ? _brandColor : Colors.black54,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OpportunitiesListSection extends ConsumerWidget {
  const _OpportunitiesListSection({required this.data, required this.scrollController});

  final OpportunitiesListState data;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data.opportunities.isEmpty) {
      return const EmptyStateView(
        message: 'No opportunities match these filters.',
        icon: Icons.trending_up,
      );
    }
    return RefreshIndicator(
      onRefresh: () => ref.read(opportunitiesListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 8, bottom: 100),
        itemCount: data.opportunities.length + 1,
        itemBuilder: (context, index) {
          if (index >= data.opportunities.length) {
            return _LoadMoreFooter(data: data);
          }
          final opportunity = data.opportunities[index];
          return OpportunityCard(
            opportunity: opportunity,
            onTap: () => context.push('/opportunities/${opportunity.id}'),
          );
        },
      ),
    );
  }
}

class _LoadMoreFooter extends ConsumerWidget {
  const _LoadMoreFooter({required this.data});

  final OpportunitiesListState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!data.hasMore) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Center(
        child: OutlinedButton.icon(
          onPressed: data.isLoadingMore ? null : () => ref.read(opportunitiesListProvider.notifier).loadMore(),
          icon: data.isLoadingMore
              ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.keyboard_arrow_down, size: 18),
          label: const Text('Load more'),
        ),
      ),
    );
  }
}

class _SquareIconButton extends StatelessWidget {
  const _SquareIconButton({required this.icon, required this.tooltip, required this.onTap, this.badgeCount});

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _brandColor.withValues(alpha: 0.12),
            border: Border.all(color: _brandColor.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(child: Icon(icon, color: _brandColor)),
              if (badgeCount != null)
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: _brandColor, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                    child: Text(
                      '$badgeCount',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const _stageLabels = {'expected': 'Expected', 'closed_won': 'Closed Won', 'closed_lost': 'Closed Lost'};
const _typeLabels = {'NEW_BUSINESS': 'New Business', 'UPSALE': 'Upsale'};

class _ActiveFilterChips extends StatelessWidget {
  const _ActiveFilterChips({required this.data, required this.users, required this.onClear});

  final OpportunitiesListState data;
  final List<HierarchyUser> users;
  final void Function({bool stage, bool type, bool source, bool owner, bool dateRange}) onClear;

  String _ownerLabel(String id) {
    final match = users.where((u) => u.id == id);
    return match.isEmpty ? id : match.first.fullName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: SizedBox(
        height: 32,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            if (data.stage != null)
              _FilterChip(label: 'Stage: ${_stageLabels[data.stage!] ?? data.stage!}', onDeleted: () => onClear(stage: true)),
            if (data.type != null)
              _FilterChip(label: 'Type: ${_typeLabels[data.type!] ?? data.type!}', onDeleted: () => onClear(type: true)),
            if (data.leadSource != null)
              _FilterChip(label: 'Source: ${humanizeSnakeCase(data.leadSource!)}', onDeleted: () => onClear(source: true)),
            if (data.ownerId != null)
              _FilterChip(label: 'Owner: ${_ownerLabel(data.ownerId!)}', onDeleted: () => onClear(owner: true)),
            if (data.startDate != null || data.endDate != null)
              _FilterChip(label: 'Date Range', onDeleted: () => onClear(dateRange: true)),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.onDeleted});

  final String label;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InputChip(
        label: Text(label, overflow: TextOverflow.ellipsis),
        onDeleted: onDeleted,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
