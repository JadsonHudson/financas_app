import 'package:financas_app/widgets/generic_card.dart';
import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
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
                      Row(children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_sharp),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.white,
                          iconSize: 24,
                        ),
                        const Text("Contas",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ]),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.inbox_outlined),
                            color: Colors.white,
                            iconSize: 24,
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.loop_sharp),
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
                                  Icons.monetization_on_outlined,
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
                                      "Saldo atual",
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
                                  Icons.monetization_on_outlined,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            child: Column(children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: 32.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.lightBlue,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: const Icon(
                                            Icons.attach_money,
                                            color: Colors.lightBlue,
                                            size: 20.0,
                                          )),
                                      const SizedBox(
                                        width: 16,
                                        height: 16,
                                      ),
                                      const Text(
                                        "Carteira",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () => {},
                                    icon: const Icon(Icons.more_vert_sharp),
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 52),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Saldo atual",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Saldo previsto",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "R\$ 1.000,00",
                                        style: TextStyle(
                                            color: Colors.green.shade400,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "R\$ 1.000,00",
                                        style: TextStyle(
                                            color: Colors.green.shade400,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
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
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFFFA4A0C),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
