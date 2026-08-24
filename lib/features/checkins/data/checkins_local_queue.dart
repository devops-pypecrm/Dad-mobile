import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pending_checkin.dart';

part 'checkins_local_queue.g.dart';

const kPendingCheckInsBoxName = 'pending_checkins';

/// Opened once, app-wide (`Hive.initFlutter()` runs in `main_dev.dart`/
/// `main_prod.dart` before `runApp`). Stored as JSON strings rather than a
/// typed Hive adapter to avoid a second codegen step on top of Freezed.
@Riverpod(keepAlive: true)
Future<CheckInsLocalQueue> checkInsLocalQueue(FutureProviderRef<CheckInsLocalQueue> ref) async {
  final box = await Hive.openBox<String>(kPendingCheckInsBoxName);
  return CheckInsLocalQueue(box);
}

/// The offline write queue — the one place Phase 1's "offline read-only"
/// default is intentionally extended to offline writes, per
/// .claude/QUICK_CONTEXT.md section 5 ("High-stakes actions ... should be
/// queued locally if offline and synced when online").
class CheckInsLocalQueue {
  CheckInsLocalQueue(this._box);

  final Box<String> _box;

  Future<void> enqueue(PendingCheckIn draft) => _box.put(draft.localId, jsonEncode(draft.toJson()));

  Future<void> update(PendingCheckIn draft) => _box.put(draft.localId, jsonEncode(draft.toJson()));

  Future<void> remove(String localId) => _box.delete(localId);

  List<PendingCheckIn> getAll() {
    return _box.values
        .map((raw) => PendingCheckIn.fromJson(jsonDecode(raw) as Map<String, dynamic>))
        .toList();
  }

  int get length => _box.length;
}
