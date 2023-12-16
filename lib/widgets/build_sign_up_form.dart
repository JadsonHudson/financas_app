// import 'package:financas_app/screens/home_page.dart';
// import 'package:financas_app/services/auth.dart';
// import 'package:financas_app/screens/welcome_to_app.dart';
// import 'package:financas_app/services/account_service.dart';
// import 'package:financas_app/services/auth.dart';
import 'package:financas_app/controllers/user_controller.dart';
import 'package:financas_app/widgets/button_form.dart';
import 'package:financas_app/widgets/input_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../models/account.dart';

class BuildSignUpForm extends StatefulWidget {
  const BuildSignUpForm({Key? key}) : super(key: key);

  @override
  State<BuildSignUpForm> createState() => _BuildSignUpFormState();
}

class _BuildSignUpFormState extends State<BuildSignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UserController userController = UserController();

  String _email = '';
  String _password = '';
  String _confirmationPassword = '';
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
                      _email = email;
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
                      _password = password;
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
                      _confirmationPassword = confirmationPassword;
                    })
                  }),
          const SizedBox(height: 32),
          ButtonForm(
              buttonText: "Cadastrar",
              hasBackgroundColor: true,
              onPressed: () async {
                if (_formKey.currentState!.validate() &&
                    _password == _confirmationPassword) {
                  bool sucess = await userController.signUp(_email, _password);
                  if (sucess) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/HomePage');
                  }else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro ao cadastrar'),
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
