import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/models/expenses_model.dart';

class ExpensesService {
  final CollectionReference expensesRef =
      FirebaseFirestore.instance.collection('accounts');

  Future<DocumentReference<Object?>> createExpensesCollection(
      String userId, ExpensesModel expenses) async {
    return await expensesRef.doc(userId).collection('expenses').add({
      'value': expenses.value,
      'description': expenses.description,
      'date': expenses.date,
      'payed': expenses.payed,
      'category': expenses.category,
      'fileRefs': expenses.fileRefs,
      'moneyType': expenses.moneyType,
    });
  }

  Future<void> updateExpenses(
      String userId, String expensesId, ExpensesModel expenses) async {
    return await expensesRef
        .doc(userId)
        .collection('expenses')
        .doc(expensesId)
        .update({
      'value': expenses.value,
      'description': expenses.description,
      'date': expenses.date,
      'payed': expenses.payed,
      'category': expenses.category,
      'fileRefs': expenses.fileRefs,
      'moneyType': expenses.moneyType,
    });
  }

  Future<void> deleteExpenses(String userId, String expensesId) async {
    return await expensesRef
        .doc(userId)
        .collection('expenses')
        .doc(expensesId)
        .delete();
  }

  Future<ExpensesModel> getExpenses(String userId, String expensesId) async {
    DocumentSnapshot doc = await expensesRef
        .doc(userId)
        .collection('expenses')
        .doc(expensesId)
        .get();
    return ExpensesModel(
      value: doc['value'],
      description: doc['description'],
      date: doc['date'],
      payed: doc['payed'],
      category: doc['category'],
      fileRefs: doc['fileRefs'],
      moneyType: doc['moneyType'],
      id: doc.id,
    );
  }

  Future<List<ExpensesModel>> getAllExpenses(String userId) async {
    QuerySnapshot<Object?> querySnapshot = await expensesRef
        .doc(userId)
        .collection('expenses')
        .get();
    return querySnapshot.docs
        .map((doc) => ExpensesModel(
              value: doc['value'],
              description: doc['description'],
              date: doc['date'],
              payed: doc['payed'],
              category: doc['category'],
              fileRefs: doc['fileRefs'],
              moneyType: doc['moneyType'],
              id: doc.id,
            ))
        .toList();
  }
}
