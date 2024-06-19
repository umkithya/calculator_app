import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class ButtonPressed extends CalculatorEvent {
  final String value;

  const ButtonPressed(this.value);

  @override
  List<Object> get props => [value];
}

class EvaluateExpression extends CalculatorEvent {}
class SaveExpression extends CalculatorEvent {}

class DeleteHistory extends CalculatorEvent {}

class ClearExpression extends CalculatorEvent {}
class DeleteCharactor extends CalculatorEvent {}

class LoadHistory extends CalculatorEvent {}
