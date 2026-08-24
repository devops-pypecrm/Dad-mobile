enum Flavor { dev, prod }

/// App-wide configuration resolved once at startup by the flavor-specific
/// entrypoint (`main_dev.dart` / `main_prod.dart`) via [AppConfig.init].
class AppConfig {
  AppConfig._({required this.flavor, required this.apiBaseUrl});

  final Flavor flavor;
  final String apiBaseUrl;

  static AppConfig? _instance;

  static AppConfig get instance {
    assert(_instance != null, 'AppConfig.init() must be called before use');
    return _instance!;
  }

  static void init(Flavor flavor) {
    _instance = AppConfig._(flavor: flavor, apiBaseUrl: _resolveBaseUrl(flavor));
  }

  static String _resolveBaseUrl(Flavor flavor) {
    switch (flavor) {
      case Flavor.prod:
        // Matches Dad-backend production origin (envs/backend/.env.production).
        return 'https://pypecrm.com/api';
      case Flavor.dev:
        // Matches Dad-backend dev server (PORT=5001 in Dad-backend/.env.example).
        // Android (emulator or physical device over USB) reaches the host via
        // `adb reverse tcp:5001 tcp:5001`, which tunnels the device's own
        // localhost:5001 to the host machine. Run that before `flutter run`.
        return 'http://localhost:5001/api';
    }
  }

  bool get isProd => flavor == Flavor.prod;

  /// Origin (scheme+host+port) with no `/api` suffix — needed because some
  /// backend responses (e.g. `POST /api/upload/image`'s `url` field) already
  /// include their own `/api/...` prefix, so they must be resolved against
  /// the bare origin, not [apiBaseUrl], to avoid a doubled `/api/api/...`.
  String get apiOrigin => apiBaseUrl.endsWith('/api')
      ? apiBaseUrl.substring(0, apiBaseUrl.length - '/api'.length)
      : apiBaseUrl;
}
