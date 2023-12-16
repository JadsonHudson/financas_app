import 'dart:ffi';

class Incomes {
  final String? uid;
  final Double value;
  final String? description;
  final String date;
  final Bool payed;
  final String category;
  final String? fileRefs;
  final String moneyType;

  Incomes(
      {required this.value,
      required this.description,
      required this.date,
      required this.payed,
      required this.category,
      this.fileRefs,
      required this.moneyType,
      this.uid});
}
