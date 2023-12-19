import 'package:cloud_firestore/cloud_firestore.dart';

class IncomesModel {
  final String? id;
  final double value;
  final String? description;
  final FieldValue date;
  final bool received;
  final String category;
  final String accountId;
  final bool? favorite;
  final String? fileRefs;
  final String moneyType;

  IncomesModel(
      {required this.value,
      required this.description,
      required this.date,
      required this.received,
      required this.category,
      required this.accountId,
      this.favorite = false,
      this.fileRefs,
      required this.moneyType,
         this.id});
}
