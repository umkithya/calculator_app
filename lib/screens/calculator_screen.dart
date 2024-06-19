import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calculator_bloc.dart';
import '../blocs/calculator_event.dart';
import '../blocs/calculator_state.dart';
import '../widgets/button_grid.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, "/history");
            },
          ),
        ],
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          String display = '';
          if (state is CalculatorDisplay) {
            display = state.result.isNotEmpty ? state.result : state.expression;
          }
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 600 ? 600 : null,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildDisplay(context, display),
                    ButtonGrid(
                      values: const [
                        'sin',
                        'cos',
                        'tan',
                        'CE',
                        'sqrt',
                        'log',
                        'ln',
                        '^',
                        'e',
                        '(',
                        ')',
                        '/',
                        '7',
                        '8',
                        '9',
                        '*',
                        '4',
                        '5',
                        '6',
                        '-',
                        '1',
                        '2',
                        '3',
                        '+',
                        '0',
                        '.',
                        '⌫',
                        '='
                      ],
                      onPressed: (value) => _onButtonPressed(context, value),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDisplay(BuildContext context, String display) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
        alignment: Alignment.bottomRight,
        child: LayoutBuilder(
          builder: (context, constraints) => FittedBox(
            fit: BoxFit.contain,
            child: Text(
              key: const ValueKey('display'),
              display.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 600 ? 54 : 36,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context, String value) {
    final calculatorBloc = context.read<CalculatorBloc>();

    if (value == '=') {
      calculatorBloc.add(EvaluateExpression());
      calculatorBloc.add(SaveExpression());
    } else if (value == '⌫') {
      calculatorBloc.add(DeleteCharactor());
    } else if (value == 'CE') {
      calculatorBloc.add(ClearExpression());
    } else {
      calculatorBloc.add(ButtonPressed(value));
    }
  }
}
