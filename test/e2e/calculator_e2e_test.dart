import 'package:calculator_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Calculator end-to-end test', (WidgetTester tester) async {
    app.main();
    await tester.pump(const Duration(seconds: 5));

    // Find buttons by their text and tap them to perform '2 + 3 ='
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('3'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('='));
    await tester.pump(const Duration(seconds: 3));

    var display = find.byKey(const ValueKey('display'));
    await tester.pumpAndSettle();

    //  Verify the widget exists
    expect(display, findsOneWidget);
    Text textWidget = tester.widget(display);
    await tester.pumpAndSettle();

    // Verify the result is '5'
    expect(textWidget.data, '5');

    // Clear the expression
    await tester.tap(find.text('CE'));
    await tester.pumpAndSettle();

    // Perform another calculation '7 * 6 ='
    await tester.tap(find.text('7'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('*'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('6'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('='));
    await tester.pump(const Duration(seconds: 3));

    // Verify the result is '42'
    textWidget = tester.widget(display);
    await tester.pumpAndSettle();

    expect(textWidget.data, '42');

    // Clear the expression
    await tester.tap(find.text('CE'));
    await tester.pumpAndSettle();

    // Perform an advanced calculation 'sin(0) ='
    await tester.tap(find.text('sin'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('('));
    await tester.pumpAndSettle();
    await tester.tap(find.text('0'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(')'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('='));
    await tester.pump(const Duration(seconds: 3));

    // Verify the result is '0'
    textWidget = tester.widget(display);
    await tester.pumpAndSettle();

    expect(textWidget.data, '0');
    await tester.pumpAndSettle();

    // Open and check the history
    await tester.tap(find.byIcon(Icons.history));

    await tester.pump(const Duration(seconds: 5));
    expect(find.text('2+3=5'), findsAny);
    expect(find.text('7*6=42'), findsAny);
    expect(find.text('sin(0)=0'), findsAny);
  });
}
