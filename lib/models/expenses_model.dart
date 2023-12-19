import 'package:cloud_firestore/cloud_firestore.dart';

class ExpensesModel {
 final String? id;
  final double value;
  final String? description;
  final Timestamp date;
  final bool payed;
  final String category;
  
  final bool? favorite;
  final String? fileRefs;
  final String moneyType;

  ExpensesModel(
      {required this.value,
      required this.description,
      required this.date,
      required this.payed,
      required this.category,
      
      this.favorite = false,
      this.fileRefs,
      required this.moneyType,
         this.id});
}
