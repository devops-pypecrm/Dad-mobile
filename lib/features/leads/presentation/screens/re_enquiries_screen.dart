import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/list_skeleton.dart';
import '../../providers/re_enquiries_provider.dart';
import '../widgets/lead_card.dart';

/// Leads that re-enquired after being closed — reuses `LeadCard` (which
/// already renders the re-enquiry badge/count) since `GET /api/leads/re-enquiries`
/// returns full `Lead` rows, just a different, unpaginated slice of the
/// same resource. Read-only list; tapping a card goes to the normal lead
/// detail screen.
class ReEnquiriesScreen extends ConsumerWidget {
  const ReEnquiriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leadsAsync = ref.watch(reEnquiriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Re-Enquiries')),
      body: leadsAsync.when(
        data: (leads) {
          if (leads.isEmpty) {
            return const EmptyStateView(
              message: 'No re-enquiries right now.',
              icon: Icons.autorenew,
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(reEnquiriesProvider.future),
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 8,
                bottom: safeBottomInset(context),
              ),
              itemCount: leads.length,
              itemBuilder: (context, index) {
                final lead = leads[index];
                return LeadCard(
                  lead: lead,
                  onTap: () => context.push('/leads/${lead.id}'),
                );
              },
            ),
          );
        },
        loading: () => const ListSkeleton(),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(reEnquiriesProvider),
        ),
      ),
    );
  }
}
