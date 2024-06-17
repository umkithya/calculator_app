import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/calculator_service.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorService _calculatorService;
  String _expression = '';

  CalculatorBloc(this._calculatorService)
      : super(const CalculatorInitial(expression: '', result: "0")) {
    on<ButtonPressed>((event, emit) {
      _expression += event.value;

      emit(CalculatorDisplay(expression: _expression, result: ''));
    });

    on<EvaluateExpression>((event, emit) async {
      final result = await _calculatorService.evaluate(_expression);
      emit(CalculatorDisplay(
          expression: _isIntResult(result), result: _isIntResult(result)));
      _expression = _isIntResult(result);
    });

    on<ClearExpression>((event, emit) {
      _expression = '';
      emit(const CalculatorDisplay(expression: '', result: '0'));
    });
    on<DeleteCharactor>((event, emit) async {
      _expression = _expression.substring(0, _expression.length - 1);
      String result = '';
      if (_expression.isEmpty) {
        result = '0';
      }
      emit(CalculatorDisplay(expression: _expression, result: result));
    });

    on<LoadHistory>((event, emit) async {
      try {
        emit(CalculatorHistoryLoading());
        final history = await _calculatorService.getHistory();
        emit(CalculatorHistory(history));
      } catch (e) {
        emit(CalculatorHistoryError(e.toString()));
      }
    });
    on<DeleteHistory>((event, emit) async {
      try {
        emit(CalculatorHistoryLoading());
        await _calculatorService.deleteHistory();
        final calculation = await _calculatorService.getHistory();
        emit(CalculatorHistory(calculation));
      } catch (e) {
        emit(CalculatorHistoryError(e.toString()));
      }
    });
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
