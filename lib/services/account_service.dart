import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/models/account_model.dart';

class AccountService {
  final CollectionReference accountCollection =
      FirebaseFirestore.instance.collection('accounts');

  Future<void> createAccount(Account account) async {
    return await accountCollection.doc(account.id).set({
      'total': account.total,
      'totalIncomes': account.totalIncomes,
      'totalExpenses': account.totalExpenses,
    });
  }

  Future<void> updateAccount(String userId, Account account) async {
    QuerySnapshot<Object?> snapshot =
        await accountCollection.where('userId', isEqualTo: userId).get();
    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs.first;
      return await accountCollection.doc(doc.id).update({
        'total': account.total,
        'totalIncomes': account.totalIncomes,
        'totalExpenses': account.totalExpenses,
      });
    }
    throw Exception('Account not found');
  }

  Future<void> deleteAccount(String id) async {
    return await accountCollection.doc(id).delete();
  }

  Future<Account> getAccount(String userId) async {
    QuerySnapshot<Object?> doc =
        await accountCollection.where('userId', isEqualTo: userId).get();

    if (doc.docs.isEmpty) {
      throw Exception('Account not found');
    }
    QueryDocumentSnapshot<Object?> account = doc.docs.first;

    return Account(
      total: account['total'],
      totalIncomes: account['totalIncomes'],
      totalExpenses: account['totalExpenses'],
      id: account.id,
    );
  }
}
