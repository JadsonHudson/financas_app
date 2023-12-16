import 'package:financas_app/models/expenses_model.dart';
import 'package:financas_app/models/incomes_model.dart';

class Account {
  final String id;
  final double total;
  final double totalIncomes;
  final double totalExpenses;
  final List<Incomes>? incomes;
  final List<Expenses>? expenses;
  Account(
      {this.total = 0.0,
      this.totalIncomes = 0.0,
      this.totalExpenses = 0.0,
      this.incomes,
      this.expenses,
      required this.id});
}
