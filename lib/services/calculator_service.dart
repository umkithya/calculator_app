import 'package:math_expressions/math_expressions.dart';

import '../models/calculation.dart';
import '../repositories/calculation_repository.dart';

class CalculatorService {
  final CalculationRepository _repository = CalculationRepository();

  Future<void> deleteHistory() async {
    return await _repository.deleteCalculation();
  }

  Future<String> evaluate(String expression) async {
    expression = expression.replaceAllMapped(
      RegExp(r'log10\(([^)]+)\)'),
      (Match m) => 'log(${m[1]}, 10)',
    );
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      final eval = exp.evaluate(EvaluationType.REAL, cm);

      if (eval.toString() == "Infinity" || eval.toString() == "NaN") {
        return 'Error';
      }
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }

  Future<List<Calculation>> getHistory() async {
    return await _repository.getCalculationHistory();
  }

  Future<void> saveCalculationHistory(Calculation calculation) async {
    await _repository.saveCalculation(calculation);
  }

  _isIntResult(dynamic result) {
    if (result.toString().endsWith(".0")) {
      return result =
          int.parse(result.toString().replaceAll(".0", "")).toString();
    } else {
      return result.toString();
    }
  }
}
