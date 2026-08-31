import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/checkins_local_queue.dart';
import '../data/checkins_repository.dart';
import '../domain/pending_checkin.dart';

part 'checkin_sync_controller.g.dart';

enum CheckInSubmitOutcome { submitted, queuedOffline }

/// Drives the check-in offline-write queue: submits immediately when
/// online, falls back to the local Hive queue when offline or the request
/// fails, and auto-retries the queue whenever connectivity comes back.
/// State is the current pending (unsynced) count, watched by the
/// dashboard/check-ins screens to show a "N pending sync" badge.
@Riverpod(keepAlive: true)
class CheckInSync extends _$CheckInSync {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;

  @override
  Future<int> build() async {
    final queue = await ref.watch(checkInsLocalQueueProvider.future);

    _connectivitySub?.cancel();
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      if (results.any((r) => r != ConnectivityResult.none)) {
        trySyncAll();
      }
    });
    ref.onDispose(() => _connectivitySub?.cancel());

    // Only a connectivity *transition* triggers a sync above, so a queue
    // left over from a previous session (app closed offline, reopened
    // already on Wi-Fi — no transition ever fires) would otherwise sit
    // stuck forever with no manual "Sync now" entry point in the current
    // nav. Flush it once at startup if we're online and there's a backlog.
    if (queue.length > 0) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.any((r) => r != ConnectivityResult.none)) {
        unawaited(trySyncAll());
      }
    }

    return queue.length;
  }

  Future<CheckInSubmitOutcome> submit(PendingCheckIn draft) async {
    final connectivity = await Connectivity().checkConnectivity();
    final isOnline = connectivity.any((r) => r != ConnectivityResult.none);

    if (isOnline) {
      try {
        await _submitRemote(draft);
        return CheckInSubmitOutcome.submitted;
      } catch (_) {
        // Network blip mid-submit, or backend unreachable despite a
        // reported connection — fall through to queueing below.
      }
    }

    final queue = await ref.read(checkInsLocalQueueProvider.future);
    await queue.enqueue(draft);
    state = AsyncValue.data(queue.length);
    return CheckInSubmitOutcome.queuedOffline;
  }

  Future<void> _submitRemote(PendingCheckIn draft) async {
    final repository = ref.read(checkInsRepositoryProvider);
    var toSubmit = draft;

    if (toSubmit.photoUrl == null && toSubmit.localPhotoPath != null) {
      final photoFile = File(toSubmit.localPhotoPath!);
      if (await photoFile.exists()) {
        final photoUrl = await repository.uploadPhoto(photoFile);
        toSubmit = toSubmit.copyWith(photoUrl: photoUrl);
      } else {
        // The OS reclaimed the temp file (image_picker/flutter_image_compress
        // output) before this could sync. Without this, the item would
        // retry forever with no way to ever succeed — better to submit the
        // check-in itself (the GPS/notes/timestamp are still valid) than
        // lose the whole record over a missing photo.
        toSubmit = toSubmit.copyWith(localPhotoPath: null);
      }
    }

    await repository.createCheckIn(toSubmit);
  }

  /// Retries every queued check-in. Failures are left in the queue (with an
  /// incremented attempt count) for the next connectivity change or manual
  /// retry rather than being dropped.
  Future<void> trySyncAll() async {
    final queue = await ref.read(checkInsLocalQueueProvider.future);
    for (final draft in queue.getAll()) {
      try {
        await _submitRemote(draft);
        await queue.remove(draft.localId);
      } catch (_) {
        await queue.update(draft.copyWith(attempts: draft.attempts + 1));
      }
    }
    state = AsyncValue.data(queue.length);
  }
}
