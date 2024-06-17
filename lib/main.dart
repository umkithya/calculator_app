import 'package:calculator_app/blocs/calculator_event.dart';
import 'package:calculator_app/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/calculator_bloc.dart';
import 'screens/calculator_screen.dart';
import 'services/calculator_service.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
            create: (context) => CalculatorBloc(CalculatorService()),
            child: const CalculatorScreen()),
        '/history': (context) => BlocProvider(
            create: (context) =>
                CalculatorBloc(CalculatorService())..add(LoadHistory()),
            child: const HistoryScreen()),
      },
    );
  }
}
