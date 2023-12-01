import 'package:financas_app/screens/sign_in.dart';
import 'package:financas_app/theme/images.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:flutter/material.dart';


class WelcomeToApp extends StatefulWidget {
  const WelcomeToApp({Key? key}) : super(key: key);

  @override
  State<WelcomeToApp> createState() => _WelcomeToAppState();
}

class _WelcomeToAppState extends State<WelcomeToApp> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.homePrintScreen,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              height: 388.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 174.0,
                    child: PageView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const Column(
                            children: [
                              SingleChildScrollView(
                                child: Text(
                                  "O jeito mais fácil de controlar suas finanças",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              SingleChildScrollView(
                                child: Text(
                                  "Cadastre-se, crie planejamentos, controle todos os seus gastos e muito mais!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 12.0),
                  ButtonForm(
                      buttonText: "Cadastrar",
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()))
                          }),
                  const SizedBox(height: 8.0),
                  ButtonForm(
                      buttonText: "Já sou cadastrado",
                      hasBackgroundColor: false,
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn(showLogin: false)))
                          }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
