import 'package:financas_app/screens/home_page.dart';
// import 'package:financas_app/screens/welcome_to_app.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:financas_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
    
class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({Key? key}) : super(key: key);

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        InputField(
            label: "E-mail ou Nome de Usuário",
            controller: _controller1,
            hint: "jadson hudson",
            keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 12.0),
        InputField(
            label: "Senha",
            controller: _controller2,
            hint: "senha",
            keyboardType:
                const TextInputType.numberWithOptions(decimal: false)),
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(0.0),
              ),
              child: const Text("Esqueceu a senha?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFFA4A0C),
                    fontSize: 14.0,
                  ))),
        ),
        const SizedBox(height: 24.0),
        ButtonForm(
            buttonText: "Entrar",
            hasBackgroundColor: true,
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const  HomePage()))
                }),
      ]),
    );
  }
}