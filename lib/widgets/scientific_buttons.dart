// import 'package:calculator_app/widgets/calculator_buttons.dart';
// import 'package:flutter/material.dart';

// import '../models/calculation_button_model.dart';

// class ScientificButtons extends StatelessWidget {
//   const ScientificButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final buttons = [
//       CalculatorButtonModel(label: 'Sci', isAction: true),
//       CalculatorButtonModel(label: 'CE', isAction: true),
//       CalculatorButtonModel(label: '^'),
//       CalculatorButtonModel(label: '/'),
//       CalculatorButtonModel(label: 'sin'),
//       CalculatorButtonModel(label: 'cos'),
//       CalculatorButtonModel(label: 'tan'),
//       CalculatorButtonModel(label: '*'),
//       CalculatorButtonModel(label: 'ln'),
//       CalculatorButtonModel(label: 'log'),
//       CalculatorButtonModel(label: '√'),
//       CalculatorButtonModel(label: '-'),
//       CalculatorButtonModel(label: 'π'),
//       CalculatorButtonModel(label: 'e'),
//       CalculatorButtonModel(label: '!'),
//       CalculatorButtonModel(label: '+'),
//       CalculatorButtonModel(label: '('),
//       CalculatorButtonModel(label: ')'),
//       CalculatorButtonModel(label: '⌫', isAction: true),
//       CalculatorButtonModel(label: '=', isAction: true),
//     ];
//     return GridView.builder(
//       // crossAxisCount: 4,
//       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//       itemCount: buttons.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       shrinkWrap: true,
//       itemBuilder: (context, index) => CalculatorButton(
//         props: CalculatorButtonModel(
//           index: index,
//           label: buttons[index].label,
//           isAction: buttons[index].isAction,
//         ),
//       ),
//     );
//   }
// }
