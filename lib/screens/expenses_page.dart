import 'dart:math';

import 'package:financas_app/controllers/expenses_controller.dart';
import 'package:financas_app/models/expenses_model.dart';
import 'package:financas_app/widgets/bottom_app_bar_custom.dart';
import 'package:financas_app/widgets/generic_card.dart';
import 'package:financas_app/widgets/menu_nav_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool toggle = false;
  late Animation _animation;
  User? user = FirebaseAuth.instance.currentUser;
  ExpensesController expensesController = ExpensesController();
  
  double pendingExpenses = 0;
  double expectedExpenses = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
        reverseDuration: const Duration(milliseconds: 275));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {});
    });
    sumOfTotalExpenses();
  }
void sumOfTotalExpenses() async {
    double pending = 0;
    double expected = 0;

    await expensesController
        .getAllExpenses(user!.uid)
        .then((value) => value.map((element) {
              if (element.payed) {
                pending += element.value;
              } else {
                expected += element.value;
              }
            }).toList());
    setState(() {
      pendingExpenses = pending;
      expectedExpenses = expected;
    });
  }
  void toggleAnimation() {
    setState(() {
      if (toggle) {
        toggle = !toggle;
        _controller.reverse();
      } else {
        toggle = !toggle;
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  maxWidth: viewportConstraints.maxWidth,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      bottom: MediaQuery.of(context).padding.bottom),
                  width: viewportConstraints.maxWidth,
                  color: const Color(0xFF18171C),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: const Row(children: [
                              Text("Despesas",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                                size: 24,
                              ),
                            ]),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.search_sharp),
                                color: Colors.white,
                                iconSize: 24,
                              ),
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.filter_alt_outlined),
                                color: Colors.white,
                                iconSize: 24,
                              ),
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.more_vert_sharp),
                                color: Colors.white,
                                iconSize: 24,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 24,
                          ),
                          const Text("Outubro",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_sharp),
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 24,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GenericCard(type: "bottom", children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_outlined,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Total pendente",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "R\$ ${pendingExpenses.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: Colors.red.shade400,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_balance_wallet_outlined,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Saldo previsto",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "R\$ ${expectedExpenses.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: Colors.red.shade400,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.0,
                                                vertical: 20.0),
                                            child: Text(
                                              "Hoje",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Row(children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: Colors.red.shade400,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.trending_up,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Saldo atual",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "Saldo previsto",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "R\$0,00",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .red.shade400,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const Text(
                                                        "R\$0,00",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ])
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          FutureBuilder<List<ExpensesModel>>(
                            future:
                                expensesController.getAllExpenses(user!.uid),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<ExpensesModel>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                // snapshot.data!.forEach((e) => print(e.value.toString()));
                                return SizedBox(
                                  height: 296,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) {
                                      ExpensesModel expenses =
                                          snapshot.data![index];
                                      return ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                          ),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.red.shade400,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.umbrella,
                                                        color: Colors.white,
                                                        size: 24,
                                                      )),
                                                  const SizedBox(
                                                    width: 24,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        expenses.category,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        (expenses.date
                                                            .toDate()
                                                            .toString()),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    expenses.value
                                                        .toDouble()
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    expenses.moneyType,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      )
                    ]),
                  ]),
                ),
              );
            },
          ),
          Visibility(
              visible: toggle,
              child: MenuNavPopup(
                toggle: toggle,
                controller: _controller,
                onToggle: toggleAnimation,
                userId: user!.uid,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.rotate(
        angle: _animation.value * pi * (3 / 4),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 375),
            height: 56,
            width: 56,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: const Color(0xFFFA4A0C),
              borderRadius: BorderRadius.circular(50),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              splashColor: Colors.black54,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 27,
                color: Colors.white,
              ),
              onPressed: () {
                toggleAnimation();
              },
            )),
      ),
      bottomNavigationBar: const BottomAppBarCustom(),
    );
  }
}
