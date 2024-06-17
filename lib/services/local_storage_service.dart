import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/calculation.dart';

class LocalStorageService {
  final String _historyKey = "history";
  Future<void> deleteCalculationHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }

  Future<List<Calculation>> getCalculationHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString(_historyKey);

    if (historyJson != null) {
      final List<dynamic> historyList = jsonDecode(historyJson);
      return historyList.map((e) => Calculation.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<void> saveCalculationHistory(Calculation calculation) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await getCalculationHistory();
    history.add(calculation);
    final historyJson = jsonEncode(history.map((e) => e.toJson()).toList());
    await prefs.setString(_historyKey, historyJson);
  }
}
