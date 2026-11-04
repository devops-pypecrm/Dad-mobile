/// True only for the Google Play build (`--dart-define=PLAY_STORE=true`, paired with the
/// `PLAY_STORE=true` environment variable that Gradle reads). Play forbids an app from
/// downloading and installing its own APK, so the in-app updater is switched off there;
/// updates come through Google Play. The live (sideloaded) build leaves this false and is
/// otherwise identical.
const bool kPlayStore = bool.fromEnvironment('PLAY_STORE');
