import 'package:financas_app/models/incomes_model.dart';
import 'package:financas_app/services/incomes_service.dart';

class IncomesController {
  late final IncomesService incomesService;
  IncomesController() {
    incomesService = IncomesService();
  }

  Future<void> createIncome(String userId, IncomesModel income) async {
    try {
      await incomesService.createIncomesCollection(userId, income);
    } catch (e) {
      print(e);
    }
  }
}
