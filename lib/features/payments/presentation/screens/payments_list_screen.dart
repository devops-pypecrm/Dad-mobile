import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../providers/emi_schedules_provider.dart';
import '../widgets/emi_schedule_card.dart';

const _statuses = ['active', 'completed', 'defaulted'];

/// EMI/collections list across opportunities. Tapping a schedule opens the
/// Opportunity Detail screen (Phase 3), which already renders the full
/// installment timeline inline — no separate EMI detail screen is built
/// here, to avoid duplicating that UI.
class PaymentsListScreen extends ConsumerStatefulWidget {
  const PaymentsListScreen({super.key});

  @override
  ConsumerState<PaymentsListScreen> createState() => _PaymentsListScreenState();
}

class _PaymentsListScreenState extends ConsumerState<PaymentsListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _statuses.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Active'), Tab(text: 'Completed'), Tab(text: 'Defaulted')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _statuses.map((status) => _ScheduleList(status: status)).toList(),
      ),
    );
  }
}

class _ScheduleList extends ConsumerWidget {
  const _ScheduleList({required this.status});

  final String status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesAsync = ref.watch(emiSchedulesProvider(status: status));

    return schedulesAsync.when(
      data: (schedules) {
        if (schedules.isEmpty) {
          return EmptyStateView(
            message: 'No $status EMI schedules.',
            icon: Icons.account_balance_wallet_outlined,
          );
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(emiSchedulesProvider(status: status).notifier).refresh(),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              final schedule = schedules[index];
              return EmiScheduleCard(
                schedule: schedule,
                onTap: () => context.push('/opportunities/${schedule.opportunity.id}'),
              );
            },
          ),
        );
      },
      loading: () => const ListSkeleton(itemHeight: 100),
      error: (error, stack) => ErrorStateView(
        error: error,
        onRetry: () => ref.invalidate(emiSchedulesProvider(status: status)),
      ),
    );
  }
}
