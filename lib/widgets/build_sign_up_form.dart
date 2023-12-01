import 'package:financas_app/screens/home_page.dart';
// import 'package:financas_app/screens/welcome_to_app.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:financas_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

class BuildSignUpForm extends StatefulWidget {
  const BuildSignUpForm({Key? key}) : super(key: key);

  @override
  State<BuildSignUpForm> createState() => _BuildSignUpFormState();
}

class _BuildSignUpFormState extends State<BuildSignUpForm> {
  final TextEditingController _controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          InputField(
              label: "Número de celular",
              controller: _controller1,
              hint: "Insira o número de celular",
              keyboardType: TextInputType.phone),
          const SizedBox(height: 12.0),
          InputField(
              label: "Senha",
              controller: _controller1,
              hint: "Insira a senha",
              keyboardType: TextInputType.visiblePassword),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end, // Add this line
            children: [
              Flexible(
                child: InputField(
                    label: "Código de verificação",
                    controller: _controller1,
                    hint: "Insira o código",
                    keyboardType: TextInputType.emailAddress),
              ),
              const SizedBox(width: 12.0),
              Flexible(
                child: ButtonForm(
                    buttonText: "Obter o código",
                    hasBackgroundColor: true,
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()))
                        }),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ButtonForm(
              buttonText: "Cadastrar",
              hasBackgroundColor: true,
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()))
                  }),
        ],
      ),
    );
  }
}
