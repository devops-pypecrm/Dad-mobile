import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../checkins/data/location_service.dart';
import '../../../checkins/domain/checkin.dart';
import '../../../checkins/domain/checkin_type_label.dart';
import '../../../checkins/domain/pending_checkin.dart';
import '../../../checkins/providers/checkin_sync_controller.dart';
import '../../../checkins/providers/checkins_feed_provider.dart';
import '../../domain/field_team_member.dart';
import '../../providers/checkin_history_provider.dart';
import '../../providers/field_operations_provider.dart';
import '../widgets/field_stat_card.dart';
import '../widgets/team_locations_map.dart';

const _brandColor = Color(0xFF578732);

/// "Field Operations" — the mobile counterpart to Dad-frontend's
/// `/field-force` page: live team-location map, KPI stat cards, a team
/// activity roster, and a sortable/paginated check-in history, all built on
/// top of the existing `checkins` feature (this screen adds no new backend
/// endpoints — everything here is `GET /api/checkins` viewed differently,
/// same as the web page).
class FieldOperationsScreen extends ConsumerStatefulWidget {
  const FieldOperationsScreen({super.key});

  @override
  ConsumerState<FieldOperationsScreen> createState() => _FieldOperationsScreenState();
}

class _FieldOperationsScreenState extends ConsumerState<FieldOperationsScreen> {
  bool _isCheckingIn = false;

  Future<void> _quickCheckIn() async {
    setState(() => _isCheckingIn = true);

    double? latitude;
    double? longitude;
    try {
      final position = await ref.read(locationServiceProvider).getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (_) {
      // Same graceful fallback as Dad-frontend's `handleCheckIn`: submit
      // without coordinates rather than blocking the check-in entirely.
    }

    final draft = PendingCheckIn(
      localId: '${DateTime.now().microsecondsSinceEpoch}',
      type: 'CHECK_IN',
      latitude: latitude,
      longitude: longitude,
      capturedAt: DateTime.now(),
    );

    try {
      final outcome = await ref.read(checkInSyncProvider.notifier).submit(draft);
      if (!mounted) return;
      showAppSnackBar(
        context,
        outcome == CheckInSubmitOutcome.submitted
            ? 'Checked in successfully!'
            : "You're offline — check-in saved and will sync automatically.",
      );
      ref.read(checkInsFeedProvider.notifier).hardReset();
      ref.read(checkInHistoryProvider.notifier).hardReset();
    } catch (e) {
      if (!mounted) return;
      showAppSnackBar(context, 'Failed to check in: $e', isError: true);
    } finally {
      if (mounted) setState(() => _isCheckingIn = false);
    }
  }

  Future<void> _refreshAll() async {
    ref.read(checkInsFeedProvider.notifier).hardReset();
    ref.read(checkInHistoryProvider.notifier).hardReset();
    await Future.wait([
      ref.read(checkInsFeedProvider.future),
      ref.read(checkInHistoryProvider.future),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final snapshotAsync = ref.watch(fieldOperationsSnapshotProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Field Operations'),
        actions: [
          IconButton(
            tooltip: 'Full check-in form',
            icon: const Icon(Icons.add_location_alt_outlined),
            onPressed: () => context.push('/checkins/new'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshAll,
        child: snapshotAsync.when(
          data: (snapshot) => _buildBody(context, snapshot),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => ErrorStateView(
            error: error,
            onRetry: () => ref.invalidate(fieldOperationsSnapshotProvider),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, FieldOperationsSnapshot snapshot) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        FilledButton.icon(
          onPressed: _isCheckingIn ? null : _quickCheckIn,
          style: FilledButton.styleFrom(backgroundColor: _brandColor, minimumSize: const Size.fromHeight(48)),
          icon: _isCheckingIn
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white),
                )
              : const Icon(Icons.my_location),
          label: Text(_isCheckingIn ? 'Checking in…' : 'Check In Now'),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.3,
          children: [
            FieldStatCard(
              icon: Icons.check_circle_outline,
              value: '${snapshot.checkedInCount}',
              label: 'Currently Checked In',
              color: Colors.green,
            ),
            FieldStatCard(
              icon: Icons.navigation_outlined,
              value: '${snapshot.inTransitCount}',
              label: 'In Transit',
              color: Colors.blue,
            ),
            FieldStatCard(
              icon: Icons.location_on_outlined,
              value: '${snapshot.visitsToday}',
              label: 'Visits Today',
              color: Colors.purple,
            ),
            FieldStatCard(
              icon: Icons.trending_up,
              value: '${snapshot.productivityScore}%',
              label: 'Productivity Score',
              color: Colors.orange,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Live Team Locations',
          subtitle: "Real-time tracking of your field team",
          icon: Icons.map_outlined,
          child: SizedBox(height: 280, child: TeamLocationsMap(members: snapshot.mappable)),
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Team Activity',
          subtitle: 'Live status updates',
          icon: Icons.groups_outlined,
          padded: snapshot.team.isEmpty,
          child: snapshot.team.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('No field team members found'),
                )
              : Column(
                  children: [for (final member in snapshot.team) _TeamActivityTile(member: member)],
                ),
        ),
        const SizedBox(height: 20),
        _CheckInHistorySection(),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
    this.padded = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;
  final bool padded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Icon(icon, size: 20, color: _brandColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(padding: padded ? const EdgeInsets.all(16) : EdgeInsets.zero, child: child),
        ],
      ),
    );
  }
}

class _TeamActivityTile extends StatelessWidget {
  const _TeamActivityTile({required this.member});

  final FieldTeamMember member;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = member.isCheckedIn ? Colors.green : theme.colorScheme.onSurfaceVariant;
    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: _brandColor.withValues(alpha: 0.12),
            child: Text(member.initials, style: const TextStyle(color: _brandColor, fontWeight: FontWeight.w600)),
          ),
          Positioned(
            bottom: -1,
            right: -1,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(color: theme.colorScheme.surface, width: 2),
              ),
            ),
          ),
        ],
      ),
      title: Text(member.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(member.location, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Chip(
            label: Text(member.isCheckedIn ? 'Checked In' : 'Offline'),
            visualDensity: VisualDensity.compact,
            backgroundColor: member.isCheckedIn ? Colors.green.withValues(alpha: 0.12) : null,
            labelStyle: TextStyle(color: member.isCheckedIn ? Colors.green.shade800 : null, fontSize: 11),
            side: BorderSide.none,
          ),
          const SizedBox(height: 2),
          Text(
            member.lastActivityAt != null ? DateFormat('HH:mm').format(member.lastActivityAt!.toLocal()) : '--:--',
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

class _CheckInHistorySection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(checkInHistoryProvider);

    return _SectionCard(
      title: 'Check-in History',
      subtitle: 'Latest field activities',
      icon: Icons.history,
      child: historyAsync.when(
        data: (state) => Column(
          children: [
            if (state.items.isEmpty)
              const Padding(padding: EdgeInsets.all(16), child: Text('No recent check-ins found'))
            else
              for (final checkIn in state.items) _HistoryTile(checkIn: checkIn),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => ref.read(checkInHistoryProvider.notifier).toggleSort(),
                    icon: const Icon(Icons.swap_vert, size: 18),
                    label: Text(state.sortOrder == 'asc' ? 'Oldest first' : 'Newest first'),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: state.hasPrevPage && !state.isLoadingPage
                            ? () => ref.read(checkInHistoryProvider.notifier).prevPage()
                            : null,
                      ),
                      Text('Page ${state.page}'),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: state.hasNextPage && !state.isLoadingPage
                            ? () => ref.read(checkInHistoryProvider.notifier).nextPage()
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (error, stack) => Padding(
          padding: const EdgeInsets.all(16),
          child: ErrorStateView(
            error: error,
            onRetry: () => ref.read(checkInHistoryProvider.notifier).hardReset(),
          ),
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.checkIn});

  final CheckIn checkIn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userName = [checkIn.user?.firstName, checkIn.user?.lastName].where((p) => p != null).join(' ');
    final hasCoords = checkIn.latitude != null && checkIn.longitude != null;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _brandColor.withValues(alpha: 0.12),
        child: Icon(Icons.person_outline, color: _brandColor, size: 20),
      ),
      title: Text(userName.isEmpty ? 'Unknown' : userName, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            checkIn.address ?? 'Unknown location',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            DateFormat('MMM d, h:mm a').format(checkIn.createdAt.toLocal()),
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          if (hasCoords)
            InkWell(
              onTap: () => launchUrl(
                Uri.parse('https://www.google.com/maps/search/?api=1&query=${checkIn.latitude},${checkIn.longitude}'),
                mode: LaunchMode.externalApplication,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.navigation_outlined, size: 12, color: _brandColor),
                    const SizedBox(width: 4),
                    Text(
                      'View on Map',
                      style: theme.textTheme.labelSmall?.copyWith(color: _brandColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      trailing: Chip(
        label: Text(checkInTypeLabel(checkIn.type)),
        visualDensity: VisualDensity.compact,
      ),
      isThreeLine: hasCoords,
    );
  }
}
