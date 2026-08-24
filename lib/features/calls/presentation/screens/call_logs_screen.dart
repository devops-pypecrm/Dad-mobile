import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../providers/call_logs_list_provider.dart';
import '../widgets/call_log_card.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Logs'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
        ),
      ),
      body: state.when(
        data: (data) {
          if (data.calls.isEmpty) {
            return const EmptyStateView(
              message: 'No call logs found.',
              icon: Icons.call_outlined,
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(callLogsListProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: data.calls.length + (data.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= data.calls.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return CallLogCard(call: data.calls[index]);
              },
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
