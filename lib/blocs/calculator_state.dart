import 'package:equatable/equatable.dart';

import '../models/calculation.dart';

class CalculatorDisplay extends CalculatorState {
  final String expression;
  final String result;

  const CalculatorDisplay({required this.expression, required this.result});

  @override
  List<Object> get props => [expression, result];
}

class CalculatorHistory extends CalculatorState {
  final List<Calculation> history;

  const CalculatorHistory(this.history);

  @override
  List<Object> get props => [history];
}

class CalculatorHistoryError extends CalculatorState {
  final String message;

  const CalculatorHistoryError(this.message);
}

class CalculatorHistoryLoading extends CalculatorState {}

class CalculatorInitial extends CalculatorDisplay {
  const CalculatorInitial({required super.expression, required super.result});
}

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}
