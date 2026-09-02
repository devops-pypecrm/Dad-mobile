import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/leads_repository.dart';
import '../domain/lead_call_history_item.dart';
import '../domain/lead_ownership_history_item.dart';
import '../domain/lead_timeline_item.dart';
import '../domain/lead_whatsapp_activity.dart';

part 'lead_activity_providers.g.dart';

/// Backs the Lead Detail "Timeline" tab.
@riverpod
Future<List<LeadTimelineItem>> leadTimeline(
  AutoDisposeFutureProviderRef<List<LeadTimelineItem>> ref,
  String leadId,
) {
  return ref.watch(leadsRepositoryProvider).getLeadTimeline(leadId);
}

/// Backs BOTH the "WhatsApp Messages" and "WhatsApp Calls" tabs — one fetch,
/// split client-side by [isWhatsAppCall] in the widgets that consume it, so
/// switching between those two tabs doesn't refetch.
@riverpod
Future<List<LeadWhatsAppActivity>> leadWhatsAppActivity(
  AutoDisposeFutureProviderRef<List<LeadWhatsAppActivity>> ref,
  String leadId,
) {
  return ref.watch(leadsRepositoryProvider).getLeadWhatsAppActivity(leadId);
}

/// Backs the Lead Detail "Call History" tab.
@riverpod
Future<List<LeadCallHistoryItem>> leadCallHistory(
  AutoDisposeFutureProviderRef<List<LeadCallHistoryItem>> ref,
  String leadId,
) {
  return ref.watch(leadsRepositoryProvider).getLeadCallHistory(leadId);
}

/// Backs the Lead Detail "Ownership History" tab.
@riverpod
Future<List<LeadOwnershipHistoryItem>> leadOwnershipHistory(
  AutoDisposeFutureProviderRef<List<LeadOwnershipHistoryItem>> ref,
  String leadId,
) {
  return ref.watch(leadsRepositoryProvider).getLeadOwnershipHistory(leadId);
}
