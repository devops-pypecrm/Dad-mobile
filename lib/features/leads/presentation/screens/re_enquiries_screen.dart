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
///
/// `GET /api/leads/re-enquiries` has no search/filter params of its own
/// (see `LeadsRepository.getReEnquiryLeads`'s doc comment) — this screen
/// only ever gets one unpaginated list back, so search here is a plain
/// client-side filter over that already-fetched list, not a debounced
/// refetch like Leads/Follow Ups.
class ReEnquiriesScreen extends ConsumerStatefulWidget {
  const ReEnquiriesScreen({super.key});

  @override
  ConsumerState<ReEnquiriesScreen> createState() => _ReEnquiriesScreenState();
}

class _ReEnquiriesScreenState extends ConsumerState<ReEnquiriesScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final leadsAsync = ref.watch(reEnquiriesProvider);

    return Scaffold(
      // Plain `AppBar()` with no explicit `leading` — Flutter's default
      // `automaticallyImplyLeading` already shows a back arrow here, since
      // this route is pushed on top of the shell (reached from the drawer),
      // same convention as every other drawer-only screen (Products, etc.).
      appBar: AppBar(title: const Text('Re-Enquiries')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAEF),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: TextField(
                controller: _searchController,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) => setState(() => _query = value),
                decoration: InputDecoration(
                  hintText: 'Search name, phone, email…',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () => setState(() {
                            _searchController.clear();
                            _query = '';
                          }),
                        ),
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF9FAEF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: leadsAsync.when(
              data: (leads) {
                final query = _query.trim().toLowerCase();
                final filtered = query.isEmpty
                    ? leads
                    : leads.where((lead) {
                        return lead.fullName.toLowerCase().contains(query) ||
                            lead.phone.toLowerCase().contains(query) ||
                            (lead.email?.toLowerCase().contains(query) ?? false);
                      }).toList();

                if (filtered.isEmpty) {
                  return EmptyStateView(
                    message: query.isEmpty
                        ? 'No re-enquiries right now.'
                        : 'No re-enquiries match "$_query".',
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
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final lead = filtered[index];
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
          ),
        ],
      ),
    );
  }
}
