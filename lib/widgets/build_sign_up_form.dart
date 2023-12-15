// import 'package:financas_app/screens/home_page.dart';
// import 'package:financas_app/services/auth.dart';
// import 'package:financas_app/screens/welcome_to_app.dart';
import 'package:financas_app/services/auth.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:financas_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

class BuildSignUpForm extends StatefulWidget {
  const BuildSignUpForm({Key? key}) : super(key: key);

  @override
  State<BuildSignUpForm> createState() => _BuildSignUpFormState();
}

class _BuildSignUpFormState extends State<BuildSignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String confirmationPassword = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          InputField(
              label: "Email",
              controller: emailController,
              hint: "Insira o email",
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) => {
                    setState(() {
                      email = emailController.text;
                    })
                  }),
          const SizedBox(height: 12.0),
          InputField(
              label: "Senha",
              controller: passwordController,
              hint: "Insira a senha",
              keyboardType: TextInputType.visiblePassword,
              onChanged: (password) => {
                    setState(() {
                      password = passwordController.text;
                    })
                  }),
          const SizedBox(height: 12.0),
           InputField(
              label: "Confirme a senha",
              controller: confirmationPasswordController,
              hint: "Insira a senha",
              keyboardType: TextInputType.visiblePassword,
              onChanged: (confirmationPassword) => {
                    setState(() {
                      confirmationPassword = confirmationPasswordController.text;
                    })
                  }),
          const SizedBox(height: 32),
          ButtonForm(
              buttonText: "Cadastrar",
              hasBackgroundColor: true,
              onPressed: () async{
                    if (_formKey.currentState!.validate())
                      {
                        await _auth.signUp(email, password)
                    .then((value) =>
                        Navigator.pushReplacementNamed(context, '/HomePage'))
                    .catchError((onError) => { 
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(onError.toString()),
                          duration: const Duration(seconds: 3),
                        ),
                       
                      ),
                       // ignore: avoid_print
                       print(onError.toString()),
                    });
                      }
                  }),
        ],
      ),
    );
  }
}
