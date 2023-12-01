import 'package:financas_app/screens/expenses_page.dart';
import 'package:financas_app/screens/income_page.dart';
import 'package:financas_app/screens/purchase_page.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:financas_app/widgets/generic_card.dart';
import 'package:financas_app/widgets/nav_button_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 40.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF18171C),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    child: Column(children: [
                      GenericCard(type: "top", children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () => {},
                              color: const Color(0xFFFA4A0C),
                              iconSize: 48.0,
                            ),
                            ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0.0,
                              ),
                              child: const Row(children: [
                                Text("Outubro",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500)),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.white, size: 32.0)
                              ]),
                            ),
                            const SizedBox(width: 16.0),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        Center(
                            child: Column(children: [
                          ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PurchasePage()))
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0.0,
                            ),
                            child: Column(
                              children: [
                                Text("Saldo em conta",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade400,
                                    )),
                                Text(
                                  "R\$ 0,00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 36.0,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey.shade400,
                                size: 32.0,
                              )),
                        ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const IncomePage()))
                              },
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  padding: EdgeInsets.zero),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Receitas",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Text(
                                        "R\$0.00",
                                        style: TextStyle(
                                          color: Colors.green.shade400,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => {  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ExpensesPage()))},
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  padding: EdgeInsets.zero),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red.shade400,
                                    radius: 20.0,
                                    child: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Receitas",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Text(
                                        "R\$0.00",
                                        style: TextStyle(
                                          color: Colors.red.shade400,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ]),
                      const SizedBox(height: 32.0),
                      GenericCard(
                          type: "middle",
                          title: "Contas",
                          icon: Icons.pause,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    const SizedBox(width: 16.0),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Carteira",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Text(
                                          "R\$0.00",
                                          style: TextStyle(
                                              color: Color(0xFF66BB6A),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  color: const Color(0xFFFA4A0C),
                                  iconSize: 32.0,
                                  onPressed: () {},
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 32,
                              thickness: 1,
                            ),
                            ButtonForm(
                                buttonText: "ADICIONAR UMA CONTA",
                                onPressed: () => {}),
                            const SizedBox(height: 24.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Text(
                                  "R\$0.00",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ]),
                      const SizedBox(height: 32.0),
                      GenericCard(
                          type: "middle",
                          title: "Cartões de crédito",
                          children: [
                            const Center(
                                child: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                              size: 32.0,
                            )),
                            const SizedBox(height: 24.0),
                            const Text(
                              "Ops! Você ainda não tem nenhum cartão de crétido cadastrado.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "Melhore seu controle financeiro agora!",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24.0),
                            ButtonForm(
                                buttonText: "ADICIONAR NOVO CARTÃO",
                                onPressed: () => {}),
                          ]),
                      const SizedBox(height: 32.0),
                      const GenericCard(
                        type: "middle",
                        title: "Despesas por categoria",
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  color: Colors.white, size: 128.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /* Aqui é o Icone responsável por mostrar o gráfico das despesas */
                                      Icon(Icons.circle,
                                          color: Colors.green, size: 12.0),
                                      SizedBox(width: 12.0),
                                      Text(
                                        "Alimentação",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 12.0),
                                      Text(
                                        "R\$0.00",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.circle,
                                          color: Colors.green, size: 12.0),
                                      SizedBox(width: 12.0),
                                      Text(
                                        "Alimentação",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 12.0),
                                      Text(
                                        "R\$0.00",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 32.0),
                      GenericCard(
                          type: "middle",
                          title: "Planejamento mensal",
                          children: [
                            const Center(
                              child: Icon(Icons.description,
                                  size: 32.0, color: Colors.grey),
                            ),
                            const SizedBox(height: 24.0),
                            const Text(
                              "Ops! Você ainda não tem nenhum planejamento definido para esse mês.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              "Melhore seu controle financeiro agora!",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24.0),
                            ButtonForm(
                                buttonText: "DEFINIR MEU PLANEJAMENTO",
                                onPressed: () => {}),
                          ]),
                      const SizedBox(height: 32.0),
                      const SizedBox(
                        width: double.infinity,
                        child: Column(children: [
                          Icon(Icons.settings, size: 56.0, color: Colors.grey),
                          SizedBox(height: 24.0),
                          Text(
                            "GERENCIAR TELA INICIAL",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                      )
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IncomePage()));
          },
          backgroundColor: const Color(0xFFFA4A0C),
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 64.0,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          color: const Color(0xFF37343b),
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavButtonItem(
                    label: "Home", icon: Icons.home, onPressed: () => {}),
                NavButtonItem(
                    label: "Transações", icon: Icons.list, onPressed: () => {}),
                const SizedBox(width: 32),
                NavButtonItem(
                    label: "Planejamento",
                    icon: Icons.flag,
                    onPressed: () => {}),
                NavButtonItem(
                    label: "Outros",
                    icon: Icons.more_horiz,
                    onPressed: () => {})
              ],
            ),
          ),
        ));
  }
}