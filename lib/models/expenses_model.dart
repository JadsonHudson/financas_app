import 'dart:ffi';

class Expenses {
  final String? uid;
  final Double value;
  final String? description;
  final String date;
  final Bool payed;
  final String category;
  final String? fileRefs;
  final String moneyType;

  Expenses(
      {required this.value,
      required this.description,
      required this.date,
      required this.payed,
      required this.category,
      this.fileRefs,
      required this.moneyType,
      this.uid});
}
