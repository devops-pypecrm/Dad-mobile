# Building Pype CRM (Dad-mobile)

One codebase, two build modes. The mode is one flag: `PLAY_STORE=true` (an environment variable that Gradle reads, plus `--dart-define=PLAY_STORE=true` for the app code).

| | Live (sideload) build | Google Play build |
|---|---|---|
| Application id | `com.pypecrm.dad_mobile` | `com.pypecrm.crm` (constant `PLAY_APPLICATION_ID` in `android/app/build.gradle.kts`) |
| Signing | existing setup (unchanged) | new upload key from `android/key.properties` (`play.*` entries, git-ignored; template: `android/key.properties.example`) |
| In-app updater | present | removed (code gated by `kPlayStore`; `REQUEST_INSTALL_PACKAGES` and the APK FileProvider removed by `android/app/src/play/AndroidManifest.xml`) |
| Version | `pubspec.yaml` | passed on the command line |
| Firebase config | `android/app/google-services.json` | `android/app/google-services-play.json` if present, else derived from the live file with the package name swapped (register the Play package in Firebase and add the real file for reliable push) |

Local helper scripts (git-ignored, in `local_builds/`):

- `local_builds/build_live.sh` – the live APK, exactly as before (publish with `.claude/COMMON_TASKS.md` §4).
- `local_builds/build_play.sh <build-number> [version-name=1.0.0]` – the Play bundle into `~/Desktop/PypeCRM-play/` with symbols; prints the package, version and signer for checking.

Never commit `android/key.properties` or any `.jks`.
