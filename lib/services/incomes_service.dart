import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/models/incomes_model.dart';

class IncomesService {
  final CollectionReference incomesRef = FirebaseFirestore.instance.collection('accounts');

  Future<DocumentReference<Object?>> createIncomesCollection(String userId, Incomes incomes) async {
    return await incomesRef.doc(userId).collection('incomes').add({
      'value': incomes.value,
      'description': incomes.description,
      'date': incomes.date,
      'payed': incomes.payed,
      'category': incomes.category,
      'fileRefs': incomes.fileRefs,
      'moneyType': incomes.moneyType,
    });
  }

  Future<void> updateIncomesCollection(String id, String incomesId, Incomes incomes) async {
    return await incomesRef.doc(id).collection('incomes').doc(incomesId).update({
      'value': incomes.value,
      'description': incomes.description,
      'date': incomes.date,
      'payed': incomes.payed,
      'category': incomes.category,
      'fileRefs': incomes.fileRefs,
      'moneyType': incomes.moneyType,
    });
  }

  Future<void> deleteIncomesCollection(String id) async {
    return await incomesRef.doc(id).delete();
  }

  Future<Incomes> getIncomesCollection(String id) async {
    DocumentSnapshot doc = await incomesRef.doc(id).get();
    return Incomes(
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
