# Kickoff prompt — paste this as the first message in a fresh session

I need you to implement call recording for our CRM, built as a **separate helper Android app** (not inside our main Play Store app), plus the supporting changes in our main CRM app (`Dad-mobile`).

**First step: read `Dad-mobile/CALL_RECORDING_PLAN.md` in full.** That file has the complete architecture, the reasoning behind every decision, the exact backend contract, the phased delivery plan, and known risks. Everything below is a condensed pointer to that document plus the specific things to keep front-of-mind — don't treat this message as a replacement for reading that file.

## Why this is split into two apps

Our main CRM app (`Dad-mobile`) is distributed through the Play Store. Google Play's policy restricts/bans the permissions real call recording needs (`RECORD_AUDIO` combined with call-state access, and especially Accessibility Service used to facilitate call recording). So the actual recording engine has to live in a **second, separate Android app** — a "helper" app we distribute ourselves via direct APK download from our own website, sideloaded by the user, never through Play. `Dad-mobile` must never carry any of these permissions.

## Critical thing to keep in mind the whole time: our existing implementation does not actually work

We already have ONE real, working-on-paper implementation of exactly this call-recording pipeline: `Dad-frontend/android/app/src/main/java/com/pypecrm/app/` (the old webview-wrapper app). It has a full 4-tier native recording pipeline — read it, it's genuinely useful as a reference for API usage and the general approach. **But it is not reliably working on current Android versions in real-world use.** Do not treat that code as proven-correct and just port it verbatim expecting it to work. Treat it as a blueprint for the *approach* (which Android APIs to reach for, in what order), and plan to actually debug/harden/re-validate each recording tier against current devices and current Android versions as you build. The whole point of Phase 1 in the plan is proving that at least one tier can reliably capture real audio on a current device — don't skip past that validation step assuming it'll just work because the old code exists.

Concretely this means: when you port `AudioRecorderService.kt`'s `MediaRecorder` approach, `CallRecordingAccessibilityService.kt`'s accessibility-unlock trick, `NativeRecordingScanner.kt`'s OEM-file detection, or the MediaProjection fallback — go in expecting some or all of them to need real fixes for current Android (14/15) behavior, not just a copy-paste-and-rename job. Instrument everything (log which tier succeeded/failed and why) so failures are diagnosable, not silent.

## What to build — in order

Follow the plan file's phased delivery exactly. Do not jump ahead to later phases before the current one is validated on real devices:

1. **Phase 1** (start here): new Flutter project `Dad-call-recorder/` (sibling to `Dad-mobile`/`Dad-frontend`, own `applicationId`, e.g. `com.pypecrm.recorder`) with a Dart UI shell (login, status screen, onboarding) and a native Android plugin package for the actual recording engine (BroadcastReceiver + foreground Service, independent of the Flutter engine's lifecycle). Implement ONLY Tier 0 (OEM native-recording-file detection) and Tier 4 (metadata-only sync, always works) at this stage — deliberately no `RECORD_AUDIO`/Accessibility permissions yet. Standalone login against our existing `POST /api/auth/login`. Get this actually working and validated on ≥2 real devices (one OEM with a native call recorder like Samsung/Xiaomi, one without, e.g. stock Android/Pixel) before moving on.
2. **Phase 2**: add Tier 1 (`MediaRecorder` + forced speakerphone). Validate specifically on devices with no Tier 0 coverage.
3. **Phase 3**: add Tier 2 (Accessibility-Service-unlocked `VOICE_RECOGNITION` source) — this permission must exist ONLY in this helper app, never in `Dad-mobile`.
4. **Phase 4**: add Tier 3 (MediaProjection system-audio capture) — lowest priority, most user-facing friction.
5. **Phase 5**: changes in `Dad-mobile` (our main app) — a new, deliberately low-key settings entry explaining call recording needs the companion app, linking out to our website's download page for the helper APK (use the already-present `url_launcher` package). Also worth doing in this phase: extend `Dad-mobile/lib/features/calls/` with actual playback UI for `recordingUrl` (the model already has this field, nothing renders it today).

## The backend contract (already live, no backend changes needed for phases 1-4)

Re-verify these by reading the actual code before building against them (`Dad-backend/src/routes/androidRoutes.ts`, `Dad-backend/src/controllers/androidController.ts`, mounted at `/api/android` in `Dad-backend/src/index.ts`):

- `POST /api/android/recordings` — multipart. File field name `audio` (falls back to `file`). Body fields: `leadId, duration` (seconds), `callType, timestamp, phoneNumber, hardwareId, callSessionId, hardwareDuration`. Send `hardwareId` **un-namespaced** — the server prefixes it with `${userId}_` itself; don't pre-namespace it or the server's "already namespaced" check misfires.
- `POST /api/android/bulk-sync` — call-log-only batch (no audio), body `{ calls: [...] }`. **Hard rate-limited server-side to 1 request per user per 10 minutes** — batch everything since last sync into one call, don't loop.
- `GET /api/android/leads?lastSync=<epoch ms>` — delta lead/contact list, used for phone-number matching.
- Server-side dedup priority: `callSessionId` → `hardwareId` → fuzzy phone+time match. Both are DB-unique per org on the `Interaction` model.
- All routes sit behind the normal `protect` JWT middleware — the helper app authenticates as a completely normal logged-in user, same login endpoint `Dad-mobile/lib/features/auth/data/auth_repository.dart` already calls.
- Do **not** confuse this with `/api/calls/*` — that's a separate, unrelated desktop click-to-call/WebRTC flow with a different upload field name and storage directory.

## Auth in the helper app

Simple, independent login screen in the helper app calling the same `POST /api/auth/login` — no token-sharing with `Dad-mobile`, no deep-link handoff. (We considered a slicker one-time-code deep-link handoff from the main app but explicitly deferred it — not in scope now.) Store the token with `flutter_secure_storage`, same package `Dad-mobile` already uses.

## Things to not lose sight of

- `RECORD_AUDIO`, telephony broadcast permissions, and `BIND_ACCESSIBILITY_SERVICE` must **never** appear in `Dad-mobile/android/app/src/main/AndroidManifest.xml`. If you ever find yourself adding one of these there, stop — that permission belongs in the helper app only.
- Keep whatever UI/copy you add in `Dad-mobile` about call recording low-key and factual (a plain settings-page entry) — not a promoted feature, banner, or onboarding highlight. Google Play has suspended apps for prominently promoting call recording done elsewhere.
- Two-party-consent legal requirements for recording calls exist in many jurisdictions — `CallSettings.autoRecordInbound`/`autoRecordOutbound` (org-level toggle already in the schema) should default `false` for new orgs. This is a legal/business call for the org admin, not something to default to "on" unilaterally.
- Aggressive OEMs (Xiaomi/MIUI, Oppo/ColorOS) kill background services unless the user manually whitelists the app — plan explicit onboarding UI for `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` plus manufacturer-specific instructions (detect via `Build.MANUFACTURER`), or recording will silently stop working on exactly the devices where it matters most.

## Reference files to read before writing code

- `Dad-mobile/CALL_RECORDING_PLAN.md` — full plan, read this first.
- `Dad-frontend/android/app/src/main/java/com/pypecrm/app/services/` (`CallStateReceiver.kt`, `CallTrackerService.kt`, `AudioRecorderService.kt`, `CallRecordingAccessibilityService.kt`, `UnifiedSyncWorker.kt`) and `utils/NativeRecordingScanner.kt` — the existing (unreliable, needs hardening) reference implementation.
- `Dad-frontend/android/app/src/main/AndroidManifest.xml` — exact permission set the helper app needs.
- `Dad-backend/src/routes/androidRoutes.ts` + `Dad-backend/src/controllers/androidController.ts` — the backend contract.
- `Dad-mobile/lib/features/auth/data/auth_repository.dart` — the login contract to reuse.
- `Dad-mobile/lib/features/calls/` — where Phase 5's playback UI and settings entry land in the main app.
