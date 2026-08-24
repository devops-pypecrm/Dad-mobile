import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../providers/checkin_sync_controller.dart';
import '../../providers/checkins_feed_provider.dart';
import '../widgets/authenticated_thumbnail.dart';

/// "Field Activity Feed" — today's check-ins for the visible team
/// (Dad-backend applies hierarchy visibility server-side).
class CheckInsFeedScreen extends ConsumerWidget {
  const CheckInsFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedAsync = ref.watch(checkInsFeedProvider);
    final pendingCount = ref.watch(checkInSyncProvider).valueOrNull ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text("Today's Check-Ins")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/checkins/new'),
        child: const Icon(Icons.add_location_alt_outlined),
      ),
      body: Column(
        children: [
          if (pendingCount > 0)
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.cloud_off, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('$pendingCount check-in${pendingCount == 1 ? '' : 's'} waiting to sync'),
                  ),
                  TextButton(
                    onPressed: () => ref.read(checkInSyncProvider.notifier).trySyncAll(),
                    child: const Text('Sync now'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: feedAsync.when(
              data: (checkIns) {
                if (checkIns.isEmpty) {
                  return const EmptyStateView(
                    message: 'No check-ins logged today.',
                    icon: Icons.location_on_outlined,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () => ref.read(checkInsFeedProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: checkIns.length,
                    itemBuilder: (context, index) {
                      final checkIn = checkIns[index];
                      final related = checkIn.lead ?? checkIn.contact ?? checkIn.account;
                      final userName =
                          [checkIn.user?.firstName, checkIn.user?.lastName].where((p) => p != null).join(' ');
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: ListTile(
                          leading: checkIn.photoUrl != null
                              ? AuthenticatedThumbnail(path: checkIn.photoUrl!)
                              : const CircleAvatar(child: Icon(Icons.location_on_outlined)),
                          title: Text(
                            related?.displayName ?? checkIn.type,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            [
                              if (userName.isNotEmpty) userName,
                              checkIn.address ?? '',
                              '${checkIn.createdAt.toLocal()}'.split('.').first,
                            ].where((s) => s.isNotEmpty).join(' · '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Chip(label: Text(checkIn.type), visualDensity: VisualDensity.compact),
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () => const ListSkeleton(itemHeight: 72),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.read(checkInsFeedProvider.notifier).refresh(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
