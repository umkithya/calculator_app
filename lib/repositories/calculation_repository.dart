import '../models/calculation.dart';
import '../services/local_storage_service.dart';

class CalculationRepository {
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<void> deleteCalculation() async {
    try {
      await _localStorageService.deleteCalculationHistory();
    } catch (e) {
      print("e:$e");
    }
  }

  Future<List<Calculation>> getCalculationHistory() async {
    try {
      return await _localStorageService.getCalculationHistory();
    } catch (e) {
      print("e:$e");
      return [];
    }
  }

  Future<void> saveCalculation(Calculation calculation) async {
    try {
      await _localStorageService.saveCalculationHistory(calculation);
    } catch (e) {
      print("e:$e");
    }
  }
}
