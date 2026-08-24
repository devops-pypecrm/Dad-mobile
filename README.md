# dad_mobile — PypeCRM Mobile

Flutter/Riverpod client for PypeCRM, talking to the existing `Dad-backend`
Express API (no backend changes required). See `app-pre/mobile/` and
`.claude/` for architecture, skills, and templates this project follows.

## Phase 1 status (Core Foundation)

Done:
- Project scaffolded with Dev/Prod entrypoints (`lib/main_dev.dart`, `lib/main_prod.dart`).
- Dio networking layer (`lib/core/network/`) with JWT-injection and 401 → forced-logout interceptors.
- Riverpod session state (`lib/features/auth/providers/session_provider.dart`), code-generated with `@riverpod`.
- Login screen wired to the real `POST /api/auth/login`, JWT persisted via `flutter_secure_storage`.
- `go_router` with an auth guard (`lib/core/router/app_router.dart`): unauthenticated → `/login`, authenticated → `/home`.

Not done yet (Phase 2/3 per `app-pre/mobile/MOBILE_DEVELOPMENT_CHECKLIST.MD`):
Dashboard, Leads, Follow-ups, Opportunities, Check-ins, FCM push notifications,
offline queueing, and native Android/iOS build-flavor wiring (Dev/Prod are
currently separate entrypoints, not `productFlavors`/Xcode schemes).

## Running

```bash
# against local Dad-backend (defaults to http://localhost:5001/api,
# or http://10.0.2.2:5001/api automatically on the Android emulator)
flutter run -t lib/main_dev.dart

# against production (https://pypecrm.com/api)
flutter run -t lib/main_prod.dart
```

Start `Dad-backend` first (`npm run dev` inside `Dad-backend/`, default port 5001)
so the Dev flavor has something to talk to.

## Code generation

Any change to a `@freezed` model or `@riverpod` provider requires
regenerating code:

```bash
dart run build_runner build -d
```

## Multi-tenancy

The backend JWT only encodes `{ id }` — `organisationId`/`role` are never
decoded client-side. They come from the `POST /api/auth/login` /
`GET /api/auth/me` response body and are persisted alongside the token
(`UserSession.organisation`), mirroring how `Dad-frontend/src/services/api.ts`
handles it. Normal authenticated requests do **not** need to send
`organisationId` explicitly — the backend derives it server-side from the
JWT via `req.user`.
