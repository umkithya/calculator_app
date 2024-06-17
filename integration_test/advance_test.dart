import 'package:calculator_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'test/calculator_screen.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Calculator App end-to-end test', () {
    testWidgets(
      'Sin',
      (WidgetTester tester) async {
        app.main();
        await tester.pump(const Duration(seconds: 2));
        final Finder sciButton = find.bySemanticsLabel("Sci");
        await tester.tap(sciButton);
        await tester.pump(const Duration(seconds: 1));

        final calculatorScreen = CalculatorScreen(tester);
        await calculatorScreen.doAdvanceOperator("sin", 10);
        await tester.pumpAndSettle();
        final Finder display = find.byKey(const ValueKey('display'));
        Text displayText = tester.firstWidget(display);
        expect(displayText.data, "4", reason: "display text");
      },
    );
  });
}
