import 'package:financas_app/models/expenses_model.dart';
import 'package:financas_app/services/expenses_service.dart';

class ExpensesController {
  late final ExpensesService expensesService;
  ExpensesController() {
    expensesService = ExpensesService();
  }

  Future<void> createExpense(String userId, ExpensesModel expenses) async {
    try {
      await expensesService.createExpensesCollection(userId, expenses);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ExpensesModel>> getAllExpenses(String userId) async {
    try {
      final list = await expensesService.getAllExpenses(userId);
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }
}
