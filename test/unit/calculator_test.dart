// test/calculator_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:calculator_app/blocs/calculator_bloc.dart';
import 'package:calculator_app/blocs/calculator_event.dart';
import 'package:calculator_app/blocs/calculator_state.dart';
import 'package:calculator_app/services/calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Calculator', () {
    blocTest<CalculatorBloc, CalculatorState>(
      'addition',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('2'));
        bloc.add(const ButtonPressed('+'));
        bloc.add(const ButtonPressed('3'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "2", result: ""),
        const CalculatorDisplay(expression: "2+", result: ""),
        const CalculatorDisplay(expression: "2+3", result: ""),
        const CalculatorDisplay(expression: "5", result: "5")
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'substraction',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('3'));
        bloc.add(const ButtonPressed('-'));
        bloc.add(const ButtonPressed('3'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "3", result: ""),
        const CalculatorDisplay(expression: "3-", result: ""),
        const CalculatorDisplay(expression: "3-3", result: ""),
        const CalculatorDisplay(expression: "0", result: "0")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'multiplication',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('3'));
        bloc.add(const ButtonPressed('*'));
        bloc.add(const ButtonPressed('3'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "3", result: ""),
        const CalculatorDisplay(expression: "3*", result: ""),
        const CalculatorDisplay(expression: "3*3", result: ""),
        const CalculatorDisplay(expression: "9", result: "9")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'division',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('4'));
        bloc.add(const ButtonPressed('/'));
        bloc.add(const ButtonPressed('2'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "4", result: ""),
        const CalculatorDisplay(expression: "4/", result: ""),
        const CalculatorDisplay(expression: "4/2", result: ""),
        const CalculatorDisplay(expression: "2", result: "2")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'division by zero',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('6'));
        bloc.add(const ButtonPressed('/'));
        bloc.add(const ButtonPressed('0'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "6", result: ""),
        const CalculatorDisplay(expression: "6/", result: ""),
        const CalculatorDisplay(expression: "6/0", result: ""),
        const CalculatorDisplay(expression: "Error", result: "Error")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'Power',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('2'));
        bloc.add(const ButtonPressed('^'));
        bloc.add(const ButtonPressed('2'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "2", result: ""),
        const CalculatorDisplay(expression: "2^", result: ""),
        const CalculatorDisplay(expression: "2^2", result: ""),
        const CalculatorDisplay(expression: "4", result: "4")
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'square root',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('sqrt'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('9'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "sqrt", result: ""),
        const CalculatorDisplay(expression: "sqrt(", result: ""),
        const CalculatorDisplay(expression: "sqrt(9", result: ""),
        const CalculatorDisplay(expression: "sqrt(9)", result: ""),
        const CalculatorDisplay(expression: "3", result: "3")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'square root of negative number',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('sqrt'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('-'));
        bloc.add(const ButtonPressed('9'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "sqrt", result: ""),
        const CalculatorDisplay(expression: "sqrt(", result: ""),
        const CalculatorDisplay(expression: "sqrt(-", result: ""),
        const CalculatorDisplay(expression: "sqrt(-9", result: ""),
        const CalculatorDisplay(expression: "sqrt(-9)", result: ""),
        const CalculatorDisplay(expression: "Error", result: "Error")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'sin function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('sin'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "sin", result: ""),
        const CalculatorDisplay(expression: "sin(", result: ""),
        const CalculatorDisplay(expression: "sin(0", result: ""),
        const CalculatorDisplay(expression: "sin(0)", result: ""),
        const CalculatorDisplay(expression: "0", result: "0")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'cos function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('cos'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "cos", result: ""),
        const CalculatorDisplay(expression: "cos(", result: ""),
        const CalculatorDisplay(expression: "cos(0", result: ""),
        const CalculatorDisplay(expression: "cos(0)", result: ""),
        const CalculatorDisplay(expression: "1", result: "1")
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'tan function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('tan'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "tan", result: ""),
        const CalculatorDisplay(expression: "tan(", result: ""),
        const CalculatorDisplay(expression: "tan(0", result: ""),
        const CalculatorDisplay(expression: "tan(0)", result: ""),
        const CalculatorDisplay(expression: "0", result: "0")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'square function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('tan'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "tan", result: ""),
        const CalculatorDisplay(expression: "tan(", result: ""),
        const CalculatorDisplay(expression: "tan(0", result: ""),
        const CalculatorDisplay(expression: "tan(0)", result: ""),
        const CalculatorDisplay(expression: "0", result: "0")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'log function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('log'));
        bloc.add(const ButtonPressed('1'));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('1'));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed('0'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "log", result: ""),
        const CalculatorDisplay(expression: "log1", result: ""),
        const CalculatorDisplay(expression: "log10", result: ""),
        const CalculatorDisplay(expression: "log10(", result: ""),
        const CalculatorDisplay(expression: "log10(1", result: ""),
        const CalculatorDisplay(expression: "log10(10", result: ""),
        const CalculatorDisplay(expression: "log10(100", result: ""),
        const CalculatorDisplay(expression: "log10(100)", result: ""),
        const CalculatorDisplay(expression: "0.5", result: "0.5")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'exp function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('e'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('1'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "e", result: ""),
        const CalculatorDisplay(expression: "e(", result: ""),
        const CalculatorDisplay(expression: "e(1", result: ""),
        const CalculatorDisplay(expression: "e(1)", result: ""),
        const CalculatorDisplay(
            expression: "2.718281828459045", result: "2.718281828459045")
      ],
    );
    blocTest<CalculatorBloc, CalculatorState>(
      'ln function',
      build: () => CalculatorBloc(CalculatorService()),
      act: (bloc) {
        bloc.add(const ButtonPressed('ln'));
        bloc.add(const ButtonPressed('('));
        bloc.add(const ButtonPressed('1'));
        bloc.add(const ButtonPressed(')'));
        bloc.add(EvaluateExpression());
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const CalculatorDisplay(expression: "ln", result: ""),
        const CalculatorDisplay(expression: "ln(", result: ""),
        const CalculatorDisplay(expression: "ln(1", result: ""),
        const CalculatorDisplay(expression: "ln(1)", result: ""),
        const CalculatorDisplay(expression: "0", result: "0")
      ],
    );
  });
}
