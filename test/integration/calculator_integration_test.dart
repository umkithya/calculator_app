import 'package:calculator_app/services/calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorService Integration', () {
    late CalculatorService calculatorService;

    setUp(() {
      calculatorService = CalculatorService();
    });

    test('should evaluate complex expression', () {
      expect(calculatorService.evaluate('2+3*4-5/2'), '9.5');
    });

    test('should handle history', () async {
      calculatorService.evaluate('2+3');
      calculatorService.evaluate('4*5');
      final history = await calculatorService.getHistory();
      expect(history.length, 2);
      expect(history[0].result, '5.0');
      expect(history[1].result, '20.0');
    });
  });
}
