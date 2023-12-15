import 'package:financas_app/theme/images.dart';
import 'package:financas_app/widgets/build_sign_in_form.dart';
import 'package:financas_app/widgets/build_sign_up_form.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final bool? showLogin;
  const SignIn({Key? key, this.showLogin = true}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late bool showLogin;
  @override
  void initState() {
    super.initState();
    showLogin = widget.showLogin!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF18171C),
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 56, horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              AppImages.presentation,
                              height: 128,
                              width: 196,
                            ),
                            const SizedBox(height: 36.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                        width: 2.0,
                                        color: showLogin
                                            ? const Color(0xFFFA4A0C)
                                            : Colors.transparent,
                                      )),
                                    ),
                                    child: TextButton(
                                      onPressed: () => {
                                        setState(() {
                                          showLogin = true;
                                        })
                                      },
                                      child: Text(
                                        "Entrar",
                                        style: TextStyle(
                                          color: showLogin
                                              ? const Color(0xFFFA4A0C)
                                              : const Color(0xFF666666),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 2.0,
                                          color: showLogin
                                              ? Colors.transparent
                                              : const Color(0xFFFA4A0C),
                                        ),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () => {
                                        setState(() {
                                          showLogin = false;
                                        })
                                      },
                                      child: Text(
                                        "Cadastrar",
                                        style: TextStyle(
                                          color: showLogin
                                              ? const Color(0xFF666666)
                                              : const Color(0xFFFA4A0C),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 36.0),
                          ],
                        ),
                        showLogin
                            ? const BuildSigInForm()
                            : const BuildSignUpForm(),
                      ],
                    ),
                  ),
                ))));
  }
}
