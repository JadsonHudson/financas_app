// import 'package:financas_app/screens/new_expenses_page.dart';
// import 'package:financas_app/screens/new_income_page.dart';
import 'package:financas_app/widgets/menu_button_item.dart';
import 'package:flutter/material.dart';

class MenuNavPopup extends StatefulWidget {
  final bool toggle;
  final AnimationController controller;
  final VoidCallback onToggle;
  const MenuNavPopup(
      {Key? key,
      required this.toggle,
      required this.controller,
      required this.onToggle})
      : super(key: key);

  @override
  State<MenuNavPopup> createState() => _MenuNavPopupState();
}

class _MenuNavPopupState extends State<MenuNavPopup> {
  late bool toggle = widget.toggle;

  Alignment alignment1 = const Alignment(0.0, 1.1);
  Alignment alignment2 = const Alignment(0.0, 1.1);
  Alignment alignment3 = const Alignment(0.0, 1.1);
  Alignment alignment4 = const Alignment(0.0, 1.1);

  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;
  double size4 = 50.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        if (toggle) {
          // widget.controller.forward();
          Future.delayed(const Duration(milliseconds: 25), () {
            setState(() {
              alignment1 = const Alignment(-1, 0.4);
              size1 = 50;
            });
          });
          Future.delayed(const Duration(milliseconds: 50), () {
            setState(() {
              alignment2 = const Alignment(-0.4, -0.4);
              size2 = 50;
            });
          });
          Future.delayed(const Duration(milliseconds: 75), () {
            setState(() {
              alignment3 = const Alignment(0.4, -0.4);
              size3 = 50;
            });
          });
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              alignment4 = const Alignment(1, 0.4);
              size4 = 50;
            });
          });
        } else {
          // widget.controller.reverse();
          setState(() {
            alignment1 = const Alignment(0.0, 1.1);
            alignment2 = const Alignment(0.0, 1.1);
            alignment3 = const Alignment(0.0, 1.1);
            alignment4 = const Alignment(0.0, 1.1);
            size1 = size2 = size3 = size4 = 20;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(toggle ? 0 : 40),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        height: 312,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              duration: toggle
                                  ? const Duration(milliseconds: 275)
                                  : const Duration(milliseconds: 875),
                              alignment: alignment1,
                              curve: toggle ? Curves.easeIn : Curves.easeOut,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 275),
                                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                                  height: 96,
                                  width: 96,
                                  child: MenuButtonItem(
                                    icon: Icons.loop_sharp,
                                    label: 'Transferência',
                                    onTap: () {},
                                    color: const Color(0xFFFA4A0C),
                                  )),
                            ),
                            AnimatedAlign(
                              duration: toggle
                                  ? const Duration(milliseconds: 275)
                                  : const Duration(milliseconds: 875),
                              alignment: alignment2,
                              curve: toggle ? Curves.easeIn : Curves.easeOut,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 275),
                                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                                  height: 96,
                                  width: 96,
                                  child: MenuButtonItem(
                                    icon: Icons.trending_up,
                                    label: 'Receita',
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/NewIncomePage");
                                    },
                                    color: Colors.green.shade400,
                                  )),
                            ),
                            AnimatedAlign(
                              duration: toggle
                                  ? const Duration(milliseconds: 275)
                                  : const Duration(milliseconds: 875),
                              alignment: alignment3,
                              curve: toggle ? Curves.easeIn : Curves.easeOut,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 275),
                                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                                  height: 96,
                                  width: 96,
                                  child: MenuButtonItem(
                                    icon: Icons.credit_card,
                                    label: 'Despesa cartão',
                                    onTap: () {},
                                    color: Colors.blue.shade400,
                                  )),
                            ),
                            AnimatedAlign(
                              duration: toggle
                                  ? const Duration(milliseconds: 275)
                                  : const Duration(milliseconds: 875),
                              alignment: alignment4,
                              curve: toggle ? Curves.easeIn : Curves.easeOut,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 275),
                                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                                  height: 96,
                                  width: 96,
                                  child: MenuButtonItem(
                                    icon: Icons.trending_down,
                                    label: 'Despesa',
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/NewExpensesPage');
                                    },
                                    color: Colors.red.shade400,
                                  )),
                            ),
                          ],
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
