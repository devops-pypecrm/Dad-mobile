# Setup for a new developer

This repo won't build straight after `git clone` — two Firebase config files are deliberately **not** committed (see `.gitignore`) because they carry this org's live Firebase project identifiers. You'll receive them separately from whoever gave you access to this repo (Slack DM / secure share, not email/plaintext).

## 1. Place the two Firebase config files

| File you were given | Where it goes |
|---|---|
| `google-services.json` | `android/app/google-services.json` |
| `GoogleService-Info.plist` | `ios/Runner/GoogleService-Info.plist` |

The Android build will fail immediately without `android/app/google-services.json` — the `com.google.gms.google-services` Gradle plugin (`android/app/build.gradle.kts`) reads it directly. iOS push notifications won't initialize without the `.plist`, though the app will still build without it.

## 2. Install dependencies and generate code

```bash
flutter pub get
dart run build_runner build -d
```

That second command is **not optional** — this project uses `freezed` (models) and `riverpod_generator` (providers) codegen. The `.g.dart`/`.freezed.dart` files are committed as a convenience so the repo builds out of the box, but any time you change a `@freezed` class or a `@riverpod` provider, you need to re-run that command (or `dart run build_runner watch -d` while actively developing) or the app won't compile.

## 3. Run it

Two flavors exist — `dev` (`http://localhost:5001/api`, needs `adb reverse tcp:5001 tcp:5001` if testing on a real Android device/emulator) and `prod` (`https://pypecrm.com/api`, the real backend):

```bash
flutter run -t lib/main_dev.dart    # dev backend
flutter run -t lib/main_prod.dart   # prod backend
```

Plain `flutter run` (no `-t`) uses `lib/main.dart`, which just re-exports `main_dev.dart`.

## 4. Building a release APK

```bash
flutter build apk --release -t lib/main_prod.dart
```

Note: there's no dedicated release keystore configured yet — `android/app/build.gradle.kts` falls back to the debug signing config for release builds. Fine for sideloading/testing, not for a Play Store upload as-is.
