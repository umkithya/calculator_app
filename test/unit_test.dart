// import 'package:bloc_test/bloc_test.dart';
// import 'package:calculator_app/blocs/calculator_bloc.dart';
// import 'package:calculator_app/blocs/calculator_event.dart';
// import 'package:calculator_app/blocs/calculator_state.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   group('CalculatorBloc', () {
//     late CalculatorBloc calculatorBloc;

//     setUp(() {
//       calculatorBloc = CalculatorBloc();
//     });

//     test('initial state is CalculatorInitial', () {
//       expect(calculatorBloc.state, const CalculatorInitial());
//     });
//     //* do Sum 1+1 expect =2
//     blocTest<CalculatorBloc, CalculatorState>(
//       'emits [CalculatorState(1)] add digit number 1',
//       build: () => calculatorBloc,
//       act: (bloc) => bloc.add(AddDigit("1")),
//       expect: () =>
//           [const CalculatorState(display: "1", isScientificMode: false)],
//     );
//     //* do calculation
//     blocTest<CalculatorBloc, CalculatorState>(
//       'emits [CalculatorState(1+)] add + sign',
//       build: () => calculatorBloc,
//       act: (bloc) {
//         bloc.add(AddDigit("1"));
//         bloc.add(AddDigit("+"));
//         bloc.add(AddDigit("1"));
//         bloc.add(PerformCalculation());
//       },
//       expect: () => [
//         const CalculatorState(display: "1", isScientificMode: false),
//         const CalculatorState(display: "1+", isScientificMode: false),
//         const CalculatorState(display: "1+1", isScientificMode: false),
//         const CalculatorState(display: "2", isScientificMode: false)
//       ],
//     );
//     // do Clear Display
//     blocTest<CalculatorBloc, CalculatorState>(
//       'emits [CalculatorState(0)] clear display',
//       build: () => calculatorBloc,
//       act: (bloc) {
//         bloc.add(ClearDisplay());
//       },
//       expect: () => [
//         const CalculatorState(display: "0", isScientificMode: false),
//       ],
//     );
//     tearDown(() {
//       calculatorBloc.close();
//     });
//   });
// }
