import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/models/incomes_model.dart';

class IncomesService {
  final CollectionReference incomesRef =
      FirebaseFirestore.instance.collection('accounts');

  Future<DocumentReference<Object?>> createIncomesCollection(
      String userId, IncomesModel incomes) async {
    return await incomesRef.doc(userId).collection('incomes').add({
      'value': incomes.value,
      'description': incomes.description,
      'date': incomes.date,
      'received': incomes.received,
      'category': incomes.category,
      'fileRefs': incomes.fileRefs,
      'moneyType': incomes.moneyType,
    });
  }

  Future<void> updateIncomesCollection(
      String userId, String incomesId, IncomesModel incomes) async {
    return await incomesRef
        .doc(userId)
        .collection('incomes')
        .doc(incomesId)
        .update({
      'value': incomes.value,
      'description': incomes.description,
      'date': incomes.date,
      'received': incomes.received,
      'category': incomes.category,
      'fileRefs': incomes.fileRefs,
      'moneyType': incomes.moneyType,
    });
  }

  Future<void> deleteIncomesCollection(String id) async {
    return await incomesRef.doc(id).delete();
  }

  Future<IncomesModel> getIncomesCollection(String id) async {
    DocumentSnapshot doc = await incomesRef.doc(id).get();
    return IncomesModel(
      value: doc['value'],
      description: doc['description'],
      date: doc['date'],
      received: doc['received'],
      category: doc['category'],
       
      fileRefs: doc['fileRefs'],
      moneyType: doc['moneyType'],
      id: doc.id,
    );
  }
   Future<List<IncomesModel>> getAllIncomes(String userId) async {
    QuerySnapshot<Object?> querySnapshot = await incomesRef
        .doc(userId)
        .collection('incomes')
        .get();
    return querySnapshot.docs
        .map((doc) => IncomesModel(
              value: doc['value'],
              description: doc['description'],
              date: doc['date'],
              received: doc['received'],
              category: doc['category'],
              fileRefs: doc['fileRefs'],
              moneyType: doc['moneyType'],
              id: doc.id,
            ))
        .toList();
  }
}
