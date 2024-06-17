import 'package:flutter/material.dart';

import '../models/calculation_button_model.dart';
import 'custom_button.dart';

class ButtonGrid extends StatelessWidget {
  final List<String> values;
  final void Function(String) onPressed;

  const ButtonGrid({super.key, required this.values, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      itemCount: values.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) => CalculatorButton(
        props: CalculatorButtonModel(
          index: index,
          label: values[index],
        ),
        onPressed: () => onPressed(values[index]),
      ),
    );
    // return Column(
    //   children: values.map((row) {
    //     return Expanded(
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: row.map((value) {
    //           return Expanded(
    //             child: ElevatedButton(
    //               onPressed: () => onPressed(value),
    //               child: Text(
    //                 value,
    //                 style: const TextStyle(fontSize: 24.0),
    //               ),
    //             ),
    //           );
    //         }).toList(),
    //       ),
    //     );
    //   }).toList(),
    // );
  }
}
