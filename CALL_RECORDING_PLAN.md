# Call Recording via a Sideloaded Helper App

## Context

The CRM's mobile call-recording feature needs native Android capabilities (mic capture during a call, telephony broadcasts, and in some fallback tiers an Accessibility Service) that Google Play's policy explicitly restricts or bans for apps distributed through the Play Store. `Dad-mobile` (the main CRM app) is Play Store-bound and must stay clean of these permissions to avoid rejection/suspension. The fix is architectural: split call recording into a second, separate Android app — a "helper" app distributed by direct download from the company's own website, sideloaded by the user — so the risky permission surface never lands in the Play-listed APK at all.

There's already a proven reference for *how* to record calls on Android sitting in this same monorepo: `Dad-frontend/android/` (the old webview-wrapper app) implements a real 4-tier native recording pipeline. However, the user has flagged that this existing implementation **is not reliably working on current Android versions** — so this plan treats that code as a conceptual blueprint and a source of native building blocks to adapt, not as proven-working code to copy verbatim. Getting even one tier reliably capturing audio on current devices is the actual Phase 1 goal, not a formality.

Decisions already made with the user:
- **Helper app stack: a new Flutter app** (not pure-native Kotlin) — for consistency with `Dad-mobile`'s stack. The actual recording engine (BroadcastReceiver + foreground Service + all recording tiers) still has to be native Kotlin underneath, wrapped in a Flutter plugin/platform channel — Flutter itself has no API surface for any of this, so architecturally the native engine is nearly identical to what a pure-native app would have; only the surrounding UI/login/settings layer is Dart.
- **Auth: independent login in the helper app** (own login screen calling the existing `POST /api/auth/login`) — no new backend work, no deep-link plumbing, ships fastest. A slicker one-time-code deep-link handoff is an explicit later enhancement, not part of this plan.

## Two-App Architecture

| Concern | `Dad-mobile` (Play Store) | New helper app (sideloaded Flutter) |
|---|---|---|
| Full CRM (leads, deals, dashboard, etc.) | Yes, unchanged | No |
| Call browsing/playback | Yes — extend `lib/features/calls/` with a player for `recordingUrl` (currently modeled but never rendered) | No UI beyond login/status/settings |
| `RECORD_AUDIO`, telephony, Accessibility Service permissions | **Never** | Yes — all of it |
| Native recording engine | None | Native Android plugin (Kotlin) doing all 4 tiers |
| Uploads to `/api/android/recordings`, `/api/android/bulk-sync` | No | Yes |
| "Call Recording" settings entry, install-prompt link-out | Yes (low-key, factual — see Risks) | N/A |

**Why the split works for Play policy**: Play's restricted-permissions review targets what's *declared in the manifest* of the listed app, not which class does the work. Keeping every recording-related permission (`RECORD_AUDIO` + call-state combo, `BIND_ACCESSIBILITY_SERVICE`, `READ_CALL_LOG`, `PROCESS_OUTGOING_CALLS`, the various `FOREGROUND_SERVICE_*` subtypes) entirely out of `Dad-mobile/android/app/src/main/AndroidManifest.xml` (today it only has location/camera/internet/notifications) is what makes this effective, not just organizationally tidy.

## New Helper App Structure

Create as a new top-level sibling directory, e.g. `Dad-call-recorder/` — its own Flutter project, own `applicationId` (e.g. `com.pypecrm.recorder`), own repo/CI, **not** nested inside `Dad-mobile` or `Dad-frontend`.

- **Dart layer**: login screen (`POST /api/auth/login`, same contract as `Dad-mobile/lib/features/auth/data/auth_repository.dart`), a status screen (recording enabled/disabled, last-synced-call timestamp, per-tier success stats), a permissions/onboarding wizard (walks the user through granting `RECORD_AUDIO`/phone-state, enabling the Accessibility Service when that tier is active, and requesting battery-optimization exemption), token storage via `flutter_secure_storage` (same package `Dad-mobile` already uses).
- **Native Android plugin** (a local Flutter plugin package, e.g. `packages/call_recording_engine/android/`): owns the `BroadcastReceiver` on `ACTION_PHONE_STATE_CHANGED`/`NEW_OUTGOING_CALL`, a foreground Service that runs the tier fallback chain, the Room DB offline queue, and a WorkManager job for retrying uploads — all independent of the Flutter engine's own lifecycle (Flutter gets suspended/killed far more aggressively than a foreground Service; the engine must not depend on the Dart isolate staying alive to catch an incoming call). Dart only talks to this plugin to start/stop monitoring, read status, and drive the onboarding UI — the call-time logic runs natively regardless of whether the Flutter UI is even open.
- Adapt (don't blindly port) the native building blocks from `Dad-frontend/android/app/src/main/java/com/pypecrm/app/services/` and `utils/NativeRecordingScanner.kt` into this plugin's Kotlin source, re-validating each on current Android versions/OEMs as part of Phase 1 rather than assuming they still work as originally written.

## Recording Strategy — Fallback Chain (per call, on call-end)

Run in order, stop at first tier that produces a real (non-silent) recording:

1. **Tier 0 — OEM native call-recorder file detection.** Poll `MediaStore.Audio.Media` (adapt `NativeRecordingScanner.kt`) for a file matching the OEM's naming convention + phone-number suffix + a time window after call end (poll every ~2s for ~15-20s, since some OEMs finalize the file with a short delay). Falls back if nothing found in that window. Best quality, least permission risk, but coverage varies a lot and several OEMs (Samsung in many regions) have removed this entirely.
2. **Tier 1 — `MediaRecorder` (`VOICE_COMMUNICATION` source) + forced speakerphone.** Falls back if `start()` throws, or the output file is empty/below a sane bytes-per-second-of-claimed-duration threshold (a "successful" call that still produced silence). This is the tier most exposed to the reliability problem already flagged — validate this thoroughly on current devices before trusting it as a real Tier 1, don't assume the old code's approach still works unmodified.
3. **Tier 2 — Accessibility-Service-unlocked `VOICE_RECOGNITION` source.** Same silent/failed-file fallback trigger as Tier 1. This is the tier Google Play explicitly polices against — it must never exist in `Dad-mobile`, only here, and even here treat it as "sometimes helps," not dependable.
4. **Tier 3 — MediaProjection / `AudioPlaybackCaptureConfiguration` system-audio capture.** Falls back if the user denies the permission prompt, the API throws (API 29+ only), or output is empty. Most invasive (a visible "screen capture" style permission dialog every cold start), lowest priority to build.
5. **Tier 4 — Metadata-only, no audio, always succeeds.** If Tiers 0-3 all fail (or the org's `CallSettings.autoRecordOutbound`/`autoRecordInbound` has recording off for that direction, in which case skip straight here rather than record-then-discard), sync just the call metadata via `POST /api/android/bulk-sync` so an `Interaction` row still exists.

Use the same offline-queue pattern as the old wrapper (`SyncQueueEntry`/`CallBufferEntity`-equivalent Room tables + a WorkManager retry job) so a call recorded/logged while offline or mid-app-kill still uploads later.

## Backend Contract (already exists, confirmed live — no changes needed for Phase 1-4)

- `POST /api/android/recordings` — multipart, file field `audio` (or `file` fallback), body: `leadId, duration (seconds), callType, timestamp, phoneNumber, hardwareId, callSessionId, hardwareDuration`. **Send `hardwareId` un-namespaced** — the server prefixes it with `${userId}_` itself.
- `POST /api/android/bulk-sync` — call-log-only batch sync, **hard rate-limited server-side to 1 request per user per 10 minutes** — batch everything since last sync into one array, don't loop small calls.
- `GET /api/android/leads?lastSync=<epoch ms>` — delta lead/contact list for phone-number matching.
- Dedup priority server-side: `callSessionId` → `hardwareId` → fuzzy phone+time match. Mounted at `/api/android` in `Dad-backend/src/index.ts:400`, all behind the standard `protect` JWT middleware — the helper app authenticates as a normal user, nothing special.
- Do not confuse with `/api/calls/*` — that's the unrelated desktop click-to-call/WebRTC flow (different upload field name, different storage dir).

## Phased Delivery

Ship the least-risky tier first, validate on real devices, only add riskier tiers once the pipeline (auth → detect call → upload/sync → shows up correctly in the CRM) is proven end-to-end.

1. **Phase 1** — Helper app skeleton (Flutter shell + native plugin scaffold), standalone login, Tier 0 + Tier 4 only (permissions: `READ_CALL_LOG`, `READ_MEDIA_AUDIO`/storage, `READ_PHONE_STATE`, `INTERNET` — deliberately no `RECORD_AUDIO`/Accessibility yet). **This phase's real goal is validating on real current-Android devices that the pipeline works at all**, given the known reliability concern — test on an OEM with native call recording (Samsung/Xiaomi) and one without (stock/Pixel), confirm correct dedup in the CRM.
2. **Phase 2** — Add Tier 1 (`MediaRecorder` + speakerphone). Add `RECORD_AUDIO`, `MODIFY_AUDIO_SETTINGS`, `FOREGROUND_SERVICE_MICROPHONE`. Validate specifically on devices with no Tier 0 coverage; confirm the silent-file detection correctly triggers fallback instead of uploading empty audio.
3. **Phase 3** — Add Tier 2 (Accessibility-unlocked `VOICE_RECOGNITION`). Measure real incremental coverage gain over Tier 1 before committing to carrying this permission long-term.
4. **Phase 4** — Add Tier 3 (MediaProjection). Lowest priority — API 29+ only, most permission friction, last resort anyway.
5. **Phase 5** — `Dad-mobile` side: new low-key settings entry (e.g. `lib/features/settings/.../call_recording_screen.dart`) explaining recording needs the companion app, linking out (via the already-present `url_launcher` package) to a company-hosted download page. That download page (static HTML + hosted APK) is a deliverable outside both codebases — track it explicitly, don't assume marketing/web team builds it unprompted.

Each phase is independently shippable — Phase 1 alone already produces correctly-deduplicated call log entries in the CRM, audio or not.

## Risks to Keep Visible (not purely engineering calls)

- **Play policy risk to the main app even indirectly** — Play has suspended apps for *promoting* call recording done elsewhere. Keep `Dad-mobile`'s settings entry low-key and factual, never a home-screen banner or onboarding highlight.
- **Legal/consent** — two-party-consent jurisdictions require all-party consent to record calls. `CallSettings.autoRecordInbound`/`autoRecordOutbound` should default `false` for new orgs; whether a spoken/SMS recording disclosure is needed is a legal decision for the user/org-admins, not something to default silently.
- **Reliability will vary and can degrade over time** — the user's own report that current recording "seems not working" is the leading indicator here; Android has tightened in-call mic access since API 29 with no sign of reversing. Instrument which tier succeeds per call (device model + OS version) so coverage is measured, not assumed.
- **Aggressive OEM battery management** (Xiaomi/MIUI, Oppo/ColorOS, etc.) kills background services unless the user manually whitelists the app — pair `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` with OEM-aware onboarding instructions (detect `Build.MANUFACTURER`, show manufacturer-specific steps), or recording will silently stop on exactly the devices where it's most needed.

## Critical Files

- `Dad-backend/src/routes/androidRoutes.ts`, `Dad-backend/src/controllers/androidController.ts` — the upload/bulk-sync/dedup contract the helper app targets, confirmed live at `/api/android` (`Dad-backend/src/index.ts:400`).
- `Dad-frontend/android/app/src/main/java/com/pypecrm/app/services/` (`CallStateReceiver.kt`, `CallTrackerService.kt`, `AudioRecorderService.kt`, `CallRecordingAccessibilityService.kt`, `UnifiedSyncWorker.kt`) and `utils/NativeRecordingScanner.kt` — native building blocks to adapt (re-validate, don't copy blindly) into the new helper app's plugin.
- `Dad-frontend/android/app/src/main/AndroidManifest.xml` — reference for the exact risky-permission set; confirms what must never appear in `Dad-mobile`'s manifest.
- `Dad-mobile/lib/features/auth/data/auth_repository.dart`, `Dad-backend/src/routes/authRoutes.ts` — the login contract the helper app's standalone auth reuses as-is.
- `Dad-mobile/lib/features/calls/` — where the recording-playback UI and the new settings/install-prompt entry point land in the main app (Phase 5).

## Verification (per phase)

- **Phase 1**: install the helper app on ≥2 real devices (one OEM with native call recording, one without), place test calls, confirm: (a) Tier 0 finds the OEM file when present, (b) Tier 4 metadata-only sync fires correctly when it's not, (c) the resulting `Interaction` rows appear correctly deduped in the CRM (check via `Dad-mobile`'s existing `GET /api/calls` list / `lib/features/calls/presentation/screens/call_logs_screen.dart`), (d) offline behavior — kill network mid-call, confirm the queued entry uploads once connectivity returns.
- **Phase 2-4**: for each new tier, test on a device where prior tiers have no coverage, confirm real (non-silent) audio is captured and uploaded, confirm the silent/failed-file fallback logic correctly advances to the next tier rather than uploading junk.
- **Phase 5**: confirm the `Dad-mobile` settings screen's link opens the correct download page, and manually verify the copy/placement reads as low-key rather than promotional (a subjective check worth a second pair of eyes given the Play-policy risk noted above).
