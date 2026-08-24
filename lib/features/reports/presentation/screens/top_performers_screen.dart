import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../../domain/top_performer.dart';

/// `GET /api/analytics/top-performers` — leaderboard behind the
/// Dashboard's "User Sales" quick report tile.
class TopPerformersScreen extends ConsumerWidget {
  const TopPerformersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final performersAsync = ref.watch(topPerformersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User Sales')),
      body: performersAsync.when(
        data: (performers) {
          if (performers.isEmpty) {
            return const EmptyStateView(message: 'No sales data yet.', icon: Icons.emoji_events_outlined);
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(topPerformersProvider.future),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: performers.length,
              itemBuilder: (context, index) => _PerformerTile(rank: index + 1, performer: performers[index]),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(topPerformersProvider),
        ),
      ),
    );
  }
}

class _PerformerTile extends StatelessWidget {
  const _PerformerTile({required this.rank, required this.performer});

  final int rank;
  final TopPerformer performer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(child: Text('$rank')),
        title: Text(performer.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('${performer.dealsWon} payment${performer.dealsWon == 1 ? '' : 's'}'),
        trailing: Text(
          performer.totalRevenue.toStringAsFixed(0),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
