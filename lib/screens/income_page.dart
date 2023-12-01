import 'package:financas_app/screens/expenses_page.dart';
import 'package:financas_app/widgets/generic_card.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                          Text("Receita",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Total pendente",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "R\$ 1.000,00",
                                      style: TextStyle(
                                          color: Colors.green.shade400,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Saldo previsto",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "R\$ 1.000,00",
                                      style: TextStyle(
                                          color: Colors.green.shade400,
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
                                            horizontal: 4.0, vertical: 20.0),
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
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade400,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Saldo atual",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Saldo previsto",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "R\$0,00",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .green.shade400,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const Text(
                                                    "R\$0,00",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                      )
                    ],
                  )
                ]),
              ]),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ExpensesPage();
          }));
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFFFA4A0C),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
