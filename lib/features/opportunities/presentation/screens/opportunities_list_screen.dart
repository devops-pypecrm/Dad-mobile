import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../providers/opportunities_list_provider.dart';
import '../widgets/opportunity_card.dart';

class OpportunitiesListScreen extends ConsumerStatefulWidget {
  const OpportunitiesListScreen({super.key});

  @override
  ConsumerState<OpportunitiesListScreen> createState() => _OpportunitiesListScreenState();
}

class _OpportunitiesListScreenState extends ConsumerState<OpportunitiesListScreen> {
  final _scrollController = ScrollController();

  static const _stages = [null, 'prospecting', 'qualification', 'proposal', 'negotiation', 'closed_won', 'closed_lost'];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(opportunitiesListProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(opportunitiesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opportunities'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: _stages.map((stage) {
                final selected = state.valueOrNull?.stage == stage;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: ChoiceChip(
                    label: Text(stage ?? 'All'),
                    selected: selected,
                    // Default Chip padding renders well under the 48dp
                    // minimum tap target since it's the sole filter control.
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    onSelected: (_) => ref.read(opportunitiesListProvider.notifier).filterByStage(stage),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: state.when(
        data: (data) {
          if (data.opportunities.isEmpty) {
            return const EmptyStateView(
              message: 'No opportunities found.',
              icon: Icons.trending_up,
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(opportunitiesListProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: data.opportunities.length + (data.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= data.opportunities.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final opportunity = data.opportunities[index];
                return OpportunityCard(
                  opportunity: opportunity,
                  onTap: () => context.push('/opportunities/${opportunity.id}'),
                );
              },
            ),
          );
        },
        loading: () => const ListSkeleton(),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.read(opportunitiesListProvider.notifier).refresh(),
        ),
      ),
    );
  }
}
