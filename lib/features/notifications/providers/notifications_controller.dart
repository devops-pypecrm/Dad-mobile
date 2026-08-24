import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/notifications_repository.dart';
import '../domain/notifications_page.dart';

part 'notifications_controller.g.dart';

/// Drives both the AppBar bell badge (via `.unreadCount`) and the full
/// `/notifications` screen. Polls every 30s while alive — same interval as
/// Dad-frontend's `refetchInterval: 30000` on both `NotificationPopover`
/// and the `/notifications` page (`useQuery`), since that polling is that
/// app's actual freshness mechanism (its Socket.io listener only triggers
/// the same refetch a beat earlier, plus a toast — see
/// NotificationPopover.tsx). `keepAlive` so the badge stays live across
/// screens without every screen needing to re-subscribe.
///
/// [PushNotificationsController]'s foreground FCM handler also calls
/// [refresh] directly, giving near-instant badge updates when a push
/// arrives while the app is open — without needing a separate Socket.io
/// client dependency just to replicate what FCM already tells us.
@Riverpod(keepAlive: true)
class NotificationsController extends _$NotificationsController {
  Timer? _pollTimer;
  String? _typeFilter;
  bool? _isReadFilter;

  @override
  Future<NotificationsPage> build() async {
    ref.onDispose(() => _pollTimer?.cancel());
    _pollTimer = Timer.periodic(const Duration(seconds: 30), (_) => refresh());
    return ref.read(notificationsRepositoryProvider).getNotifications(
          type: _typeFilter,
          isRead: _isReadFilter,
        );
  }

  /// Re-fetches the current page/filter silently (no loading flicker) —
  /// used by the 30s poll and the FCM foreground hook.
  Future<void> refresh() async {
    final repository = ref.read(notificationsRepositoryProvider);
    final current = state.valueOrNull;
    try {
      final page = await repository.getNotifications(
        page: current?.currentPage ?? 1,
        type: _typeFilter,
        isRead: _isReadFilter,
      );
      state = AsyncData(page);
    } catch (_) {
      // Best-effort background refresh — a transient failure shouldn't
      // wipe out already-loaded notifications or surface an error banner.
    }
  }

  /// Applies a type/read filter and reloads page 1 — mirrors the web
  /// `/notifications` page's tab + type dropdown resetting pagination.
  Future<void> applyFilter({String? type, bool? isRead}) async {
    _typeFilter = type;
    _isReadFilter = isRead;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(notificationsRepositoryProvider).getNotifications(type: _typeFilter, isRead: _isReadFilter),
    );
  }

  Future<void> loadPage(int page) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(notificationsRepositoryProvider).getNotifications(
            page: page,
            type: _typeFilter,
            isRead: _isReadFilter,
          ),
    );
  }

  /// Optimistically marks one row read locally, then persists — matches
  /// the web app's click-to-mark-read behavior (no navigation).
  Future<void> markAsRead(String id) async {
    final current = state.valueOrNull;
    if (current == null) return;
    var alreadyRead = true;
    for (final n in current.notifications) {
      if (n.id == id) {
        alreadyRead = n.isRead;
        break;
      }
    }
    if (alreadyRead) return;

    state = AsyncData(
      current.copyWith(
        notifications: [
          for (final n in current.notifications)
            if (n.id == id) n.copyWith(isRead: true) else n,
        ],
        unreadCount: current.unreadCount > 0 ? current.unreadCount - 1 : 0,
      ),
    );

    try {
      await ref.read(notificationsRepositoryProvider).markAsRead(id);
    } catch (_) {
      // Leave the optimistic update in place — the next 30s poll will
      // reconcile with the server if this silently failed.
    }
  }

  Future<void> markAllAsRead() async {
    final current = state.valueOrNull;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        notifications: [for (final n in current.notifications) n.copyWith(isRead: true)],
        unreadCount: 0,
      ),
    );

    try {
      await ref.read(notificationsRepositoryProvider).markAllAsRead();
    } catch (_) {
      // Same rationale as markAsRead — reconciled by the next poll.
    }
  }
}
