import 'package:financas_app/widgets/generic_card.dart';
import 'package:financas_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

class NewIncomePage extends StatefulWidget {
  const NewIncomePage({Key? key}) : super(key: key);

  @override
  State<NewIncomePage> createState() => _NewIncomePageState();
}

class _NewIncomePageState extends State<NewIncomePage> {
  final TextEditingController _controller1 = TextEditingController();
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
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 24,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Nova Receita',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Flexible(
                    child: InputField(
                        label: "Valor da receita",
                        hint: "0,00",
                        controller: _controller1,
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
                      child: const Row(
                        children: [
                          Text(
                            "BRL",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ))
                ]),
              ),
              const SizedBox(height: 16),
              GenericCard(
                type: "bottom",
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle,
                                size: 24, color: Colors.grey),
                            const SizedBox(width: 32),
                            const Text(
                              "Pago",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.calendar_month),
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined,
                                size: 24, color: Colors.grey),
                            const SizedBox(width: 32),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFFF5353)),
                              child: const Text(
                                "Hoje",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined,
                                size: 24, color: Colors.grey),
                            const SizedBox(width: 32),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFFF5353)),
                              child: const Text(
                                "Hoje",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined,
                                size: 24, color: Colors.grey),
                            const SizedBox(width: 32),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFFF5353)),
                              child: const Text(
                                "Hoje",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined,
                                size: 24, color: Colors.grey),
                            const SizedBox(width: 32),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFFF5353)),
                              child: const Text(
                                "Hoje",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                            Container(
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
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
