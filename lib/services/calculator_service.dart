import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

import '../models/calculation.dart';
import '../repositories/calculation_repository.dart';

class CalculatorService {
  final CalculationRepository _repository = CalculationRepository();
  
  Future<void> deleteHistory() async {
    return await _repository.deleteCalculation();
  }

  Future<String> evaluate(String expression) async {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      String result = eval.toString();
      final calculation = Calculation(
          expression: expression,
          result: result,
          dateTime: DateFormat('MMM dd, yyyy h.mm a').format(DateTime.now()));
      await _repository.saveCalculation(calculation);
      return result;
    } catch (e) {
      return 'Error';
    }
  }

  Future<List<Calculation>> getHistory() async {
    return await _repository.getCalculationHistory();
  }
}
