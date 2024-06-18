import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../models/calculation_button_model.dart';

class CalculatorButton extends StatelessWidget {
  final CalculatorButtonModel props;
  final void Function() onPressed;
  const CalculatorButton(
      {super.key, required this.props, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NeumorphicRadio(
      
      onChanged: (_) => onPressed(),
      style: NeumorphicRadioStyle(
        unselectedColor: _getColor(props.index!),
        boxShape: const NeumorphicBoxShape.circle(),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            props.label!,
            style: TextStyle(
              fontSize: 20,
              color: _getColorIcon(props.index!),
            ),
          ),
        ),
      ),
    );
  }

  Color? _getColor(int index) {
    if ((index + 1) % 4 == 0) {
      return const Color(0xffE97237);
    } else if (index > -1 && index < 11) {
      return const Color(0xffF5EAE3);
    } else {
      return const Color(0xfff6f6f6);
    }
  }

  Color? _getColorIcon(int index) {
    if ((index + 1) % 4 == 0) {
      return const Color(0xffffffff);
    } else if (index > -1 && index < 3) {
      return const Color(0xff383838);
    } else {
      return null;
    }
  }
}
