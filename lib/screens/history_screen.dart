import 'package:calculator_app/models/calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calculator_bloc.dart';
import '../blocs/calculator_event.dart';
import '../blocs/calculator_state.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation History'),
        actions: [
          IconButton(
            onPressed: () => _clickDeleted(context),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          if (state is CalculatorHistoryLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CalculatorHistoryError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is CalculatorHistory) {
            return _buildHistoryList(state.history);
          } else {
            return const Center(
              child: Text('No history available.'),
            );
          }
        },
      ),
    );
  }

  Widget _buildHistoryList(List<Calculation> history) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.history_toggle_off_outlined),
          title: Text(
            "${history[index].expression} = ${history[index].result}",
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "${history[index].dateTime}",
            style: const TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }

  _clickDeleted(BuildContext context) {
    showDialog(
      context: context,
      builder: (childContext) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.delete),
            Text("Delete"),
          ],
        ),
        content: const Text("Are you sure you want to delete the history?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(childContext).maybePop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(childContext).maybePop();
                context.read<CalculatorBloc>().add(DeleteHistory());
              },
              child: const Text("OK")),
        ],
      ),
    );
  }

  void _confirmDeleteHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (childContext) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.delete),
            SizedBox(width: 8),
            Text("Delete History"),
          ],
        ),
        content: const Text("Are you sure you want to delete the history?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(childContext).maybePop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(childContext).maybePop();
              context.read<CalculatorBloc>().add(DeleteHistory());
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
