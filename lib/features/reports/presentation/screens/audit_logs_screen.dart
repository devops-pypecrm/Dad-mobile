import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../domain/audit_log_entry.dart';
import '../../providers/reports_providers.dart';

final _dateTimeFormat = DateFormat('MMM d, HH:mm');

const _entities = ['Lead', 'User', 'Opportunity', 'Quote', 'Task', 'License'];
const _actions = ['created', 'updated', 'deleted', 'logged in', 'logged out'];

/// Human-readable summary of an audit log row's `details` JSON blob —
/// a deliberately smaller subset of Dad-frontend's `formatAuditDetail`
/// (`src/pages/reports/audit-logs.tsx`) covering the common cases
/// (status/stage change, create/update/delete, login/logout) rather than
/// porting its full branching logic 1:1.
String _describe(AuditLogEntry log) {
  final d = log.details ?? const {};
  final action = log.action.toUpperCase();
  final entity = log.entity.toLowerCase();
  final name = d['name'] ?? d['title'] ?? d['email'] ?? d['firstName'] ?? log.entityId ?? 'item';

  if (action == 'LOGIN') return 'Logged in';
  if (action == 'LOGOUT') return 'Logged out';
  if (action.contains('CREATE')) return 'Created new $entity: "$name"';
  if (action.contains('DELETE')) return 'Deleted $entity "$name"';
  if (action.contains('UPDATE')) {
    final oldStage = d['oldStage'] ?? d['oldStatus'];
    final newStage = d['newStage'] ?? d['newStatus'];
    if (oldStage != null && newStage != null) return 'Moved $entity "$name" from $oldStage to $newStage';
    return 'Updated $entity "$name"';
  }
  return '${_readableAction(log.action)} — "$name"';
}

String _readableAction(String action) {
  if (action.isEmpty) return '-';
  return action.split('_').map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}').join(' ');
}

/// Mobile equivalent of Dad-frontend's `/reports/audit-logs` page.
/// Admin/manager-only — the backend 403s for any other role (see
/// `AuditLogsRepository.getAuditLogs`'s doc comment); the Reports hub only
/// shows this tile to those roles in the first place (see
/// `reports_screen.dart`'s `_managerRoles` gate), so no separate in-screen
/// role check duplicates that here.
class AuditLogsScreen extends ConsumerStatefulWidget {
  const AuditLogsScreen({super.key});

  @override
  ConsumerState<AuditLogsScreen> createState() => _AuditLogsScreenState();
}

class _AuditLogsScreenState extends ConsumerState<AuditLogsScreen> {
  String? _entity;
  String? _action;

  @override
  Widget build(BuildContext context) {
    final logsAsync = ref.watch(auditLogsReportProvider(entity: _entity, action: _action));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Audit Logs')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(auditLogsReportProvider(entity: _entity, action: _action).future),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FilterDropdown(
                    label: 'All Entities',
                    value: _entity,
                    options: _entities,
                    onChanged: (v) => setState(() => _entity = v),
                  ),
                  const SizedBox(width: 8),
                  _FilterDropdown(
                    label: 'All Actions',
                    value: _action,
                    options: _actions,
                    onChanged: (v) => setState(() => _action = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            logsAsync.when(
              data: (report) {
                if (report.logs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: EmptyStateView(message: 'No audit logs found.', icon: Icons.fact_check_outlined),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: _SummaryTile(label: 'Created', value: report.summary.creates)),
                        const SizedBox(width: 8),
                        Expanded(child: _SummaryTile(label: 'Updated', value: report.summary.updates)),
                        const SizedBox(width: 8),
                        Expanded(child: _SummaryTile(label: 'Deleted', value: report.summary.deletes)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Recent Activity', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    for (final log in report.logs)
                      Padding(padding: const EdgeInsets.only(bottom: 8), child: _LogRow(log: log)),
                  ],
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => ErrorStateView(
                error: error,
                onRetry: () => ref.invalidate(auditLogsReportProvider(entity: _entity, action: _action)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  const _FilterDropdown({required this.label, required this.value, required this.options, required this.onChanged});

  final String label;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: value,
          hint: Text(label),
          items: [
            DropdownMenuItem(value: null, child: Text(label)),
            for (final o in options) DropdownMenuItem(value: o, child: Text(o)),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Text('$value', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          Text(label, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _LogRow extends StatelessWidget {
  const _LogRow({required this.log});

  final AuditLogEntry log;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  log.actorName?.isNotEmpty == true ? log.actorName! : 'System',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                _dateTimeFormat.format(log.createdAt),
                style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(_describe(log), style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
