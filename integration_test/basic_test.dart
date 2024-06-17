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
      'Sum',
      (WidgetTester tester) async {
         app.main();
        await tester.pump(const Duration(seconds: 2));
        final calculatorScreen = CalculatorScreen(tester);
        await calculatorScreen.doBasicOperator(1, 2, basicOperator: "+");
        await tester.pumpAndSettle();
        final Finder display = find.byKey(const ValueKey('display'));
        Text displayText = tester.firstWidget(display);
        expect(displayText.data, "3", reason: "display text");
      },
    );
    testWidgets(
      'Minus',
      (WidgetTester tester) async {
         app.main();
        await tester.pump(const Duration(seconds: 2));
        final calculatorScreen = CalculatorScreen(tester);
        await calculatorScreen.doBasicOperator(2, 2, basicOperator: "-");
        await tester.pumpAndSettle();
        final Finder display = find.byKey(const ValueKey('display'));
        Text displayText = tester.firstWidget(display);
        expect(displayText.data, "0", reason: "display text");
      },
    );
    testWidgets(
      'Multiply',
      (WidgetTester tester) async {
         app.main();
        await tester.pump(const Duration(seconds: 2));
        final calculatorScreen = CalculatorScreen(tester);
        await calculatorScreen.doBasicOperator(2, 2, basicOperator: "*");
        await tester.pumpAndSettle();
        final Finder display = find.byKey(const ValueKey('display'));
        Text displayText = tester.firstWidget(display);
        expect(displayText.data, "4", reason: "display text");
      },
    );
    testWidgets(
      'Divide',
      (WidgetTester tester) async {
         app.main();
        await tester.pump(const Duration(seconds: 2));
        final calculatorScreen = CalculatorScreen(tester);
        await calculatorScreen.doBasicOperator(2, 2, basicOperator: "/");
        await tester.pumpAndSettle();
        final Finder display = find.byKey(const ValueKey('display'));
        Text displayText = tester.firstWidget(display);
        expect(displayText.data, "1", reason: "display text");
      },
    );
    testWidgets(
      'modulo',
      (WidgetTester tester) async {
         app.main();
        await tester.pump(const Duration(seconds: 2));
        final calculatorScreen = CalculatorScreen(tester);
        await calculatorScreen.doBasicOperator(2, 2, basicOperator: "%");
        await tester.pumpAndSettle();
        final Finder display = find.byKey(const ValueKey('display'));
        Text displayText = tester.firstWidget(display);
        expect(displayText.data, "0", reason: "display text");
      },
    );

    // testWidgets('Tap on decrement button, counter decrements',
    //     (WidgetTester tester) async {
    //
    //   await tester.pumpAndSettle();

    //   // Find the decrement button and tap it
    //   final Finder decrementButton = find.byIcon(Icons.remove);
    //   await tester.tap(decrementButton);
    //   await tester.pumpAndSettle();

    //   expect(find.text('Counter: -1'), findsOneWidget);
    // });

    // testWidgets('Tap on both increment and decrement buttons',
    //     (WidgetTester tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();

    //   // Find the increment button and tap it
    //   final Finder incrementButton = find.byIcon(Icons.add);
    //   await tester.tap(incrementButton);
    //   await tester.pumpAndSettle();

    //   expect(find.text('Counter: 1'), findsOneWidget);

    //   // Find the decrement button and tap it
    //   final Finder decrementButton = find.byIcon(Icons.remove);
    //   await tester.tap(decrementButton);
    //   await tester.pumpAndSettle();

    //   expect(find.text('Counter: 0'), findsOneWidget);
    // });
  });
}
