import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/role_utils.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../../auth/providers/session_provider.dart';
import '../../providers/call_logs_list_provider.dart';
import '../widgets/call_log_card.dart';
import '../widgets/call_logs_filter_sheet.dart';
import '../widgets/call_stats_header.dart';
import 'call_recording_info_screen.dart';
import 'call_recording_settings_screen.dart';

class CallLogsScreen extends ConsumerStatefulWidget {
  const CallLogsScreen({super.key});

  @override
  ConsumerState<CallLogsScreen> createState() => _CallLogsScreenState();
}

class _CallLogsScreenState extends ConsumerState<CallLogsScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(callLogsListProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(callLogsListProvider);
    final isAdmin = isAdminRole(ref.watch(sessionControllerProvider).valueOrNull?.role);
    final hasActiveFilters = state.valueOrNull?.hasActiveFilters ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Logs'),
        actions: [
          if (isAdmin)
            IconButton(
              tooltip: 'Recording settings',
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CallRecordingSettingsScreen()),
              ),
            ),
          IconButton(
            tooltip: 'About call recording',
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CallRecordingInfoScreen()),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search by name or phone…',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onSubmitted: (query) =>
                        ref.read(callLogsListProvider.notifier).search(query.trim().isEmpty ? null : query.trim()),
                  ),
                ),
                const SizedBox(width: 8),
                Badge(
                  isLabelVisible: hasActiveFilters,
                  smallSize: 8,
                  child: IconButton.filledTonal(
                    tooltip: 'Filter',
                    icon: const Icon(Icons.filter_list),
                    onPressed: () => showCallLogsFilterSheet(context, ref),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: state.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () => ref.read(callLogsListProvider.notifier).refresh(),
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              children: [
                const CallStatsHeader(),
                const SizedBox(height: 8),
                if (data.calls.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: EmptyStateView(message: 'No call logs found.', icon: Icons.call_outlined),
                  )
                else ...[
                  for (final call in data.calls) CallLogCard(call: call),
                  if (data.hasMore)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ],
            ),
          );
        },
        loading: () => const ListSkeleton(),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.read(callLogsListProvider.notifier).refresh(),
        ),
      ),
    );
  }
}
