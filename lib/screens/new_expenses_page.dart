import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/controllers/expenses_controller.dart';
import 'package:financas_app/models/expenses_model.dart';

import 'package:financas_app/widgets/generic_card.dart';
import 'package:financas_app/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewExpensesPage extends StatefulWidget {
  const NewExpensesPage({Key? key}) : super(key: key);

  @override
  State<NewExpensesPage> createState() => _NewExpensesPageState();
}

class _NewExpensesPageState extends State<NewExpensesPage> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late ExpensesController expensesController;
  late ExpensesModel _newExpenses;
  User? user = FirebaseAuth.instance.currentUser;
  final String _moneyType = "BRL";
  bool _payed = true;
  bool _favorite = false;
  String description = "";
  Timestamp date = Timestamp.now();
  final String _category = "Investimento";
  @override
  void initState() {
    super.initState();
    expensesController = ExpensesController();

    _descriptionController.addListener(() {
      setState(() {
        description = _descriptionController.text;
      });
    });
  }

  @override
  void dispose() {
    _valueController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Color(0xFF18171C)),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 28,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Nova Despesa',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Flexible(
                    child: InputField(
                        label: "Valor da receita",
                        hint: "0,00",
                        controller: _valueController,
                        keyboardType: TextInputType.number),
                  ),
                  ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Row(
                        children: [
                          Text(
                            _moneyType,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ))
                ]),
              ),
              const SizedBox(height: 12),
              GenericCard(
                type: "bottom",
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle,
                            size: 28, color: Colors.grey),
                        const SizedBox(width: 32),
                        Text(
                          "${_payed ? "" : "Não "}" "Recebido",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const Spacer(),
                        Checkbox(
                          value: _payed,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _payed = newValue!;
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined,
                            size: 28, color: Colors.grey),
                        const SizedBox(width: 32),
                        ElevatedButton(
                          onPressed: () =>
                              {setState(() => date = Timestamp.now())},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.all(0)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFD74D4E)),
                            child: const Text(
                              "Hoje",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () => {
                            setState(() => date = Timestamp.fromDate(
                                DateTime.now()
                                    .subtract(const Duration(days: 1))))
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.all(0)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF4D4D55)),
                            child: const Text(
                              "Ontem",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.all(0)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF4D4D55)),
                            child: const Text(
                              "Outros...",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.mic_none_sharp,
                            size: 28, color: Colors.grey),
                        const SizedBox(width: 32),
                        Expanded(
                          child: SizedBox(
                              height: 36,
                              child: InputField(
                                label: "",
                                hint: "Descrição",
                                controller: _descriptionController,
                                keyboardType: TextInputType.text,
                              )),
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          icon: Icon(_favorite
                              ? Icons.favorite_outlined
                              : Icons.favorite_border_outlined),
                          iconSize: 28,
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              _favorite = !_favorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.bookmark_border_rounded,
                            size: 28, color: Colors.grey),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: Colors.blue.shade400,
                                    )),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.trending_up,
                                      size: 28,
                                      color: Colors.blue.shade400,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      _category,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 28,
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.wallet, size: 28, color: Colors.grey),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: Colors.blue.shade400,
                                    )),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 32.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.lightBlue,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: const Icon(
                                          Icons.attach_money,
                                          color: Colors.lightBlue,
                                          size: 18.0,
                                        )),
                                    const SizedBox(width: 12),
                                    const Text(
                                      "Carteira",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 28,
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.image_outlined,
                            size: 28, color: Colors.grey),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Anexo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 28,
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  ),
                  Center(
                      child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      child: Text(
                        "MAIS DETALHES",
                        style:
                            TextStyle(color: Color(0xFFD74D4E), fontSize: 16),
                      ),
                    ),
                  ))
                ],
              )
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD74D4E),
        elevation: 0,
        splashColor: Colors.black54,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.check,
          size: 28,
          color: Colors.white,
        ),
        onPressed: () {
          _newExpenses = ExpensesModel(
            value: double.parse(_valueController.text),
            description: _descriptionController.text,
            date: date,
            payed: _payed,
            favorite: _favorite,
            category: _category,
            moneyType: _moneyType,
          );
          expensesController.createExpense(user!.uid, _newExpenses);
          Navigator.pop(context, _newExpenses);
        },
      ),
    );
  }
}
