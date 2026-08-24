import 'package:dad_mobile/app.dart';
import 'package:dad_mobile/core/config/app_config.dart';
import 'package:dad_mobile/core/network/secure_storage_provider.dart';
import 'package:dad_mobile/core/storage/secure_storage_service.dart';
import 'package:dad_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

/// Never touches a platform channel — always reports "logged out".
class _FakeSecureStorageService extends SecureStorageService {
  _FakeSecureStorageService() : super(const FlutterSecureStorage());

  @override
  Future<String?> readToken() async => null;

  @override
  Future<String?> readUserInfo() async => null;
}

void main() {
  AppConfig.init(Flavor.dev);

  testWidgets('unauthenticated launch lands on the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          secureStorageServiceProvider.overrideWithValue(_FakeSecureStorageService()),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
