import '../models/calculation.dart';
import '../services/local_storage_service.dart';

class CalculationRepository {
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<List<Calculation>> getCalculationHistory() async {
    return await _localStorageService.getCalculationHistory();
  }

  Future<void> saveCalculation(Calculation calculation) async {
    return await _localStorageService.saveCalculationHistory(calculation);
  }
  Future<void> deleteCalculation() async {
    return await _localStorageService.deleteCalculationHistory();
  }
}
