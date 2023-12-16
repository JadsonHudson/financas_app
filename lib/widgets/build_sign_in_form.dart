// import 'package:financas_app/screens/home_page.dart';
// import 'package:financas_app/screens/welcome_to_app.dart';
import 'package:financas_app/services/auth.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:financas_app/widgets/input_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuildSigInForm extends StatefulWidget {
  const BuildSigInForm({Key? key}) : super(key: key);

  @override
  State<BuildSigInForm> createState() => _BuildSigInFormState();
}

class _BuildSigInFormState extends State<BuildSigInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        InputField(
            label: "E-mail ou Nome de Usuário",
            controller: _emailController,
            hint: "jadson hudson",
            keyboardType: TextInputType.emailAddress,
            onChanged: (newEmail) => {
                  setState(() {
                    email = newEmail;
                  })
                }),
        const SizedBox(height: 12.0),
        InputField(
            label: "Senha",
            controller: _passwordController,
            hint: "senha",
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            onChanged: (newPassword) => {
                  setState(() {
                    password = newPassword;
                  })
                }),
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
            onPressed: () async {
              
              if (_formKey.currentState!.validate()) {
                await _auth
                    .signIn(email, password)
                    .then((value) =>
                        Navigator.pushReplacementNamed(context, '/HomePage', arguments: value.user!.uid))
                    .catchError((onError) => { 
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(onError.toString()),
                          duration: const Duration(seconds: 3),
                        ),
                      ),
                    });
              }
            }),
      ]),
    );
  }
}
