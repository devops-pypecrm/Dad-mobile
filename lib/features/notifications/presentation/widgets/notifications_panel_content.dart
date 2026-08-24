import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../domain/app_notification.dart';
import '../../providers/notifications_controller.dart';

/// The actual notifications UI (filter row, list, pagination) — no
/// `Scaffold`/`AppBar` of its own, so it can be hosted either inside
/// [NotificationsScreen]'s full-page Scaffold or inside the sliding
/// [NotificationPanel] under [GlobalAppBar] without duplicating this logic.
/// Same shape as Dad-frontend's `/notifications` page
/// (Dad-frontend/src/pages/notifications/index.tsx): All/Unread tabs, a
/// type filter, per-type icon/color, tap-to-mark-read, "Mark all read",
/// and pagination — backed by the identical `GET /api/notifications`
/// endpoint and query params.
class NotificationsPanelContent extends ConsumerStatefulWidget {
  const NotificationsPanelContent({super.key});

  @override
  ConsumerState<NotificationsPanelContent> createState() => _NotificationsPanelContentState();
}

class _NotificationsPanelContentState extends ConsumerState<NotificationsPanelContent> {
  bool _unreadOnly = false;
  String _typeFilter = 'all';

  // Matches the type dropdown in Dad-frontend's /notifications page — note
  // it deliberately excludes 'reminder'/'popup' even though the backend
  // produces them (same omission as web), since there's no dedicated
  // filter option for them there either.
  static const _typeOptions = ['all', 'info', 'success', 'warning', 'error'];

  void _applyFilter() {
    ref.read(notificationsControllerProvider.notifier).applyFilter(
          type: _typeFilter,
          isRead: _unreadOnly ? false : null,
        );
  }

  @override
  Widget build(BuildContext context) {
    final pageAsync = ref.watch(notificationsControllerProvider);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: false, label: Text('All')),
                    ButtonSegment(value: true, label: Text('Unread')),
                  ],
                  selected: {_unreadOnly},
                  onSelectionChanged: (selection) {
                    setState(() => _unreadOnly = selection.first);
                    _applyFilter();
                  },
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _typeFilter,
                items: [
                  for (final type in _typeOptions)
                    DropdownMenuItem(value: type, child: Text(type == 'all' ? 'All types' : type)),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _typeFilter = value);
                  _applyFilter();
                },
              ),
            ],
          ),
        ),
        if ((pageAsync.valueOrNull?.unreadCount ?? 0) > 0)
          Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 4),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => ref.read(notificationsControllerProvider.notifier).markAllAsRead(),
                child: const Text('Mark all read'),
              ),
            ),
          ),
        Flexible(
          child: pageAsync.when(
            data: (page) {
              if (page.notifications.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: EmptyStateView(message: 'No notifications yet.', icon: Icons.notifications_none),
                );
              }
              return RefreshIndicator(
                onRefresh: () => ref.read(notificationsControllerProvider.notifier).refresh(),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: page.notifications.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) => _NotificationTile(notification: page.notifications[index]),
                ),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => ErrorStateView(
              error: error,
              onRetry: () => ref.invalidate(notificationsControllerProvider),
            ),
          ),
        ),
        if (pageAsync.valueOrNull != null && pageAsync.valueOrNull!.totalPages > 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: pageAsync.value!.currentPage > 1
                      ? () => ref.read(notificationsControllerProvider.notifier).loadPage(pageAsync.value!.currentPage - 1)
                      : null,
                ),
                Text(
                  'Page ${pageAsync.value!.currentPage} of ${pageAsync.value!.totalPages}',
                  style: theme.textTheme.bodySmall,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: pageAsync.value!.currentPage < pageAsync.value!.totalPages
                      ? () => ref.read(notificationsControllerProvider.notifier).loadPage(pageAsync.value!.currentPage + 1)
                      : null,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Icon/color per `type` — same mapping as `getIcon` in
/// Dad-frontend/src/pages/notifications/index.tsx:43-50: success→green,
/// warning→amber, error→red, everything else (info, reminder, popup)→blue.
(IconData, Color) _iconFor(String type, ColorScheme colors) {
  switch (type) {
    case 'success':
      return (Icons.check_circle, const Color(0xFF22C55E));
    case 'warning':
      return (Icons.warning_amber_rounded, const Color(0xFFF59E0B));
    case 'error':
      return (Icons.cancel, const Color(0xFFEF4444));
    default:
      return (Icons.info, const Color(0xFF3B82F6));
  }
}

class _NotificationTile extends ConsumerWidget {
  const _NotificationTile({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final (icon, color) = _iconFor(notification.type, theme.colorScheme);

    return ListTile(
      tileColor: notification.isRead ? null : theme.colorScheme.primary.withValues(alpha: 0.05),
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        notification.title,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Text(notification.message, maxLines: 3, overflow: TextOverflow.ellipsis),
      trailing: notification.isRead
          ? null
          : Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: theme.colorScheme.primary, shape: BoxShape.circle),
            ),
      onTap: notification.isRead
          ? null
          : () => ref.read(notificationsControllerProvider.notifier).markAsRead(notification.id),
    );
  }
}
