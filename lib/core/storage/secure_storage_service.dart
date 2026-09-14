import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Thin wrapper around [FlutterSecureStorage] for the JWT + raw session
/// payload. Never store auth data in `shared_preferences` (insecure).
class SecureStorageService {
  SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  static const _tokenKey = 'auth_token';
  static const _userInfoKey = 'auth_user_info';
  static const _savedAccountsKey = 'saved_accounts';

  Future<void> saveToken(String token) => _storage.write(key: _tokenKey, value: token);

  Future<String?> readToken() => _storage.read(key: _tokenKey);

  /// Raw JSON string of the login response (id, name, role, organisation, ...).
  Future<void> saveUserInfo(String userInfoJson) =>
      _storage.write(key: _userInfoKey, value: userInfoJson);

  Future<String?> readUserInfo() => _storage.read(key: _userInfoKey);

  /// Raw JSON array of other logged-in-but-not-active accounts (each
  /// element the same shape as [saveUserInfo]'s payload, one per saved
  /// account) — see `SessionController`'s multi-account methods for the
  /// encode/decode + list-mutation logic; this class stays a dumb
  /// key/value wrapper. Deliberately untouched by [clear] — signing out of
  /// the active account must not forget the other saved logins on this
  /// device.
  Future<void> saveSavedAccountsJson(String json) =>
      _storage.write(key: _savedAccountsKey, value: json);

  Future<String?> readSavedAccountsJson() => _storage.read(key: _savedAccountsKey);

  Future<void> clear() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userInfoKey);
  }
}
