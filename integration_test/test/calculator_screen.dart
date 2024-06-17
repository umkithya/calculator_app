import 'package:flutter_test/flutter_test.dart';

class CalculatorScreen {
  late WidgetTester tester;
  final Finder _equalSignButton = find.bySemanticsLabel("=");
  final Finder _ceSignButton = find.bySemanticsLabel("CE");
  final Finder _sciSignButton = find.bySemanticsLabel("Sci");
  CalculatorScreen(this.tester);
  Future<void> doAdvanceOperator(String math, num num) async {
    print("$math===$num");
    await tester.pumpAndSettle();
    await tester.tap(_sciSignButton);
    await tester.pump(const Duration(seconds: 5));
    final Finder btn = find.bySemanticsLabel(math);
    await tester.tap(btn);
    await tester.pump(const Duration(seconds: 3));

    await tester.tap(_sciSignButton);

    await tester.pumpAndSettle();

    //b
    // List<String> charBList = num.toString().split('');
    // print("num:$charBList");
    // for (int i = 0; i < charBList.length; i++) {
    //   final Finder btn = find.bySemanticsLabel(charBList[i]);
    //   await tester.tap(btn);
    //   await tester.pump(const Duration(seconds: 1));
    // }

    // await tester.pumpAndSettle();

    // //Find button = and tap it
    // await tester.tap(_equalSignButton);
  }

  Future<void> doBasicOperator(num a, num b,
      {String basicOperator = "+"}) async {
    await tester.pumpAndSettle();
    await tester.tap(_ceSignButton);
    List<String> charAList = a.toString().split('');
    //* tab a value
    for (int i = 0; i < charAList.length; i++) {
      final Finder btn = find.bySemanticsLabel(charAList[i]);
      await tester.tap(btn);
      await tester.pump(const Duration(seconds: 1));
    }
    final Finder basicOperatorButton = find.bySemanticsLabel(basicOperator);
    await tester.pumpAndSettle();
    await tester.tap(basicOperatorButton);
    await tester.pumpAndSettle();

    //b
    List<String> charBList = b.toString().split('');
    for (int i = 0; i < charBList.length; i++) {
      final Finder btn = find.bySemanticsLabel(charBList[i]);
      await tester.tap(btn);
      await tester.pump(const Duration(seconds: 1));
    }
    await tester.pumpAndSettle();

    //Find button = and tap it
    await tester.tap(_equalSignButton);
  }
}
