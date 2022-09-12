import 'package:aink/src/common/initialization/initialization.dart';
import 'package:aink/src/common/widget/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() => Future<void>(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      await initializeApp();
      group('end-to-end test', () {
        testWidgets('app', (tester) async {
          await tester.pumpWidget(const App());
          await tester.pumpAndSettle(const Duration(seconds: 5));
          expect(find.byType(App), findsOneWidget);
        });
      });
    });
