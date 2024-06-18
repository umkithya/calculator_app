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
          return Column(children: <Widget>[
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                alignment: Alignment.bottomRight,
                child: LayoutBuilder(
                  builder: (context, constraints) => FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      key: const ValueKey('display'),
                      display.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ),
              ),
            ),
            ButtonGrid(
              values: const [
                'sin',
                'cos',
                'tan',
                'CE',
                'sqrt',
                'log',
                'log',
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
              onPressed: (value) {
                if (value == '=') {
                  context.read<CalculatorBloc>().add(EvaluateExpression());
                } else if (value == '⌫') {
                  context.read<CalculatorBloc>().add(DeleteCharactor());
                } else if (value == 'CE') {
                  context.read<CalculatorBloc>().add(ClearExpression());
                } else {
                  context.read<CalculatorBloc>().add(ButtonPressed(value));
                }
              },
            ),
          ]);
        },
      ),
    );
  }
}
