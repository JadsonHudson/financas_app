import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/models/expenses_model.dart';

class ExpensesService {
  final CollectionReference expensesRef = FirebaseFirestore.instance.collection('account').doc('expenses').collection('expenses');

  Future<DocumentReference<Object?>> createExpenses(Expenses expenses) async {
    return await expensesRef.add({
      'value': expenses.value,
      'description': expenses.description,
      'date': expenses.date,
      'payed': expenses.payed,
      'category': expenses.category,
      'fileRefs': expenses.fileRefs,
      'moneyType': expenses.moneyType,
    });
  }

  Future<void> updateExpenses(String id, Expenses expenses) async {
    return await expensesRef.doc(id).update({
      'value': expenses.value,
      'description': expenses.description,
      'date': expenses.date,
      'payed': expenses.payed,
      'category': expenses.category,
      'fileRefs': expenses.fileRefs,
      'moneyType': expenses.moneyType,
    });
  }

  Future<void> deleteExpenses(String id) async {
    return await expensesRef.doc(id).delete();
  }

  Future<Expenses> getExpenses(String id) async {
    DocumentSnapshot doc = await expensesRef.doc(id).get();
    return Expenses(
      value: doc['value'],
      description: doc['description'],
      date: doc['date'],
      payed: doc['payed'],
      category: doc['category'],
      fileRefs: doc['fileRefs'],
      moneyType: doc['moneyType'],
      uid: doc.id,
    );
  }
}
